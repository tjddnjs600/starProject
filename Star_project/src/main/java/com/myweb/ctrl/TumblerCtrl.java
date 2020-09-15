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
import com.myweb.domain.PagingVO;
import com.myweb.service.TumblerService;
import com.myweb.util.FileProcessor;

@Controller
@RequestMapping("/tumbler/*")
public class TumblerCtrl {
	private static Logger log = LoggerFactory.getLogger(TumblerCtrl.class);

	@Inject
	TumblerService tsv;
	
	@Inject
	FileProcessor fp;
	
	@GetMapping("/addTum")
	public void add() {}
	
	@PostMapping("/addTum")
	public String add(MultipartHttpServletRequest multiRq, RedirectAttributes reAttr) {
		int isOk = tsv.add(fp.tumFileSave(multiRq));
		
		if(isOk == 1) {
			reAttr.addFlashAttribute("msg","상품이 등록되었습니다");
		}
		return "redirect:/tumbler/listTum";
	}
	
	@GetMapping("/listTum")
	public void list(Model model, Criterion cri) {
		cri = startpage(cri);
		model.addAttribute("tlist", tsv.list(cri));
		int totalCount = tsv.totalCount(cri);
		model.addAttribute("tPageVO", new PagingVO(totalCount, cri));
	}
	
	 public Criterion startpage(Criterion cri) {
		 int pageNum = cri.getPageNum();
		 int amount = cri.getAmount();
		 int startlist = (pageNum-1) * amount;
		 
		 Criterion crit = new Criterion(amount,pageNum,startlist);
		 return crit;
	 }
	
	@GetMapping({"/detailTum","/modifyTum"})
	public void detail(@RequestParam("tname") String tname, Model model, @ModelAttribute("cri") Criterion cri) {
		model.addAttribute("tvo", tsv.getTumbler(tname));
	}
	
	@PostMapping("/modifyTum")
	public String modify(MultipartHttpServletRequest multiRq, RedirectAttributes reAttr, Criterion cri){
		
		int isOk = tsv.modify(fp.tumFileModify(multiRq));
		
		if(isOk == 1) {
			reAttr.addFlashAttribute("msg","수정이 완료되었습니다.");
		}
		
		reAttr.addAttribute("tname", multiRq.getParameter("tname"));
		return "redirect:/tumbler/detailTum?pageNum="+cri.getPageNum()+"&amount="+cri.getAmount();
	}
	
	
	@PostMapping("/removeTum")
	public String remove(@RequestParam("tname") String tname, @RequestParam("timg") String timg, Criterion cri, RedirectAttributes reAttr) { 
		 fp.fileRemove(timg);
		 int isOk = tsv.remove(tname);
		 
		 if(isOk == 1) {
				reAttr.addFlashAttribute("msg","상품이 삭제 되었습니다.");
			}
		
		return "redirect:/tumbler/listTum?pageNum="+cri.getPageNum()+"&amount="+cri.getAmount();
	}
}
