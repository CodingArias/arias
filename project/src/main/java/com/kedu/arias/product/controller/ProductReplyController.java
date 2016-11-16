package com.kedu.arias.product.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kedu.arias.product.dto.ReplyDto;
import com.kedu.arias.product.service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ProductReplyController {
	
	@Inject
	private ReplyService service;
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> insert_reply(@RequestBody ReplyDto dto) {
		ResponseEntity<String> entity = null;
		System.out.println(dto);
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
	
}
