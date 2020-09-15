package com.myweb.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.myweb.domain.BoardVO;
import com.myweb.domain.CoffeeVO;
import com.myweb.domain.TumblerVO;

@Component
public class FileProcessor {
	private static Logger log = LoggerFactory.getLogger(FileProcessor.class);
	private static final String filePath = "tjddnjs600/imgs/";
	
	
	String imgfile = "";
	
	public BoardVO borFileSave(MultipartHttpServletRequest multiRq) {
		String email = multiRq.getParameter("email");
		String bcontent = multiRq.getParameter("bcontent");
		MultipartFile fileObj = multiRq.getFile("b_file");
		String btitle = multiRq.getParameter("btitle");
		int noticenum = Integer.parseInt(multiRq.getParameter("noticenum"));
		
		fileSave(fileObj);
		
		BoardVO bvo = new BoardVO(email, bcontent, imgfile, btitle,noticenum);
		return bvo;
	}
	
	public TumblerVO tumFileSave(MultipartHttpServletRequest multiRq) {
		String tname = multiRq.getParameter("tname");
		String tcontent = multiRq.getParameter("tcontent");
		int tprice = Integer.parseInt(multiRq.getParameter("tprice"));
		int ttotal = Integer.parseInt(multiRq.getParameter("ttotal"));
		MultipartFile fileObj = multiRq.getFile("timg");
		
		fileSave(fileObj);
		
		TumblerVO tvo = new TumblerVO(tcontent, imgfile, tname, tprice, ttotal);
		return tvo;
	}
	
	public BoardVO borFileModify(MultipartHttpServletRequest multiRq) {
		int refileSign = Integer.parseInt(multiRq.getParameter("refile"));
		String btitle = multiRq.getParameter("btitle");
		String email = multiRq.getParameter("email");
		String bcontent = multiRq.getParameter("bcontent");
		String old_bfile = multiRq.getParameter("old_bfile");
		int bno = Integer.parseInt(multiRq.getParameter("bno"));
	
		
		if(refileSign == 0) {
			imgfile = old_bfile;
			
		}else if(refileSign == 1) {
		fileRemove(old_bfile);
		imgfile = "NONE";
		
		}else if(refileSign == 2) {
			MultipartFile fileObj = multiRq.getFile("b_file");
			fileSave(fileObj);
	
		}
		BoardVO bvo = new BoardVO(bno, email, bcontent, imgfile, btitle);
		return bvo;
	}

	
	public TumblerVO tumFileModify(MultipartHttpServletRequest multiRq) {
		int refileSign = Integer.parseUnsignedInt(multiRq.getParameter("refile"));
		String tname = multiRq.getParameter("tname");
		String tcontent = multiRq.getParameter("tcontent");
		int tprice = Integer.parseInt(multiRq.getParameter("tprice"));
		int ttotal = Integer.parseInt(multiRq.getParameter("ttotal"));
		String old_bfile = multiRq.getParameter("old_bfile");
		
		if(refileSign == 0) {
			imgfile = old_bfile;
			
		}else if(refileSign == 1) {
		fileRemove(old_bfile);
		imgfile = "NONE";
		
		}else if(refileSign == 2) {
			MultipartFile fileObj = multiRq.getFile("timg");
			fileSave(fileObj);
		}
		
		TumblerVO tvo = new TumblerVO(tcontent, imgfile, tname, tprice, ttotal);
		return tvo;
	}

	
	public void fileSave(MultipartFile fileObj) {
		
		if(fileObj.getSize() == 0) {
			imgfile = "NONE";
		}else {
			String orgFile = fileObj.getOriginalFilename();
			String saveFile = UUID.randomUUID().toString()+"_"+orgFile;
			File objFile = new File(filePath+saveFile);
			try {
				fileObj.transferTo(objFile);
				imgfile = saveFile;
			}catch(IllegalStateException | IOException e) {
				log.info(">>> File Save Fail");
				e.printStackTrace();
			}
			
		}
	}
	
	public int fileRemove(String b_file) {
		boolean isRe = new File(filePath+b_file).delete();
		return isRe == true ? 1 : 0;
	}
	
	public CoffeeVO cofFileSave(MultipartHttpServletRequest multiRq) {
		
		String cate = multiRq.getParameter("category");
		String cname = multiRq.getParameter("cname");
		int cprice = Integer.parseInt(multiRq.getParameter("cprice"));
		int ctotal = Integer.parseInt(multiRq.getParameter("ctotal"));
		String ccontent = multiRq.getParameter("ccontent");
		String hc = multiRq.getParameter("hc");
		MultipartFile fileObj = multiRq.getFile("cimg");
		fileSave(fileObj);
		
		CoffeeVO covo = new CoffeeVO( cname, cprice, ccontent, imgfile, ctotal, cate, hc);
		return covo;
	}
	
	public CoffeeVO cofFileModify(MultipartHttpServletRequest multiRq) {
		int refileSign = Integer.parseUnsignedInt(multiRq.getParameter("refile"));
		String cname = multiRq.getParameter("cname");
		String cate = multiRq.getParameter("category");
		int cprice = Integer.parseInt(multiRq.getParameter("cprice"));
		String hc = multiRq.getParameter("hc");
		String old_bfile = multiRq.getParameter("old_bfile");
		String ccontent = multiRq.getParameter("ccontent");
		
		if(refileSign == 0) {
			imgfile = old_bfile;
			
		}else if(refileSign == 1) {
		fileRemove(old_bfile);
		imgfile = "NONE";
		
		}else if(refileSign == 2) {
			MultipartFile fileObj = multiRq.getFile("cimg");
			fileSave(fileObj);
		}
		
		CoffeeVO covo = new CoffeeVO( cname, cprice, ccontent, imgfile, cate, hc);
		return covo;
	}

	
}
