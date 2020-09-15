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

import com.myweb.domain.BoardVO;
import com.myweb.domain.Criterion;
import com.myweb.domain.PagingVO;
import com.myweb.service.BoardService;
import com.myweb.util.FileProcessor;

@Controller
@RequestMapping("/board/*")
public class BoardCtrl {
	private static Logger log = LoggerFactory.getLogger(BoardCtrl.class);
	
	@Inject
	BoardService bsv;
	
	@Inject
	FileProcessor fp;
	
	@GetMapping("/write")
	public void write(){}
	
	@PostMapping("/write")
	public String write(MultipartHttpServletRequest multiRq, RedirectAttributes reAttr) {
		int isOk = bsv.write(fp.borFileSave(multiRq));
		if(isOk > 0) {
			reAttr.addFlashAttribute("wSign", "게시글이 등록되었습니다.");
		}
		return "redirect:/board/blist";
	}
	
	@GetMapping("/blist")
	public void blist(Model model, Criterion cri) {
		cri = startpage(cri);
		model.addAttribute("bList", bsv.list(cri));
		int totalCount = bsv.totalCount(cri);
		model.addAttribute("bListvo", new PagingVO(totalCount, cri));
	}
	
	 public Criterion startpage(Criterion cri) {
		 int pageNum = cri.getPageNum();
		 int amount = cri.getAmount();
		 int startlist = (pageNum-1) * amount;
		 String type = cri.getType();
		 String keyword = cri.getKeyword();
		 
		 Criterion crit = new Criterion(pageNum,amount,type,keyword,startlist);
		 return crit;
	 }
	
	@GetMapping({"/bdetail","/bmodify"})
	public void bdetail(@RequestParam("bno") int bno, Model model, @RequestParam("wSign") int wSign,
			RedirectAttributes reAttr, @ModelAttribute("cri") Criterion cri) {
		
		BoardVO bvo = bsv.getBoard(bno);
		model.addAttribute("bvo", bvo);
		
		if(wSign > 0) {
			reAttr.addFlashAttribute("wSign", "게시글 수정 완료");
		}
	}
	
	@PostMapping("/bmodify")
	public String bmodify(MultipartHttpServletRequest multiRq, Criterion cri, RedirectAttributes reAttr) {
		int isOk = bsv.modify(fp.borFileModify(multiRq));
		
		return "redirect:/board/bdetail?wSign="+isOk+"&bno="+multiRq.getParameter("bno")+"&pageNum="+cri.getPageNum()+
				                              "&type="+cri.getType()+"&keyword="+cri.getKeyword();
	}
	
	@PostMapping("/bremove")
	public String bremove(@RequestParam("bno") int bno, @RequestParam("bfile") String bfile, RedirectAttributes reAttr, Criterion cri) {
	 int isRefile = fp.fileRemove(bfile);
	 int isOk = bsv.remove(bno);
	 
	 return "redirect:/board/blist?pageNum="+cri.getPageNum()+"&type="+cri.getType()+"&keyword="+cri.getKeyword();
	}
	
}
