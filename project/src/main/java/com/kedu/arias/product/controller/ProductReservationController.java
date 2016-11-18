package com.kedu.arias.product.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kedu.arias.common.dao.CountryDao;
import com.kedu.arias.common.dao.ProductOptionsDao;
import com.kedu.arias.member.dto.MemberDto;
import com.kedu.arias.product.dto.ProductDto;
import com.kedu.arias.product.dto.ReservationDto;
import com.kedu.arias.product.service.ProductService;
import com.kedu.arias.product.service.ReservationService;

@Controller
@RequestMapping("/product")
public class ProductReservationController {

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
		if(reservService.reservationHostCheck(product_seq, mDto.getMember_id())){
			reservList=reservService.selectReservationList(product_seq);
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
			HttpSession session) {
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
	public ModelAndView reservation_step_last(HttpSession session) {
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
}
