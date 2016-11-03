package com.kedu.arias.product.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kedu.arias.product.dao.ProductDao;
import com.kedu.arias.product.dto.ProductDto;

@Controller
@RequestMapping("/product")
public class ProductInsertController {
	
	@Inject
	ProductDao pDao;
	
@RequestMapping(value="/product_insert",method=RequestMethod.GET)
public void product_insert(){
	//System.out.println(pDao.selectAllListOfCity());
}

@RequestMapping(value="/header",method=RequestMethod.GET)
public void main_test(){
}


@RequestMapping(value="/map2",method=RequestMethod.GET)
public void map()throws Exception{
	ProductDto pDto = new ProductDto();
	/*
	 * product_seq
                                       , p_main_img
                                       , member_id
                                       , product_name
                                       , product_price
                                       , country_id
                                       , product_addr
                                       , product_addr_detail
                                       , product_info
                                       , product_lat
                                       , product_lng
                                       , product_step)
	 */
	pDto.setP_main_img("메인 이미지");
	pDto.setMember_id("201611030001");
	pDto.setProduct_name("안녕!!!");
	pDto.setProduct_price(35454);
	pDto.setCountry_id(null);
	pDto.setProduct_addr("주소");
	pDto.setProduct_addr_detail("상세주소");
	pDto.setProduct_info("메인 소개");
	pDto.setProduct_simple_info("간단소개");
	pDto.setProduct_lat(213.1212);
	pDto.setProduct_lng(454.111);
	pDto.setProduct_step(1);
	
	//pDao.step1_insert(pDto);
	//System.out.println(pDao.selectAllListOfCity());
}

}
