package com.kedu.arias.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kedu.arias.member.dto.LoginDto;
import com.kedu.arias.member.dto.MemberDto;
import com.kedu.arias.member.service.MemberService;


@Controller
@RequestMapping("/member")
public class MemberController {

	@Inject
	private MemberService service;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void loginGET(@ModelAttribute("ldto")LoginDto ldto){
		
		
	}
	
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public void loginPOST(LoginDto ldto, HttpSession session, Model model) throws Exception {
		System.out.println("ldto : "+ldto);
		MemberDto mdto = service.login(ldto);
		System.out.println("mdto : "+ mdto);
		if(mdto == null) {
			return;
		}
		
		model.addAttribute("member", mdto);
	}
	
	@RequestMapping(value="/member_reg", method=RequestMethod.GET)
	public void regMemberGet(HttpSession session, Model model) {
		
	}
	
	/*@RequestMapping(value="/member_reg", method=RequestMethod.GET)
	public void regMemberGet(@ModelAttribute("cri") SearchCriteria cri, HttpSession session, Model model) {
		
	}*/
	
	@RequestMapping(value="/member_reg", method=RequestMethod.POST)
	public String regMemberPost(MemberDto mdto, Model model) throws Exception {
		
		model.addAttribute("registrate", "success");
		return "/member/loginPost";
		
	}
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public void goHome(Model model) throws Exception{

	}
}
