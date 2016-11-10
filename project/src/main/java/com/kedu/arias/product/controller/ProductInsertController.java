package com.kedu.arias.product.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kedu.arias.product.dto.ProductDto;
import com.kedu.arias.product.service.ProductService;
import com.kedu.arias.util.FileUploader;

@Controller
@RequestMapping("/product")
public class ProductInsertController {

	@Inject
	ProductService service;
	int sizeLimit = 3 * 1024 * 1024;
	FileUploader fileUploader = FileUploader.getInstance();

	@RequestMapping(value = "/product_insert_step1", method = RequestMethod.GET)
	public String product_insert() {

		System.out.println("이아아아아아아!!!!");
		return "/product/product_insert_step1";
	}

	@RequestMapping(value = "/product_insert_step1", method = RequestMethod.POST)
	public String product_insert(HttpServletRequest request,ProductDto pDto,
			RedirectAttributes redirectAttributes) throws Exception {
		
		String imageNames[];
		//이미지가 저장될 가상 디렉토리
		String attach_path = "resources/product/product_main_image/";
		
		pDto.setMember_id("201611030001");
		System.out.println(pDto);
		
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request; 
		
		//이미지 저장 후 이름들을 반환한다.
		imageNames=fileUploader.fileUpload(attach_path,"product_main_img", multi);
		
		for(int i=0;i<imageNames.length;i++){
			System.out.println("이미지 이름 : "+imageNames[i]);
			pDto.setP_main_img(imageNames[i]);
		}
		service.step1_insert(pDto);
	
	    return "redirect:/product/product_insert_step2";
	}


	@RequestMapping(value = "/product_insert_step2", method = RequestMethod.GET)
	public String product_insert_step2() throws Exception {
		System.out.println("product_insert_step2 ");
		return "/product/product_insert_step2";
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
