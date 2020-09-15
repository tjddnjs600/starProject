package com.myweb.ctrl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.domain.Criterion;
import com.myweb.domain.TbagVO;
import com.myweb.service.TbagService;
import com.myweb.util.FileProcessor;


@Controller
@RequestMapping("/tbag/*")
public class TbagCtrl {
	private static Logger log = LoggerFactory.getLogger(TbagCtrl.class);
	
	@Inject
	TbagService tbsv;
	
	@Inject
	FileProcessor fp;
	
	@PostMapping("/addTb")
	public String add(TbagVO tbvo, RedirectAttributes reAttr) {
		int isOk = tbsv.addTb(tbvo);
		 if(isOk==1) { 
			 reAttr.addFlashAttribute("msg", "장바구니에 상품이 담겼습니다."); }
		 log.info("asdjfskl"+tbvo.getEmail());
		 reAttr.addAttribute("email",tbvo.getEmail());
		return "redirect:/tbag/toList";
	}

	
	   @PostMapping("/addCart")
	   public String addCart(TbagVO tbvo, RedirectAttributes reAttr, Criterion cri) {
	      int isOk = tbsv.addTb(tbvo);
	      
	      if(isOk == 1) {
	         reAttr.addFlashAttribute("msg","장바구니에 상품이 담겼습니다, 현재 페이지로 이동합니다.");
	      }
	      reAttr.addAttribute("tname", tbvo.getTname());
	      return "redirect:/tumbler/detailTum?pageNum="+cri.getPageNum()+"&amount="+cri.getAmount();
	   }

	
	@GetMapping("/toList")
	public void list(@RequestParam("email")String email, Model model) {
		model.addAttribute("tbagList", tbsv.list(email));
	}
	
	@GetMapping("/removeTb")
	public String remove(@RequestParam("tbagno") int tbagno,@RequestParam("email") String email) {
		tbsv.remove(tbagno);
		
		return "redirect:/tbag/toList?email="+email;
	}
	
	@PostMapping("/removeTb")
	public String remove(@RequestParam("check") List<Integer> tbagno, @RequestParam("email") String email, RedirectAttributes reAttr) {
		
		int count = tbagno.size();
		int nocount =0;
		log.info("dd:"+count);
		for (int i = 0; i < tbagno.size(); i++) {
			
			 tbsv.remove(tbagno.get(i));
			 nocount++;
		}
		
		if(count == nocount) {
			reAttr.addFlashAttribute("msg", "선택하신 상품이 삭제 되었습니다.");
		}
		reAttr.addAttribute("email", email);
		return "redirect:/tbag/toList";
	}
	
	@PostMapping("/modifyTb")
	public String modify(@RequestParam("check") List<Integer> tbagnoVal, @RequestParam("tname") List<String> tnameVal, 
			@RequestParam("tprice") List<Integer> tpriceVal, @RequestParam("tamount") List<Integer> tamountVal ,Model model) {
		
		ArrayList<TbagVO> tlist = new ArrayList<TbagVO>();
		for (int i = 0; i < tbagnoVal.size(); i++) {

			int tbagno = tbagnoVal.get(i);
			int tprice = tpriceVal.get(i);
			int tamount = tamountVal.get(i);
			String tname = tnameVal.get(i);
			
			TbagVO tbvo = new TbagVO(tbagno, tprice, tamount);
			TbagVO tbvo2 = new TbagVO(tbagno, tname, tprice, tamount);
			tlist.add(tbvo2);
			
			tbsv.modify(tbvo);
		}
			model.addAttribute("tlist", tlist);
			
		return "/torder/tpay";
	}
	
}
