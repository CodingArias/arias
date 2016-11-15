package com.kedu.arias.member.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kedu.arias.member.dto.LoginDto;
import com.kedu.arias.member.dto.MemberDto;
import com.kedu.arias.member.dto.SearchCriteria;
import com.kedu.arias.member.service.CountrycodeService;
import com.kedu.arias.member.service.MemberService;
import com.kedu.arias.util.FileUploader;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberService service;
	
	@Inject
	private CountrycodeService coService;

	FileUploader fileUploader = FileUploader.getInstance();
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void loginGET(@ModelAttribute("ldto")LoginDto ldto){
		
	}
	
	
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public void loginPOST(LoginDto ldto, HttpSession session, Model model) throws Exception {
	
		MemberDto mdto = service.login(ldto);
		if(mdto == null) {
			return;
		}
		
		model.addAttribute("member", mdto);
	}
	
	
	@RequestMapping(value="/member_reg", method=RequestMethod.GET)
	public void regMemberGet(HttpSession session, Model model, SearchCriteria cri) throws Exception {
		
		logger.info(cri.toString());
		
		model.addAttribute("listCountry", coService.listAll());
		
		
	}
	
	
	
	
	
	/*@RequestMapping(value="/member_reg", method=RequestMethod.GET)
	public void regMemberGet(@ModelAttribute("cri") SearchCriteria cri, HttpSession session, Model model) {
		
	}*/
	
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	
	//MultipartFile file, MemberDto mdto, Model model
	@RequestMapping(value="/member_reg", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String regMemberPost(HttpServletRequest request, Model model) throws Exception {
		//태그이름
		String imageName="member_img";
		//저장경로

		String attach_path = "resources/member/";
		
		
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request; 
		
		MemberDto dto = new MemberDto();
		dto.setMember_email(multi.getParameter("member_email"));
		dto.setMember_pwd(multi.getParameter("member_pwd"));
		dto.setMember_first_name(multi.getParameter("member_first_name"));
		dto.setMember_last_name(multi.getParameter("member_last_name"));
		dto.setCountry_id(multi.getParameter("country_id"));
		dto.setMember_phone("+" + multi.getParameter("country_num") 
								+ "-" 
								+ multi.getParameter("member_phone1")
								+ "-"
								+ multi.getParameter("member_phone2")
								+ "-"
								+ multi.getParameter("member_phone3"));
		/*dto.setMember_img(multi.getMultipartContentType("member_img"));*/
		dto.setMember_birthday(multi.getParameter("member_birthday"));
		
		model.addAttribute("memberDto", dto);
		
		System.out.println("dto : " + dto);
		
		
		fileUploader.fileUpload(attach_path,imageName, multi); // 이미지 업로드
		
		return "/member/list";
		
	}
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception{
		
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
	
	
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public void goHome(Model model) throws Exception{

	}
	
/*	@RequestParam("member_id") String member_id, */
	@RequestMapping(value="/member_det", method=RequestMethod.GET)
	public void readMember(Model model) throws Exception {
		
//		model.addAttribute(service.readMember(member_id));
	}
	

	
//현수
	@RequestMapping(value = "/list", method = RequestMethod.GET)
    public void listAll(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

	    logger.info(cri.toString());

	    model.addAttribute("list", service.listSearchCriteria(cri));

	    System.out.println("list!!"+service.listSearchCriteria(cri));
	
	
	}
	
	  @RequestMapping(value = "/read", method = RequestMethod.GET)
	  public void read(@RequestParam("member_id") String member_id, @ModelAttribute("cri") SearchCriteria cri, Model model)
		      throws Exception {

		    model.addAttribute(service.read(member_id));
		  }
	  
	  @RequestMapping(value = "/remove", method = RequestMethod.POST)
	  public String remove(@RequestParam("member_id") String member_id,SearchCriteria cri,RedirectAttributes rttr) throws Exception {

	    service.remove(member_id);

	    rttr.addAttribute("searchType", cri.getSearchType());
	    rttr.addAttribute("keyword", cri.getKeyword());
	    rttr.addFlashAttribute("msg", "SUCCESS");

	    return "redirect:/member/list";
	  }
	  
	  @RequestMapping(value = "/modify", method = RequestMethod.GET)
	  public void modifyGET(String member_id, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {  
		
		  logger.info(cri.toString());
		  
		  model.addAttribute("list", service.listSearchCriteria(cri));
		  model.addAttribute(service.read(member_id));
		  
	  }
	    
	  
	  @RequestMapping(value = "/modify", method = RequestMethod.POST)
	  public String modifyPOST(MemberDto member, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

		    logger.info(cri.toString());
		    service.modify(member);

		    rttr.addAttribute("searchType", cri.getSearchType());
		    rttr.addAttribute("keyword", cri.getKeyword());

		    rttr.addFlashAttribute("msg", "SUCCESS");

		    logger.info(rttr.toString());

		    return "redirect:/member/list";
		  }
//현수
}
