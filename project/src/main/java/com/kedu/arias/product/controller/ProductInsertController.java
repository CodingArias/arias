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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import com.kedu.arias.common.dao.CountryDao;
import com.kedu.arias.common.dao.ProductOptionsDao;
import com.kedu.arias.product.dto.NotsalesDto;
import com.kedu.arias.product.dto.ProductDto;
import com.kedu.arias.product.dto.ReservationDto;
import com.kedu.arias.product.service.ProductService;
import com.kedu.arias.product.service.ReservationService;
import com.kedu.arias.util.FileUploader;
import com.kedu.arias.util.JsonManager;

@Controller
@RequestMapping("/product")
public class ProductInsertController {

	@Inject
	CountryDao countryDao;
	@Inject
	ProductService service;
	@Inject
	ProductOptionsDao productOptionsDao;
	@Inject
	ReservationService reservService;
	int sizeLimit = 3 * 1024 * 1024;
	FileUploader fileUploader = FileUploader.getInstance();
	JsonManager jsonManager = JsonManager.getInstance();

	@RequestMapping(value = "/product_insert_step1", method = RequestMethod.GET)
	public ModelAndView product_insert(HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();

		if (session.getAttribute("product_step") != null && (Integer) session.getAttribute("product_step") != 1) {
			request.getSession().removeAttribute("product_step");
		}

		if (session.getAttribute("product_seq") != null) {
			session.removeAttribute("product_seq");
		}
		request.getSession().setAttribute("product_step", 1);
		modelAndView.setViewName("/product/product_insert_step1");
		modelAndView.addObject("country_list", countryDao.selectAllCountry());

		return modelAndView;
	}

	// 숙소 저장 1단계
	@RequestMapping(value = "/product_insert_step1", method = RequestMethod.POST)
	public ModelAndView product_insert(HttpServletRequest request, ProductDto pDto,
			RedirectAttributes redirectAttributes) throws Exception {

		HttpSession session = request.getSession();
		ModelAndView modelAndView = new ModelAndView();

		if ((Integer) request.getSession().getAttribute("product_step") == 1) {
			List<String> imageNames;
			// 이미지가 저장될 가상 디렉토리
			String attach_path = "resources/product/product_main_image/";
			String member_id = "201611170001";
			pDto.setMember_id(member_id);
			// product_seq 생성
			pDto.setProduct_seq(service.create_next_product_seq(member_id));

			MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;

			// 이미지 저장 후 이름들을 반환한다.
			imageNames = fileUploader.fileUpload(attach_path, "product_main_img", multi);

			if (imageNames != null && imageNames.size() > 0) {
				for (int i = 0; i < imageNames.size(); i++) {
					System.out.println("이미지 이름 : " + imageNames.get(i));
					pDto.setP_main_img(imageNames.get(i));
				}
			}
			service.step1_insert(pDto);
			session.setAttribute("product_seq", pDto.getProduct_seq());
			session.setAttribute("product_step", 2);
			modelAndView.setViewName("redirect:/product/product_insert_step2");
		} else {
			modelAndView.setViewName("redirect:/");
		}
		return modelAndView;
	}

	// 숙소저장 2단계
	@RequestMapping(value = "/product_insert_step2", method = RequestMethod.GET)
	public String product_insert_step2(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("product_seq") != null && session.getAttribute("product_step") != null) {
			if ((Integer) session.getAttribute("product_step") == 2) {
				return "/product/product_insert_step2";
			}
		}

