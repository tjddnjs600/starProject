package com.myweb.ctrl;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.domain.Criterion;
import com.myweb.service.CoffeeService;
import com.myweb.util.FileProcessor;

@Controller
@RequestMapping("/coffee/**")
public class CoffeeCtrl {
	private static Logger log = LoggerFactory.getLogger(CoffeeCtrl.class);

	@Inject
	CoffeeService cfsv;
	
	@Inject
	FileProcessor fp;
	
	@GetMapping("/orderCof")
	public void orderCof(Model model,String cname) {
		model.addAttribute("ordcoflist", cfsv.detailCoffee(cname));
	}
	
	@GetMapping("/alllist")
	public void alllist(Model model) {
		model.addAttribute("alllist", cfsv.allCoffee());
	}
	
	@GetMapping("/clist")
	public void clist(Model model, String category) {
		model.addAttribute("clist", cfsv.clistCoffee(category));
	}
	
	@GetMapping("/addCof")
	public void register(Model model) {
		
	}
	
	@PostMapping("/addCof")
	public String register(MultipartHttpServletRequest multiReq, RedirectAttributes reAttr, @RequestParam("category") String category) {
		int isOk = cfsv.addCoffee(fp.cofFileSave(multiReq));
		if (isOk > 0) {
			reAttr.addFlashAttribute("sign", "상품이 입력되었습니다.");
		}
		return "redirect:/coffee/clist?category="+category;
		
	}
	
	@PostMapping("/removeCof")
	public String remove(@RequestParam("cname") String cname, @RequestParam("cimg") String cimg, RedirectAttributes reAttr) {
		fp.fileRemove(cimg);
		int isOk = cfsv.removeCoffee(cname);
		
		if (isOk == 1) {
			reAttr.addFlashAttribute("msg", "삭제되었습니다.");
		}
		return "redirect:/coffee/alllist";
	}
	
	@GetMapping({"/detailCof","/modifyCof"})
	public void detail(@RequestParam("cname") String cname, Model model, @ModelAttribute("cri") Criterion cri) {
		model.addAttribute("cvo", cfsv.detailCoffee(cname));
	}
	
	@PostMapping("/modifyCof")
	public String modify(MultipartHttpServletRequest multiRq, RedirectAttributes reAttr, String cname) {
		int isOk = cfsv.modifyCoffee(fp.cofFileModify(multiRq));
		
		if (isOk == 1) {
			reAttr.addFlashAttribute("msg", "수정이 완료되었습니다.");
		}
		
		reAttr.addAttribute("cname", multiRq.getParameter("cname"));
		return "redirect:/coffee/detailCof";
	}

}
