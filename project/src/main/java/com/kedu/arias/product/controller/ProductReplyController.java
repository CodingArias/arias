package com.kedu.arias.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kedu.arias.common.dto.PageCriteria;
import com.kedu.arias.common.dto.PageMakerDto;
import com.kedu.arias.member.dto.MemberDto;
import com.kedu.arias.product.dto.ReplyDto;
import com.kedu.arias.product.service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ProductReplyController {
	
	@Inject
	private ReplyService service;
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> insert_reply(@RequestBody ReplyDto dto, HttpSession session) {
		ResponseEntity<String> entity = null;
		System.out.println(dto);
	
		dto.setMember_id(((MemberDto)session.getAttribute("member")).getMember_id());
		
		try {
			service.insert_reply(dto);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	@RequestMapping(value = "/all/{product_seq}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyDto>> list_reply(@PathVariable("product_seq") int product_seq) {
		
		ResponseEntity<List<ReplyDto>> entity = null;
		try {
			entity = new ResponseEntity<>(service.list_reply(product_seq), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	@RequestMapping(value = "/{product_seq}/{member_id}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update_reply(@PathVariable("product_seq") int product_seq,
			@PathVariable("member_id") String member_id, @RequestBody ReplyDto dto){
		
		ResponseEntity<String> entity = null;
		System.out.println(dto);
		System.out.println(member_id);
		
		try {
			dto.setMember_id(member_id);
			dto.setProduct_seq(product_seq);
			
			service.update_reply(dto);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/{product_seq}/{member_id}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete_reply(@PathVariable("product_seq") int product_seq,
			@PathVariable("member_id") String member_id){
		
		ResponseEntity<String> entity = null;
		try {
			service.delete_reply(product_seq, member_id);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	@RequestMapping(value = "/{product_seq}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> reply_page(@PathVariable("product_seq") int product_seq,
			@PathVariable("page") int page) {
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			PageCriteria cri= new PageCriteria();
			cri.setPage(page);
			
			PageMakerDto pageMaker = new PageMakerDto();
			pageMaker.setCri(cri);
			
			Map<String, Object> map = new HashMap<String, Object>();
			List<ReplyDto> list = service.reply_page(product_seq, cri);
			
			map.put("list", list);
			
			int reply_count = service.reply_count(product_seq);
			pageMaker.setTotalCount(reply_count);
			
			map.put("pageMaker", pageMaker);
			
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
}
