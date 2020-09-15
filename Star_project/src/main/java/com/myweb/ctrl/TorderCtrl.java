package com.myweb.ctrl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.domain.GcardVO;
import com.myweb.domain.MemberVO;
import com.myweb.domain.TbagVO;
import com.myweb.domain.TorderVO;
import com.myweb.service.GcardService;
import com.myweb.service.MemberService;
import com.myweb.service.TbagService;
import com.myweb.service.TorderService;

@Controller
@RequestMapping("/torder/*")
public class TorderCtrl {
	private static Logger log = LoggerFactory.getLogger(TorderCtrl.class);

	
	@Inject
	TbagService tbsv;
	
	@Inject
	TorderService tosv;
	
	@Inject
	MemberService msv;
	
	@Inject
	GcardService gsv;
	
	@GetMapping("/tpay")
	public void tpay(@ModelAttribute("tlist")ArrayList<TbagVO> tlist, Model model) {
		model.addAttribute("tlist", tlist);
	}
	
	/*
	 * @PostMapping("/tpay") public void tpay() { ArrayList<TbagVO> tlist = new
	 * ArrayList<TbagVO>(); }
	 */
	
	@PostMapping("/starCard")
	public String starCard(@RequestParam("tbagno") List<Integer> tbagnoVal, @RequestParam("tname") List<String> tnameVal, 
			@RequestParam("tprice") List<Integer> tpriceVal, @RequestParam("tamount") List<Integer> tamountVal,
			MemberVO mvo,GcardVO gvo, @RequestParam("tpay") String tpay, @RequestParam("totalPrice") int totalPrice,
			RedirectAttributes reAttr) {
			
		for (int i = 0; i < tbagnoVal.size(); i++) {
			int tbagno = tbagnoVal.get(i);
			String tname = tnameVal.get(i);
			int tprice = tpriceVal.get(i);
			int tamount = tamountVal.get(i);
			
			TorderVO tovo = new TorderVO(tamount,mvo.getName(),mvo.getAddr(),mvo.getTel(),mvo.getEmail(),tname,tprice,tpay);
			tosv.insertTorder(tovo);
			
			tbsv.remove(tbagno);
		}
		int isOk = gsv.payCard(gvo);
		
		if (totalPrice >= 30000) {
			msv.upCou(mvo.getEmail());
		}
		
		if (isOk == 1) {
			reAttr.addFlashAttribute("msg", "구매완료");
		}
		
		return "redirect:/tbag/toList?email="+mvo.getEmail();
	}
	
	@PostMapping("/other")
	public String other(@RequestParam("tbagno") List<Integer> tbagnoVal, @RequestParam("tname") List<String> tnameVal, 
			@RequestParam("tprice") List<Integer> tpriceVal, @RequestParam("tamount") List<Integer> tamountVal,
			MemberVO mvo, @RequestParam("tpay") String tpay, @RequestParam("totalPrice") int totalPrice) {
		
		for (int i = 0; i < tbagnoVal.size(); i++) {
			int tbagno = tbagnoVal.get(i);
			String tname = tnameVal.get(i);
			int tprice = tpriceVal.get(i);
			int tamount = tamountVal.get(i);
			
			TorderVO tovo = new TorderVO(tamount,mvo.getName(),mvo.getAddr(),mvo.getTel(),mvo.getEmail(),tname,tprice,tpay);
			tosv.insertTorder(tovo);
			
			tbsv.remove(tbagno);
		}
		
		if (totalPrice >= 30000) {
			msv.upCou(mvo.getEmail());
		}
		
		return "redirect:/tbag/toList?email="+mvo.getEmail();
	}
	

	@GetMapping("/Creditcard")
	public void Creditcard() {}
	
	
}
