package com.myweb.ctrl;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.domain.Criterion;
import com.myweb.domain.MemberVO;
import com.myweb.domain.PagingVO;
import com.myweb.service.CorderService;
import com.myweb.service.GcardService;
import com.myweb.service.MemberService;
import com.myweb.service.TorderService;

@Controller
@RequestMapping("/member/*")
public class MemberCtrl {
	private static Logger log = LoggerFactory.getLogger(MemberCtrl.class);
	
	@Inject
	MemberService msv;
	
	@Inject
	GcardService gsv;
	
	@Inject
	TorderService tosv;
	
	@Inject
	CorderService cosv;
	
	@GetMapping("/mycoupon")
	public void mycoupon(@RequestParam("email")String email, Model model) {
		int coupon = msv.selectCou(email);
		model.addAttribute("coup", coupon);
	}
	
	@GetMapping("/buyList")
	public void buyList(@RequestParam("email")String email, Model model,Criterion cri) {
		cri = startpage(cri);
		int tCount = tosv.torderCount(email);
		model.addAttribute("tlist", tosv.getBuyList(cri,email));
		model.addAttribute("pgvo", new PagingVO(tCount, cri));
	}
	
	@GetMapping("/history")
	public void history(@RequestParam("email")String email, Model model,Criterion cri) {
		cri = startpage(cri);
		int cCount = cosv.corderCount(email);
		model.addAttribute("clist", cosv.listCorder(cri,email));
		model.addAttribute("pgvo", new PagingVO(cCount, cri));
	}
	
	@GetMapping("/mInfo")
	public void mInfo(@RequestParam("email")String email, Model model) {
		model.addAttribute("mvo", msv.memberInfo(email));
		
	}
	
	@RequestMapping("/admin")
	public void admin(Model model,Criterion cri) {
		cri = startpage(cri);
		int tCount = msv.mTotalCount();
		model.addAttribute("mlist", msv.getList(cri));
		model.addAttribute("pgvo", new PagingVO(tCount, cri));
	}
	
	public Criterion startpage(Criterion cri) {
		 int pageNum = cri.getPageNum();
		 int amount = cri.getAmount();
		 int startlist = (pageNum-1) * amount;
		 
		 Criterion crit = new Criterion(amount,pageNum,startlist);
		 return crit;
	 }
	
	@ResponseBody
	@GetMapping("/chkPwd")
	public String chkPwd(MemberVO mvo) {
		MemberVO mInfo = msv.login(mvo);
		if (mInfo != null) {
			return "1";
		} else {
			return "0";
		}
	}
	
