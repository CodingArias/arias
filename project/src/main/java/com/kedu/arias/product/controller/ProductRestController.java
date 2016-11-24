package com.kedu.arias.product.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kedu.arias.product.service.ProductService;
import com.kedu.arias.product.service.ReservationService;



@RestController
@RequestMapping("/product")
public class ProductRestController {

	@Inject
	ProductService productService;
	@Inject
	ReservationService reservService;
	
	@RequestMapping(value="/reserv_dupl_check/{product_seq}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> reserv_dupl_check (
			@PathVariable("product_seq") int product_seq)
	{
		String member_id = "201611170001";
		System.out.println("product_seq : "+ product_seq);
		System.out.println("member_id : "+ member_id);
		
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String,Object> map = new HashMap<>();
		
		try {
			boolean duplicate=false;
			//map.put("product", productService.select_product_detail(product_seq));
			//예약 중복 검사
			if(reservService.duplicateReservationCheck(member_id, product_seq)<1)
				duplicate=true;
			map.put("duplicate",duplicate);
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
/*	@RequestMapping(value="/cancelMyReservation/{reservation_seq}",method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> cancelMyReservation(
			@PathVariable("reservation_seq") int reservation_seq)
	{
		String member_id = "201611170001";
		System.out.println("product_seq : "+ product_seq);
		System.out.println("member_id : "+ member_id);
		
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String,Object> map = new HashMap<>();
		
		try {
			boolean duplicate=false;
			//map.put("product", productService.select_product_detail(product_seq));
			//예약 중복 검사
			if(reservService.duplicateReservationCheck(member_id, product_seq)<1)
				duplicate=true;
			map.put("duplicate",duplicate);
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
*/
}