		return "redirect:/";

	}

	// 숙소저장 2단계
	@RequestMapping(value = "/product_insert_step2", method = RequestMethod.POST)
	public String product_insert_step2(HttpServletRequest request, ProductDto pDto,
			@RequestParam("notsales") String notsales) throws Exception {
		HttpSession session = request.getSession();
		int product_seq = 0;
		if (session.getAttribute("product_seq") != null && session.getAttribute("product_step") != null) {
			product_seq = (Integer) session.getAttribute("product_seq");
			pDto.setProduct_seq(product_seq);

			Gson gson = new Gson();
			JsonObject jsonObject = new JsonParser().parse(notsales).getAsJsonObject();
			String jsonString = jsonObject.get("notsales").toString();
			List<NotsalesDto> notsalesList = gson.fromJson(jsonString, new TypeToken<List<NotsalesDto>>() {
			}.getType());
			service.step2_insert(pDto);

			if (notsalesList.size() > 0)
				service.notsales_insert(product_seq, notsalesList);
			session.setAttribute("product_step", 3);
			return "redirect:/product/product_insert_step3";

		} else {
			return "redirect:/";
		}

	}

	// 숙소저장 3단계
	@RequestMapping(value = "/product_insert_step3", method = RequestMethod.GET)
	public ModelAndView product_insert_step3(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();

		if (request.getSession().getAttribute("product_seq") != null
				&& request.getSession().getAttribute("product_step") != null
				&& (Integer) request.getSession().getAttribute("product_step") == 3) {

			modelAndView.addObject("building_codes", productOptionsDao.selectAllBuildingCode());
			modelAndView.addObject("accom_codes", productOptionsDao.selectAllAccomCode());
			modelAndView.addObject("bath_codes", productOptionsDao.selectAllBathCode());
			modelAndView.addObject("bed_codes", productOptionsDao.selectAllBedCode());
			modelAndView.addObject("regulation_codes", productOptionsDao.selectAllRegulationCode());
			modelAndView.addObject("convin_codes", productOptionsDao.selectAllConvinCode());
			modelAndView.addObject("safety_codes", productOptionsDao.selectAllSafetyCode());
			modelAndView.addObject("suit_guest_codes", productOptionsDao.selectAllSuitGuestCode());
			modelAndView.addObject("space_codes", productOptionsDao.selectAllSpaceCode());
			modelAndView.setViewName("/product/product_insert_step3");
		} else {
			modelAndView.setViewName("redirect:/");
		}
		return modelAndView;
	}

	// 숙소저장 3단계
	@RequestMapping(value = "/product_insert_step3", method = RequestMethod.POST)
	public ModelAndView product_insert_step3(
			@RequestParam(value = "convin_code_checkeds", required = false) List<String> convin_code_checkeds,
			@RequestParam(value = "bath_code_checkeds", required = false) List<String> bath_code_checkeds,
			@RequestParam(value = "space_code_checkeds", required = false) List<String> space_code_checkeds,
			@RequestParam(value = "safety_code_checkeds", required = false) List<String> safety_code_checkeds,
			@RequestParam(value = "regulation_code_checkeds", required = false) List<String> regulation_code_checkeds,
			@RequestParam(value = "building_code_selected", required = true) String building_code_selected,
			@RequestParam(value = "accom_code_selected", required = true) String accom_code_selected,
			@RequestParam(value = "bed_code_selected", required = true) String bed_code_selected,
			@RequestParam(value = "suit_guest_code_selected", required = true) String suit_guest_code_selected,
			HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();

		ModelAndView modelAndView = new ModelAndView();
		int product_seq = 0;
		if (session.getAttribute("product_seq") == null || session.getAttribute("product_step") == null) {
			modelAndView.setViewName("redirect:/");
		} else {

			product_seq = (Integer) session.getAttribute("product_seq");

			service.update_product_options(product_seq, building_code_selected, accom_code_selected, bed_code_selected,
					suit_guest_code_selected);
			service.insert_convin_options(product_seq, convin_code_checkeds);
			service.insert_bath_options(product_seq, bath_code_checkeds);
			service.insert_regulation_options(product_seq, regulation_code_checkeds);
			service.insert_safety_options(product_seq, safety_code_checkeds);
			service.insert_space_options(product_seq, space_code_checkeds);
			session.setAttribute("product_step", 4);
			modelAndView.setViewName("redirect:/product/product_insert_step4");
		}
		return modelAndView;
	}

	@RequestMapping(value = "/product_insert_step4", method = RequestMethod.GET)
	public ModelAndView product_insert_step4(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();

		if (session.getAttribute("product_seq") == null || session.getAttribute("product_step") == null
				|| (Integer) session.getAttribute("product_step") != 4) {
			modelAndView.setViewName("redirect:/");
		} else {
			modelAndView.setViewName("/product/product_insert_step4");
		}

		return modelAndView;
	}

	@RequestMapping(value = "/product_insert_step4", method = RequestMethod.POST)
	public ModelAndView product_insert_step4_POST(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView modelAndView = new ModelAndView();
		int product_seq = -1;
		if (session.getAttribute("product_seq") == null || session.getAttribute("product_step") == null) {
			modelAndView.setViewName("redirect:/");
		} else {
			product_seq = (Integer) request.getSession().getAttribute("product_seq");
			modelAndView.setViewName("/product/product_insert_step4");
			List<String> imageNames = null;
			// 이미지가 저장될 가상 디렉토리
			String attach_path = "resources/product/product_images/";
			MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;

			// 이미지 저장 후 이름들을 반환한다.
			imageNames = fileUploader.fileUpload(attach_path, "files", multi);

			if (imageNames != null && imageNames.size() > 0) {
				for (int i = 0; i < imageNames.size(); i++) {
					System.out.println("이미지 이름 : " + imageNames.get(i));
				}
			}
			if (product_seq != -1)
				service.insert_product_images(product_seq, imageNames);
			modelAndView.setViewName("redirect:/product/product_insert_step_last");
			session.setAttribute("product_step", 9);
		}

		return modelAndView;
	}

	@RequestMapping(value = "/product_insert_step_last", method = RequestMethod.GET)
	public ModelAndView product_insert_step_last(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		int product_seq = 65;

		if (session.getAttribute("product_seq") != null && session.getAttribute("product_step") != null
				&& (Integer) session.getAttribute("product_step") == 9) {

			product_seq = (Integer) session.getAttribute("product_seq");
			modelAndView.addObject("product_member", service.product_member(product_seq));
			modelAndView.addObject("product_safety", service.product_safety(product_seq));
			modelAndView.addObject("product_convin", service.product_convin(product_seq));
			modelAndView.addObject("product_space", service.product_space(product_seq));
			modelAndView.addObject("product_regulation", service.product_regulation(product_seq));
			modelAndView.addObject("product", service.select_product_detail(product_seq));
			modelAndView.addObject("product_pic", service.selectAllproductPicture(product_seq));
			modelAndView.setViewName("/product/product_insert_step_last");
		} else {
			modelAndView.setViewName("redirect:/");
		}

		return modelAndView;
	}
