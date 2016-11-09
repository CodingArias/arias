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
		

		String attach_path = "resources/product/product_main_image/";


		ProductDto pDto = new ProductDto();
		pDto.setP_main_img("dasd");
		pDto.setMember_id("201611030001");
		
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request; 
		fileUploader.fileUpload(attach_path,"product_main_img", multi);
		
		
		/*MultipartFile file = multi.getFile("product_main_img");
		String reNameFile = "";

		try {
			if (file.isEmpty()) { // 파일 유무 검사
				return reNameFile;
			} else if (file.getSize() > sizeLimit) {
				System.out.println("## 용량이 너무 큽니다. \n 3메가 이하로 해주세요.");
				return "error";
			}

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_hhmmss");
			Calendar c = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));

			String uploadDir = savePath + File.separator;
			new File(uploadDir).mkdir(); // 해당 경로 폴더 없을 떄 폴더 생성.
			String getFileName[] = file.getOriginalFilename().split("\\.");// 파일
																			// 이름
																			// 및
																			// 확장자
																			// 분리//
			// 파일 이름 설정 = 원본 파일 이름 _ 사용자ID _ 년월일분초 .확장자.

			reNameFile = getFileName[0] + "_" + sdf.format(c.getTime()) + "." + getFileName[1];
			file.transferTo(new File(savePath + reNameFile));

			System.out.println("fileName -----> \n" + file.getOriginalFilename() + " \n " + file.getSize()+ "\n reName : " + reNameFile);

		} catch (IOException e) {
			throw new RuntimeException(e.getMessage());
		}

		System.out.println(pDto);*/

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
