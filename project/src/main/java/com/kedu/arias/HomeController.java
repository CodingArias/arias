package com.kedu.arias;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kedu.arias.product.service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private ProductService service;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) throws Exception {
		
		ModelAndView modelAndView =new ModelAndView();
		Date today = new Date();
		SimpleDateFormat f_date =new SimpleDateFormat("yyyy-MM-dd");
		modelAndView.setViewName("home");
		modelAndView.addObject("date", f_date.format(today));

		System.out.println(service.select_product_new());
		
		modelAndView.addObject("list", service.select_product_new());
		
		return modelAndView;
	}
	
	
}
