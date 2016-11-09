package com.kedu.arias.product.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kedu.arias.product.dto.ProductDto;
import com.kedu.arias.product.service.ProductService;
import com.kedu.arias.util.FileUploader;

@Controller
@RequestMapping("/product")
public class ProductInsertController {

	@Inject
	ProductService service;
	
	String savePath="D:/images/";
	int sizeLimit = 3 * 1024 * 1024;
	FileUploader fileUploader = FileUploader.getInstance();

	@RequestMapping(value = "/product_insert", method = RequestMethod.GET)
	public void product_insert() {

	}

	@RequestMapping(value = "/product_insert", method = RequestMethod.POST)
	public String product_insert(HttpServletRequest request) throws Exception {
		
		String imageNames[];
		String attach_path = "resources/product/product_main_image/";

		ProductDto pDto = new ProductDto();
		pDto.setP_main_img("dasd");
		pDto.setMember_id("201611030001");
		
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request; 
		imageNames=fileUploader.fileUpload(attach_path,"product_main_img", multi);
		
		for(int i=0;i<imageNames.length;i++){
			System.out.println("이미지 이름 : "+imageNames[i]);
		}
	
		return "/product/product_insert";
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public void main_test() {
	}

	@RequestMapping(value = "/map2", method = RequestMethod.GET)
	public void map() throws Exception {
		ProductDto pDto = new ProductDto();
		/*
		 * product_seq , p_main_img , member_id , product_name , product_price ,
		 * country_id , product_addr , product_addr_detail , product_info ,
		 * product_lat , product_lng , product_step)
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

		// pDao.step1_insert(pDto);
		// System.out.println(pDao.selectAllListOfCity());
	}

}