	@ResponseBody
	@GetMapping(value = "/getAddr/{email}", 
			produces = {MediaType.APPLICATION_ATOM_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<MemberVO> getAddr(@PathVariable("email") String email){
		return new ResponseEntity<MemberVO>(msv.torderInfo(email),HttpStatus.OK);
	}
	
	@ResponseBody
	@GetMapping(value = "/getMemInfo/{email}", 
	produces = {MediaType.APPLICATION_ATOM_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<MemberVO> getMemInfo(@PathVariable("email") String email){
		return new ResponseEntity<MemberVO>(msv.memberInfo(email),HttpStatus.OK);
	}
	
	@ResponseBody
	@GetMapping(value = "/getCoupon/{email}", 
	produces = {MediaType.APPLICATION_ATOM_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Integer> getCoupon(@PathVariable("email") String email){
		return new ResponseEntity<Integer>(msv.selectCou(email),HttpStatus.OK);
	}
	
	@ResponseBody
	@GetMapping(value = "/chkGrade/{email}", 
	produces = {MediaType.APPLICATION_ATOM_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<MemberVO> chkGrade(@PathVariable("email") String email){
		int isOk = msv.upGrade(email);
		if (isOk == 1) {
			return new ResponseEntity<MemberVO>(HttpStatus.OK);
		} else {
			return new ResponseEntity<MemberVO>(HttpStatus.EXPECTATION_FAILED);
		}
		
	}
	
	@ResponseBody
	@GetMapping(value = "/chkStPoint/{email}", 
	produces = {MediaType.APPLICATION_ATOM_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<MemberVO> chkStPoint(@PathVariable("email") String email){
		int isOk = msv.upCouPoint(email);
		if (isOk == 1) {
			return new ResponseEntity<MemberVO>(HttpStatus.OK);
		} else {
			return new ResponseEntity<MemberVO>(HttpStatus.EXPECTATION_FAILED);
		}
	}
	
	@GetMapping("/join") 
	public void join() { }
	
	@PostMapping("/join")
	public String join(MemberVO mvo) {
		msv.join(mvo);
		return "redirect:/";
	}
	
	@ResponseBody
	@GetMapping("/checkEmail")
	public String checkEmail(@RequestParam("email") String email) {
		int isExt = msv.checkEmail(email);
		return isExt == 1 ? "1" : "0";
	}
	
	@PostMapping("/login")
	public String login(MemberVO mvo, HttpSession ses,RedirectAttributes reAttr,
			@RequestParam(value = "page",  defaultValue="0") int page) {
		String destPage = "";
		MemberVO mInfo = msv.login(mvo);
		if (mInfo != null) {
			ses.setAttribute("mInfo", mInfo);
			ses.setMaxInactiveInterval(60*30);
			reAttr.addFlashAttribute("msg", mInfo.getNick()+"님 환영합니다!");
			if (page == 0) {
				destPage = "redirect:/";
			} else if (page == 1) {
				destPage = "redirect:/member/myPage?email="+mInfo.getEmail();
			} else if (page == 2) {
				destPage = "redirect:/gcard/creg";
			} else if (page == 3) {
				destPage = "redirect:/tumbler/listTum";
			} else if (page == 4) {
				destPage = "redirect:/coffee/alllist";
			}
			
		} else {
			reAttr.addFlashAttribute("msg", "아이디나 비밀번호를 확인해 주세요");
			destPage = "redirect:/member/login";
		}
		return destPage;

	}
	
	@GetMapping("/login")
	public void login() {}
	
	@GetMapping("/logout")
	public String logout(HttpSession ses) {
		ses.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/myPage")
	public void myPage(@RequestParam("email") String email, Model model) {
		model.addAttribute("clist", gsv.gNameList(email));
	}
	
	@GetMapping("/modInfo")
	public void modInfo(@RequestParam("email") String email, Model model) {
		model.addAttribute("mvo", msv.memberInfo(email));
	}
	
	@PostMapping("/modInfo")
	public String modInfo(MemberVO mvo, RedirectAttributes reAttr) {
		int isOk = msv.modify(mvo);
		if (isOk == 1) {
			reAttr.addFlashAttribute("msg", "수정되었습니다.");
		}
		return "redirect:/member/myPage?email="+mvo.getEmail();
	}
	
	@GetMapping("/modPwd") public void modPwd(){}
	
	@PostMapping("/modPwd")
	public String modPwd(MemberVO mvo, @RequestParam("nPwd") String nPwd,RedirectAttributes reAttr,HttpSession ses) {
		MemberVO mInfo = msv.login(mvo);
		if (mInfo != null) {
			mInfo.setPwd(nPwd);
			msv.updatePwd(mInfo);
			reAttr.addFlashAttribute("msg", "비밀번호가 변경되었습니다 다시 로그인해 주세요");
			ses.invalidate();
			return "redirect:/";
		} else {
			reAttr.addFlashAttribute("msg", "비밀번호를 확인해 주세요");
			return "redirect:/member/myPage";
		}
	}
	
	@GetMapping("/mDelete")
	public String mDelete(@RequestParam("email") String email) {
		msv.resign(email);
		return "redirect:/member/admin";
	}
	
	@GetMapping("/resign")
	public String resign(@RequestParam("email") String email, RedirectAttributes reAttr, HttpSession ses) {
		int isRm = msv.resign(email);
		if (isRm == 1) {
			reAttr.addFlashAttribute("msg", "회원 탈퇴 되었습니다");
			ses.invalidate();
		}
		return "redirect:/";
	}
	
}
