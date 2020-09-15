package com.myweb.ctrl;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.myweb.domain.CommentDTO;
import com.myweb.domain.CommentVO;
import com.myweb.domain.Criterion;
import com.myweb.service.CommentService;

@RestController
@RequestMapping("/comment/**")
public class CommentCtrl {
	private static Logger log = LoggerFactory.getLogger(CommentCtrl.class);
	
	@Inject
	CommentService csv;
	
	@PostMapping(value = "/new", consumes = "application/json", produces = "application/text; charset=utf-8")
	public ResponseEntity<String> write(@RequestBody CommentVO cvo) {
		int isOk = csv.write(cvo);
		return isOk == 1? new ResponseEntity<>("댓글 등록 완료", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/list/{bno}/{page}", produces = { MediaType.APPLICATION_ATOM_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<CommentDTO> list(@PathVariable("bno") int bno, @PathVariable("page") int page) {
		Criterion cri = startpage(new Criterion(page, 10));
		return new ResponseEntity<CommentDTO>(csv.getList(cri, bno), HttpStatus.OK);

	}
	
	public Criterion startpage(Criterion cri) {
		 int pageNum = cri.getPageNum();
		 int amount = cri.getAmount();
		 int startlist = (pageNum-1) * amount;
		 
		 Criterion crit = new Criterion(amount,pageNum,startlist);
		 return crit;
	 }

	@DeleteMapping(value = "/{cno}", produces = "application/text; charset=utf-8")
	public ResponseEntity<String> delete(@PathVariable("cno") int cno) {
		return csv.delete(cno) == 1 ? new ResponseEntity<>("댓글이 삭제되었습니다.", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/{cno}", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(@PathVariable("cno") int cno, @RequestBody CommentVO cvo) {
		return csv.modify(cvo) == 1 ? new ResponseEntity<String>("댓글이 수정되었습니다!", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
