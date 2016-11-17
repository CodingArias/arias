package com.kedu.arias.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kedu.arias.member.service.MemberService;
import com.kedu.arias.product.service.ProductService;
import com.kedu.arias.product.service.ReservationService;



@RestController
@RequestMapping("/member")
public class MemberRestController {

	@Inject
	ProductService productService;
	@Inject
	ReservationService reservService;
	@Inject
	MemberService memberService;
	@RequestMapping(value="/login_check/{member_email}/{member_pwd}", method=RequestMethod.POST)
	public ResponseEntity<String> login_check (
			@PathVariable("member_email") String member_email,
			@PathVariable("member_pwd") String member_pwd){
		
		ResponseEntity<String> entity = null;
		String loginFlag="0";
		try {
			String pwd=memberService.memberCheck(member_email);
			if(pwd!=null){
				if(pwd.equals(member_pwd)) {
					loginFlag="1";
				}
			}
			entity = new ResponseEntity<String>(loginFlag, HttpStatus.OK);		
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
