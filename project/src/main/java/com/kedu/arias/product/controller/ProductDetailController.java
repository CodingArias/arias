package com.kedu.arias.product.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kedu.arias.product.service.ProductService;

@Controller
public class ProductDetailController {

	@Inject
	private ProductService service;
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String home(@RequestParam("product_seq") int product_seq, Model model) throws Exception{
		
		
		System.out.println(service.select_product_detail(product_seq));
		model.addAttribute("product_detail",service.select_product_detail(product_seq));
		
		return "product/product_detail";
	}
}