/*
	private Integer reservation_seq;
	private Integer product_seq;
	private String member_id;
	private Integer reserv_count;
	private String checkin_dt;
	private String checkout_dt;
	private String reg_dt;
	private String member_intro;
	private Integer reserv_status;*/
	
	@RequestMapping(value = "/reservation_step1", method = RequestMethod.GET)
	public ModelAndView reservation_step1(@ModelAttribute("reservation") ReservationDto reservDto, HttpSession session)
			throws Exception {
		ModelAndView modelAndView = new ModelAndView();
/*		String start_dt = "2016-11-16";
		String end_dt = "2016-11-30";
		int reserv_count = 4;
		int product_seq = 65;
*/
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
	public ModelAndView reservation_step1(
			ReservationDto reservDto,
			RedirectAttributes redirectAttributes,
			HttpSession session) 
	{
		System.out.println(reservDto);
		ModelAndView modelAndView = new ModelAndView();
		if(reservDto!=null){
			reservDto.setMember_id("201611170001");
			session.setAttribute("reservation_completed", "completed");
			redirectAttributes.addFlashAttribute("product_seq", reservDto.getProduct_seq());
			reservService.insertReservation(reservDto);
			modelAndView.setViewName("redirect:/product/reservation_step_last");
		}else
			modelAndView.setViewName("redirect:/");
			
		return modelAndView;
	}

	@RequestMapping(value = "/reservation_step_last", method = RequestMethod.GET)
	public ModelAndView reservation_step_last(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		if(session.getAttribute("reservation_completed")!=null 
				&& session.getAttribute("reservation_completed").equals("completed")){
			session.removeAttribute("reservation_completed");
			modelAndView.setViewName("/product/product_reservation_step_last");
		}
		else{
			modelAndView.setViewName("redirect:/");
		}

		return modelAndView;
	}

	@RequestMapping(value = "/map2", method = RequestMethod.GET)
	public void map() throws Exception {

	}

}
