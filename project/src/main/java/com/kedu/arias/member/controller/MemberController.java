package com.kedu.arias.member.controller;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.kedu.arias.member.dto.LoginDto;
import com.kedu.arias.member.dto.MemberDto;
import com.kedu.arias.member.service.MemberService;
import com.kedu.arias.util.FileUploader;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberService service;

	FileUploader fileUploader = FileUploader.getInstance();
	
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
	
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception{
		
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
	
	//MultipartFile file, MemberDto mdto, Model model
	@RequestMapping(value="/member_reg", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String regMemberPost(HttpServletRequest request, Model model) throws Exception {
		//태그이름
		String imageName="member_img";
		//저장경로
		String savePath="D:/images/";
		String encType = "UTF-8";
				
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request; 
		
		MemberDto dto = new MemberDto();
		dto.setMember_email(multi.getParameter("member_email"));
		dto.setMember_pwd(multi.getParameter("member_pwd"));
		dto.setMember_first_name(multi.getParameter("member_first_name"));
		dto.setMember_last_name(multi.getParameter("member_last_name"));
		dto.setMember_country(multi.getParameter("member_country"));
		dto.setMember_phone("+" + multi.getParameter("country_num") 
								+ "-" 
								+ multi.getParameter("member_phone1")
								+ "-"
								+ multi.getParameter("member_phone2")
								+ "-"
								+ multi.getParameter("member_phone3"));
		dto.setMember_img(multi.getMultipartContentType("member_img"));
		dto.setMember_birthday(multi.getParameter("member_birthday"));
		
		model.addAttribute("memberDto", dto);
		
		fileUploader.fileUpload(savePath,imageName, multi); // 이미지 업로드
		
		return "/member/loginPost";
		
	}
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public void goHome(Model model) throws Exception{

	}
	

}
