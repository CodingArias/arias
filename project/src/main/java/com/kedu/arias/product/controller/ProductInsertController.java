package com.kedu.arias.product.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kedu.arias.product.dao.ProductDao;

@Controller
@RequestMapping("/product")
public class ProductInsertController {
	
	@Inject
	ProductDao pDao;
	
@RequestMapping(value="/product_insert",method=RequestMethod.GET)
public void product_insert(){
	System.out.println(pDao.selectAllListOfCity());
	
}
	

}
