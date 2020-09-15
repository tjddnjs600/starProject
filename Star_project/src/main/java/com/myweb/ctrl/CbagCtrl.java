package com.myweb.ctrl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.domain.CbagVO;
import com.myweb.service.CbagService;

@Controller
@RequestMapping("/cbag/*")
public class CbagCtrl {
	private static Logger log = LoggerFactory.getLogger(CbagCtrl.class);
	
	@Inject
	CbagService cbsv;
	
	@ResponseBody
	@PostMapping("/add")
	public int addcbag(@RequestParam("datalist") String inputArr) {
		int isOk = 0;
			try {
				JSONParser parser = new JSONParser(); 
				JSONArray dataArr = new JSONArray();
				dataArr = (JSONArray) parser.parse(inputArr);
				for(int i=0; i<dataArr.size(); i++) {
					JSONObject dataobj = (JSONObject) dataArr.get(i);
					String email = (String) dataobj.get("email");
					String cname = (String) dataobj.get("cname");
					int cprice = Integer.valueOf((String) dataobj.get("cprice")) ;
					int camount = Integer.valueOf((String) dataobj.get("camount")) ;
					String csize = (String) dataobj.get("csize");
					String cimg = (String) dataobj.get("cimg");
					String hc = (String) dataobj.get("hc");
					CbagVO cbvo = new CbagVO(email,cname,cprice,camount,csize,cimg,hc);
					isOk = cbsv.addcbag(cbvo);
					isOk *= isOk;
					log.info(">>>>>>>>>>>>>>>>>>>>>"+isOk);
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return isOk;
	}
	
	@GetMapping("/cblist")
	public void cblist(Model model, @RequestParam("email")String email) {
		log.info(">>>>>>>>>>>>>>>>>>>>>>>>>cblist의 email"+email);
		model.addAttribute("cbaglist", cbsv.showlist(email));
//		JSONArray cblistjson = new JSONArray();
		//model.addAttribute("cblistjson", cblistjson.fromObject( cbsv.showlist(email)));
		
	}
	
	@PostMapping("/delchk")
	public String delchk(String[] cbagnum, @RequestParam("email") String email) {
		String[] cbaglist = cbagnum;
		log.info(">>>>>>>>>>>>>>>>>>>>>>>>"+cbagnum);
        for (int i = 0; i < cbaglist.length; i++) {
           int cbagno = Integer.parseInt(cbaglist[i]);
           log.info(">>>>>>>>>>>>>>>>>>>>>>>>"+cbagno);
           cbsv.oneremove(cbagno);
        }
        log.info(">>>>>>>email"+email);
        return "redirect:/cbag/cblist?email="+email;
        
     }

	@GetMapping("/delchk")
	public String delone(int cbagno , @RequestParam("email") String email) {
		cbsv.oneremove(cbagno);
		log.info(">>>>>>>email"+email);
		return "redirect:/cbag/cblist?email="+email;
	}
	
	@PostMapping("/delall")
	public String delone(@RequestParam("cbagnum") List<Integer> cbagno , @RequestParam("email") String email, RedirectAttributes reAttr) {
		
		for (int i = 0; i < cbagno.size(); i++) {
			
			 cbsv.oneremove(cbagno.get(i));
		}
		reAttr.addAttribute("email", email);
		return "redirect:/cbag/cblist";
	}
	
	@GetMapping("/cbdetail")
	public void cbdetail(int cbagno,Model model) {
		model.addAttribute("cbdetail", cbsv.showone(cbagno));
	}
	
	@PostMapping("/cbagmod")
	public String cbagmod(CbagVO cbvo) {
		cbsv.upmodify(cbvo);
		return "redirect:/cbag/cblist?email="+cbvo.getEmail();
	}
	
	@PostMapping("/cplist")
	public String cplist(@RequestParam("cbagnum") String[] cbagnum, Model model) {
		String[] cbagnolist = cbagnum;
		ArrayList<CbagVO> cplist = new ArrayList<CbagVO>();
		for(int i = 0; i<cbagnolist.length; i++) {
			
			int cbagno = Integer.parseInt(cbagnolist[i]);
			CbagVO cbvo = cbsv.cplist(cbagno); 
			
			cbvo = new CbagVO(cbvo.getCname(), cbvo.getCprice(), cbvo.getCsize(), cbvo.getHc(), cbagno);
			cplist.add(cbvo);
			
		}
		model.addAttribute("cplist", cplist);
		return "/corder/cpay";
	}
}
	




