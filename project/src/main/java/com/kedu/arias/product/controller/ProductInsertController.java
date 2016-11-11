package com.kedu.arias.product.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import com.kedu.arias.product.dto.NotsalesDto;
import com.kedu.arias.product.dto.ProductDto;
import com.kedu.arias.product.service.ProductService;
import com.kedu.arias.util.FileUploader;
import com.kedu.arias.util.JsonManager;

@Controller
@RequestMapping("/product")
public class ProductInsertController {

	@Inject
	ProductService service;
	int sizeLimit = 3 * 1024 * 1024;
	FileUploader fileUploader = FileUploader.getInstance();
	JsonManager jsonManager = JsonManager.getInstance();

	@RequestMapping(value = "/product_insert_step1", method = RequestMethod.GET)
	public String product_insert() {

		System.out.println("이아아아아아아!!!!");
		return "/product/product_insert_step1";
	}

	// 숙소 저장 1단계
	@RequestMapping(value = "/product_insert_step1", method = RequestMethod.POST)
	public String product_insert(HttpServletRequest request, ProductDto pDto, RedirectAttributes redirectAttributes)
			throws Exception {

		HttpSession session = request.getSession();

		if (session.getAttribute("product_seq") != null) {
			session.removeAttribute("product_seq");
		}

		String imageNames[];
		// 이미지가 저장될 가상 디렉토리
		String attach_path = "resources/product/product_main_image/";
		String member_id = "201611030001";
		pDto.setMember_id(member_id);
		pDto.setProduct_seq(service.create_next_product_seq(member_id));
		System.out.println(pDto);
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;

		// 이미지 저장 후 이름들을 반환한다.
		imageNames = fileUploader.fileUpload(attach_path, "product_main_img", multi);

		for (int i = 0; i < imageNames.length; i++) {
			System.out.println("이미지 이름 : " + imageNames[i]);
			pDto.setP_main_img(imageNames[i]);
		}
		service.step1_insert(pDto);
		session.setAttribute("product_seq", pDto.getProduct_seq());
		return "redirect:/product/product_insert_step2";
	}

	// 숙소저장 2단계
	@RequestMapping(value = "/product_insert_step2", method = RequestMethod.GET)
	public String product_insert_step2(HttpServletRequest request) throws Exception {
		if (request.getSession().getAttribute("product_seq") != null) {
			System.out.println("product_seq : " + request.getSession().getAttribute("product_seq"));
		} else {
		}
		System.out.println("product_insert_step2 ");
		return "/product/product_insert_step2";
	}

	// 숙소저장 2단계
	@RequestMapping(value = "/product_insert_step2", method = RequestMethod.POST)
	public String product_insert_step2(HttpServletRequest request, ProductDto pDto,
			@RequestParam("notsales") String notsales) throws Exception {
		int product_seq = 0;
		if (request.getSession().getAttribute("product_seq") != null) {
			product_seq = (Integer) request.getSession().getAttribute("product_seq");
			pDto.setProduct_seq(product_seq);
		} else {

		}

		Gson gson = new Gson();
		JsonObject jsonObject = new JsonParser().parse(notsales).getAsJsonObject();
		String jsonString = jsonObject.get("notsales").toString();
		List<NotsalesDto> notsalesList = gson.fromJson(jsonString, new TypeToken<List<NotsalesDto>>() {
		}.getType());
		service.step2_insert(pDto);
		service.notsales_insert(product_seq, notsalesList);
		return "/product/product_insert_step2";
	}

	// 숙소저장 3단계
	@RequestMapping(value = "/product_insert_step3", method = RequestMethod.GET)
	public String product_insert_step3(HttpServletRequest request) throws Exception {
		if (request.getSession().getAttribute("product_seq") != null) {
			System.out.println("product_seq : " + request.getSession().getAttribute("product_seq"));
		} else {
		}
		System.out.println("product_insert_step2 ");
		return "/product/product_insert_step3";
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
