package com.kedu.arias.product.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kedu.arias.common.dao.CountryDao;
import com.kedu.arias.common.dao.ProductOptionsDao;
import com.kedu.arias.member.dto.MemberDto;
import com.kedu.arias.member.service.MemberService;
import com.kedu.arias.product.dto.ProductDto;
import com.kedu.arias.product.dto.ReservationDto;
import com.kedu.arias.product.service.ProductService;
import com.kedu.arias.product.service.ReservationService;
import com.kedu.arias.util.JavaEnCryto;

@Controller
@RequestMapping("/product")
public class ProductReservationController {

	String key = "goodGame";
	@Inject 
	MemberService memberService;
	@Inject
	CountryDao countryDao;
	@Inject
	ProductService service;
	@Inject
	ProductOptionsDao productOptionsDao;
	@Inject
	ReservationService reservService;

	@RequestMapping(value = "/product_simple_detail", method = RequestMethod.GET)
	public ModelAndView product_simple_detail(HttpServletRequest request, Integer product_seq) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();

		modelAndView.addObject("product_member", service.product_member(product_seq));
		modelAndView.addObject("product_safety", service.product_safety(product_seq));
		modelAndView.addObject("product_convin", service.product_convin(product_seq));
		modelAndView.addObject("product_space", service.product_space(product_seq));
		modelAndView.addObject("product_regulation", service.product_regulation(product_seq));
		modelAndView.addObject("product", service.select_product_detail(product_seq));
		modelAndView.addObject("product_pic", service.selectAllproductPicture(product_seq));
		modelAndView.setViewName("/product/product_insert_step_last");

		System.out.println(service.select_product_detail(product_seq));
		return modelAndView;
	}

	
	@RequestMapping(value = "/reservation_list", method = RequestMethod.GET)
	public ModelAndView reservation_list(Integer product_seq,HttpSession session) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		MemberDto mDto = (MemberDto)session.getAttribute("member");
		List<ReservationDto> reservList =null;
		//예약리스트를 보려는 사람이 숙소 호스트인가?
		if(reservService.reservationHostCheck(product_seq, mDto.getMember_id())){
			modelAndView.addObject("product",service.select_product_detail(product_seq));
			modelAndView.addObject("product_safety", service.product_safety(product_seq));
			modelAndView.addObject("product_convin", service.product_convin(product_seq));
			modelAndView.addObject("product_space", service.product_space(product_seq));
			modelAndView.addObject("product_regulation", service.product_regulation(product_seq));
			modelAndView.addObject("product", service.select_product_detail(product_seq));
			//숙소의 예약 인원 리스트를 불러온다
			reservList=reservService.selectReservationList(product_seq);
			for(ReservationDto rDto: reservList){
				String enKey=JavaEnCryto.Encrypt(rDto.getMember_id(), key);
				rDto.setMember_id(enKey);
			}
			System.out.println("예약 인원 : "+reservList.size());
			System.out.println(reservList);
			
			modelAndView.addObject("reserv_list",reservList);
			modelAndView.setViewName("product/product_reservation_list");
		}else{
			modelAndView.setViewName("redirect:/");
		}
		return modelAndView;
	}


	@RequestMapping(value = "/reservation_step1", method = RequestMethod.GET)
	public ModelAndView reservation_step1(@ModelAttribute("reservation") ReservationDto reservDto, HttpSession session)
			throws Exception {
		ModelAndView modelAndView = new ModelAndView();

		System.out.println(reservDto);
		int product_seq = reservDto.getProduct_seq();
		ProductDto pDto = service.select_product_detail(product_seq);
		if (pDto.getNumber_of_people() > 100)
			pDto.setNumber_of_people(100);

		modelAndView.addObject("product", pDto);
		modelAndView.addObject("regulation", service.product_regulation(product_seq));
		modelAndView.addObject("product_seq", product_seq);
		modelAndView.addObject("notsales", reservService.selectInvalidReservationDate(product_seq));

		modelAndView.setViewName("/product/product_reservation_step1");
		System.out.println(reservService.selectInvalidReservationDate(product_seq));

		return modelAndView;
	}

	@RequestMapping(value = "/reservation_step1", method = RequestMethod.POST)
	public ModelAndView reservation_step1(ReservationDto reservDto, RedirectAttributes redirectAttributes,
			HttpSession session) throws Exception  {
		System.out.println(reservDto);
		ModelAndView modelAndView = new ModelAndView();
		if (reservDto != null) {
			reservDto.setMember_id(((MemberDto) session.getAttribute("member")).getMember_id());
			session.setAttribute("reservation_completed", "completed");
			redirectAttributes.addFlashAttribute("product_seq", reservDto.getProduct_seq());
			reservService.insertReservation(reservDto);
			modelAndView.setViewName("redirect:/product/reservation_step_last");
		} else
			modelAndView.setViewName("redirect:/");

		return modelAndView;
	}

	@RequestMapping(value = "/reservation_step_last", method = RequestMethod.GET)
	public ModelAndView reservation_step_last(HttpSession session)throws Exception  {
		ModelAndView modelAndView = new ModelAndView();
		if (session.getAttribute("reservation_completed") != null
				&& session.getAttribute("reservation_completed").equals("completed")) {
			session.removeAttribute("reservation_completed");
			modelAndView.setViewName("/product/product_reservation_step_last");
		} else {
			modelAndView.setViewName("redirect:/");
		}

		return modelAndView;
	}
	
	@RequestMapping(value = "/reservation_detail", method = RequestMethod.GET)
	public ModelAndView reservation_detail(
			HttpSession session,
			@RequestParam("member_id") String reserv_member_id,
			Integer product_seq,
			Integer reservation_seq)throws Exception {
		
		
		ModelAndView modelAndView = new ModelAndView();
		//멤버 아이디 복호화
		reserv_member_id = JavaEnCryto.Decrypt(reserv_member_id,key );
		
		MemberDto mDto =(MemberDto)session.getAttribute("member");	  // 로그인 한 유저의 정보 
		ProductDto pDto = service.select_product_detail(product_seq); // 현재 숙소 정보
		MemberDto reserv_mDto = memberService.read(reserv_member_id); // 예약한 당사자의 정보
		System.out.println(reserv_mDto);
		
		//멤버 아이디 암호화
		reserv_mDto.setMember_id(JavaEnCryto.Encrypt(reserv_mDto.getMember_id(), key));
		
		//예약정보는 숙소의 호스트나, 예약을 신청한 당사자만 볼 수 있다.
		if(mDto.getMember_id().equals(reserv_member_id) || pDto.getMember_id().equals(mDto.getMember_id()))
		{
			modelAndView.addObject("reserv_member",reserv_mDto);
			modelAndView.addObject("reservation",reservService.selectReservationDetail(product_seq, reserv_member_id,reservation_seq));
			modelAndView.setViewName("/product/product_reservation_detail");
		}
		else{
			modelAndView.setViewName("redirect:/");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/reservation_detail", method = RequestMethod.POST)
	public ModelAndView reservation_detail(
			ReservationDto reservDto)throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		
		reservDto.setMember_id(JavaEnCryto.Decrypt(reservDto.getMember_id(), key));
		System.out.println("reserv_member_id : "+reservDto.getMember_id());
		System.out.println("product_seq : "+reservDto.getProduct_seq());
		reservDto.setReserv_status(2);
		reservService.updateReservationStatus(reservDto);
		modelAndView.setViewName("redirect:/product/reservation_list?product_seq="+reservDto.getProduct_seq());
		return modelAndView;
	}
	
}
