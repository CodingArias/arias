package com.kedu.arias.product.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kedu.arias.member.dto.MemberDto;
import com.kedu.arias.member.service.MemberService;
import com.kedu.arias.product.dto.ProductDto;
import com.kedu.arias.product.service.ProductService;
import com.kedu.arias.product.service.ReservationService;

@Controller
public class ProductDetailController {

	@Inject
	private ProductService service;
	@Inject
	private ReservationService reservService;
	@Inject
	private MemberService memberService;
	
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String home(@RequestParam("product_seq") int product_seq, 
			@RequestParam("checkin") String checkin,
			@RequestParam("checkout") String checkout,
			@RequestParam("number_of_people") int number_of_people,
			HttpSession session ,
			Model model) throws Exception{
		MemberDto mDto = (MemberDto)session.getAttribute("member");
		int duplicate =0;
	
		if(mDto!=null){
			duplicate = reservService.duplicateReservationCheck(mDto.getMember_id(), product_seq);

		}
		
		System.out.println(service.select_product_detail(product_seq));
		ProductDto pDto = service.select_product_detail(product_seq);
		
		model.addAttribute("duplicate", duplicate);
		model.addAttribute("checkin", checkin);
		model.addAttribute("checkout", checkout);
		model.addAttribute("number_of_people", number_of_people);
		
		model.addAttribute("product_safety", service.product_safety(product_seq));
		model.addAttribute("product_convin", service.product_convin(product_seq));
		model.addAttribute("product_space", service.product_space(product_seq));
		model.addAttribute("product_regulation", service.product_regulation(product_seq));
		model.addAttribute("product_detail",pDto);
		model.addAttribute("product_member", service.product_member(product_seq));
		
		return "product/product_detail";
	}
	
	
}
