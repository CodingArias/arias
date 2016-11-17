package com.kedu.arias.product.controller;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kedu.arias.product.service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ProductListController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductListController.class);
	
	@Inject
	private ProductService service;
	
	@RequestMapping(value = "/product/product_list", method = RequestMethod.GET)
	public String home(@RequestParam("member_id") String member_id, Model model) throws Exception {
		
		System.out.println(member_id);
		System.out.println(service.select_product_list(member_id));
		model.addAttribute("product_list", service.select_product_list(member_id));
		
		
		return "product/product_list";
	}
	
	
}
