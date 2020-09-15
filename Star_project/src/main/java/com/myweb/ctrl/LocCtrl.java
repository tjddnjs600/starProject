package com.myweb.ctrl;

import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myweb.domain.CommentDTO;
import com.myweb.service.LocService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/loc/*")
public class LocCtrl {
   private static Logger log = LoggerFactory.getLogger(LocCtrl.class);
   
   @Inject
   LocService lsv;
   
   @GetMapping("/location")
   public String location(Model model) {
      log.info(">>>>>>"+lsv.getList().size());
      model.addAttribute("loclist", lsv.getList());
      JSONArray locjson = new JSONArray();
      model.addAttribute("locjson", locjson.fromObject(lsv.getList()));
//      for(int i = 0; i < lsv.getList().size(); i++) {
//         log.info(">>>>>>>>>>>>>>>>>>"+lsv.getList().get(i).getPlace());
//      }
      return "loc/location";
   }
   
   
   @GetMapping("/locsearch")
   public void locserach(){
      
   }
   
   @ResponseBody
   @PostMapping(value = "/locsearch", consumes = "application/json", produces = "application/json")
   public ResponseEntity<Map<String, Object>> maplist(@RequestBody Map<String, Object> map) {
      log.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+map);
      map.put("maplist", lsv.gpsList(map));
      log.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>LOC"+lsv.gpsList(map));
      
      return new ResponseEntity<Map<String,Object>>(map , HttpStatus.OK);
   }
//   @RequestMapping("/location")
//   @ResponseBody
//   public Map<String, Object> locinfo(){
//      Map<String, Object> loclist = new HashMap<>();
//      for(int i = 0; i < lsv.getList().size(); i++) {
//      loclist.put("place", lsv.getList().get(i).getPlace());
//      loclist.put("region", lsv.getList().get(i).getRegion());
//      loclist.put("width", lsv.getList().get(i).getWidth());
//      loclist.put("height", lsv.getList().get(i).getHeight());
//      }
//      return loclist;
//   }
   
//   @GetMapping("/list")
//   public void list(Model model) {
//      model.addAttribute("list", lsv.getList());
//   }
//   
}