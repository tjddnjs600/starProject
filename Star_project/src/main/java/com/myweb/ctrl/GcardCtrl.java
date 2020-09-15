package com.myweb.ctrl;

import java.util.List;
import java.util.Random;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.domain.GcardVO;
import com.myweb.service.GcardService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/gcard/*")
public class GcardCtrl {
	private static Logger log = LoggerFactory.getLogger(GcardCtrl.class);
	
	@Inject
	GcardService gsv;
	
	@ResponseBody
	@GetMapping("/getName")
	public JSONArray getName(@RequestParam("email") String email) {
		JSONObject nameObj = new JSONObject();
		JSONArray nameArr = new JSONArray();
		List<GcardVO> clist = gsv.gNameList(email);
		for (int i = 0; i < clist.size(); i++) {
			String gName = clist.get(i).getGname();
			nameObj.put("gname", gName);
			nameArr.add(nameObj);
		}
		return nameArr;
	}
	
	@GetMapping("/transfer")
	public void transfer(GcardVO gvo, Model model) {
		gsv.removeCard(gvo);
		model.addAttribute("clist", gsv.gNameList(gvo.getEmail()));
		model.addAttribute("gprice", gvo.getGprice());
	}
	
	@PostMapping("/transfer")
	public String transfer(GcardVO gvo) {
		gsv.transferCard(gvo);
		return "redirect:/gcard/mycard?email="+gvo.getEmail();
	}
	
	
	@PostMapping("/rmcard")
	public String rmcard(GcardVO gvo) {
		gsv.removeCard(gvo);
		return "redirect:/gcard/mycard?email="+gvo.getEmail();
	}
	
	@ResponseBody
	@GetMapping(value = "/getGnum/{gname}/{email}",
			produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<GcardVO> price(GcardVO gvo){
		return new ResponseEntity<GcardVO>(gsv.getPrice(gvo),HttpStatus.OK);
	}
	
	@GetMapping({"/charge","/rmcard"})
	public void charge(@RequestParam("email") String email, Model model) {
		model.addAttribute("clist", gsv.gNameList(email));
	}
	
	
	@PostMapping("/charge") 
	public String charge(GcardVO gvo, RedirectAttributes reAttr) { 
		int isOk = gsv.charge(gvo); 
		if (isOk == 1) {
			reAttr.addFlashAttribute("msg", "충전이 완료되었습니다"); 
		} 
		return "redirect:/gcard/mycard?email="+gvo.getEmail(); 
	}
	 
	 
	
	@GetMapping("/mycard")
	public void mycard(@RequestParam("email") String email, Model model) { 
		model.addAttribute("clist", gsv.getCardList(email));
	}
	
	@GetMapping("/creg")
	public void creg(Model model) {
		Random rd = new Random();
		int cnum1 = rd.nextInt(9999);
		int cnum2 = rd.nextInt(9999);
		int cnum3 = rd.nextInt(9999);
		int cnum4 = rd.nextInt(9999);
		String cnum = change(cnum1)+"-"+change(cnum2)+"-"+change(cnum3)+"-"+change(cnum4);
		model.addAttribute("cnum", cnum);
		
	}
	
	@PostMapping("/creg")
	public String creg(GcardVO gvo, RedirectAttributes reAttr) {
		int isOk = gsv.cardInsert(gvo);
		if (isOk == 1) {
			reAttr.addFlashAttribute("msg", "카드 등록이 완료되었습니다");
		}
		return "redirect:/gcard/mycard?email="+gvo.getEmail();
	}
	
	
	private String change(int cnum) {
		String number = "";
		if (cnum < 10) {
			number = "000"+cnum;
		} else if (cnum < 100 && cnum >= 10) {
			number = "00"+cnum;
		} else if (cnum < 1000 && cnum >= 100) {
			number = "0"+cnum;
		} else {
			number = cnum+"";
		}
		return number;
	}
}
