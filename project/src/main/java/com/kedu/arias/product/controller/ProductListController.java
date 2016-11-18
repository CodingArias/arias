package com.kedu.arias.product.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kedu.arias.member.dto.MemberDto;
import com.kedu.arias.product.dto.ProductDto;
import com.kedu.arias.product.service.ProductService;
import com.kedu.arias.product.service.ReservationService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ProductListController {	
	
	private static final Logger logger = LoggerFactory.getLogger(ProductListController.class);
	
	@Inject
	private ProductService service;
	@Inject ReservationService reservService;
	
	@RequestMapping(value = "/product/product_list", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) throws Exception {
		
		
		//세션에 저장된 회원 불러오기
		MemberDto mDto = (MemberDto)session.getAttribute("member");
		String member_id = mDto.getMember_id();
		
		//회원이 작성한 숙소 리스트를 디비에서 불러온다.
		List<ProductDto> productList = service.select_product_list(member_id);
		model.addAttribute("product_list", productList);
		
		if(productList.size()<1)
			model.addAttribute("p_flag", false);
		else
			model.addAttribute("p_flag", true);
			
		
		return "product/product_list";
	}
	
	
}
