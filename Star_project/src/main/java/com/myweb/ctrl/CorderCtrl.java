package com.myweb.ctrl;

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

import com.myweb.domain.CbagVO;
import com.myweb.domain.CorderVO;
import com.myweb.domain.GcardVO;
import com.myweb.domain.MemberVO;
import com.myweb.service.CbagService;
import com.myweb.service.CoffeeService;
import com.myweb.service.CorderService;
import com.myweb.service.GcardService;
import com.myweb.service.MemberService;

@Controller
@RequestMapping("/corder/**")
public class CorderCtrl {
	private static Logger log = LoggerFactory.getLogger(CorderCtrl.class);
	
	@Inject
	CoffeeService csv;
	
	@Inject
	CbagService cbsv;
	
	@Inject
	CorderService cosv;
	
	@Inject
	MemberService msv;
	
	@Inject
	GcardService gsv;
	
	@GetMapping("/cpay")
	public void cpay(@ModelAttribute("cplist") List<CbagVO> cplist, Model model) {
	}
	
	@PostMapping("/starCard")
	public String starCard(@RequestParam("cbagno") List<Integer> cbagnoVal, @RequestParam("cname") List<String> cnameVal, 
			@RequestParam("cprice") List<Integer> cpriceVal, @RequestParam("csize") List<String> csizeVal, @RequestParam("hc") List<String> hcVal,
			MemberVO mvo,GcardVO gvo, @RequestParam("cpay") String cpay, @RequestParam("totalcofprice") int totalcofprice,
			@RequestParam("couChk") int couVal, RedirectAttributes reAttr) {
			
		for (int i = 0; i < cbagnoVal.size(); i++) {
			int cbagno = cbagnoVal.get(i);
			String cname = cnameVal.get(i);
			int cprice = cpriceVal.get(i);
			String csize = csizeVal.get(i);
			String hc = hcVal.get(i);
			
			CorderVO covo = new CorderVO(mvo.getEmail(),cname,1,cprice, cpay,"cu", csize, hc, mvo.getAddr(),mvo.getName(),mvo.getTel());
			cosv.orderCof(covo);
			
			cbsv.oneremove(cbagno);
		}
		int isOk = gsv.payCard(gvo);
		
		if (totalcofprice >= 10000) {
			msv.upPoint(mvo.getEmail());
		}
		
		if (couVal == 1) {
			msv.useCou(mvo.getEmail());
		}
		
		if (isOk == 1) {
			reAttr.addFlashAttribute("msg", "구매완료");
		}
		return "redirect:/cbag/cblist?email="+mvo.getEmail();
	}
	

	@PostMapping("/other")
	public String other(@RequestParam("cbagno") List<Integer> cbagnoVal, @RequestParam("cname") List<String> cnameVal, 
			@RequestParam("cprice") List<Integer> cpriceVal, @RequestParam("csize") List<String> csizeVal, @RequestParam("hc") List<String> hcVal,
			MemberVO mvo,GcardVO gvo, @RequestParam("cpay") String cpay, @RequestParam("totalcofprice") int totalcofprice, @RequestParam("couChk") int couVal) {
		
		for (int i = 0; i < cbagnoVal.size(); i++) {
			int cbagno = cbagnoVal.get(i);
			String cname = cnameVal.get(i);
			int cprice = cpriceVal.get(i);
			String csize = csizeVal.get(i);
			String hc = hcVal.get(i);
			
			CorderVO covo = new CorderVO(mvo.getEmail(),cname,1,cprice, cpay,"cu", csize, hc, mvo.getAddr(),mvo.getName(),mvo.getTel());
			cosv.orderCof(covo);
			
			cbsv.oneremove(cbagno);
		}
		
		if (totalcofprice >= 10000) {
			msv.upPoint(mvo.getEmail());
		}
		
		if (couVal == 1) {
			msv.useCou(mvo.getEmail());
		}
		
		return "redirect:/cbag/cblist?email="+mvo.getEmail();
	}
	


	@GetMapping("/Creditcard")
	public void Creditcard() {}
	
	

	
}
