package com.kedu.arias.product.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kedu.arias.member.dto.MemberDto;
import com.kedu.arias.product.service.ProductService;

@Controller
public class ProductSearchController {
	
	@Inject
	private ProductService service;
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String select_product_search(@RequestParam("lng") double lng,
										@RequestParam("lat") double lat,
										@RequestParam("checkin") String checkin,
										@RequestParam("checkout") String checkout,
										@RequestParam("number_of_people") int number_of_people, 
										@RequestParam("keyword") String keyword, 
										HttpSession session,
										Model model) throws Exception {
		
		
		MemberDto mDto = (MemberDto)session.getAttribute("member");
		
		
		
		double a = Math.round(lng*100000000000000d) / 100000000000000d;
		double b = Math.round(lat*100000000000000d) / 100000000000000d;
		
		
		model.addAttribute("lat", lat);
		model.addAttribute("lng", lng);
		model.addAttribute("checkin", checkin);
		model.addAttribute("checkout", checkout);
		model.addAttribute("number_of_people", number_of_people);
		model.addAttribute("keyword", keyword);
		
		
		System.out.println(service.select_product_search(a, b, number_of_people));
		
		model.addAttribute("list", service.select_product_search(a, b, number_of_people));
		
		return "product/product_search";
	}
	
}
