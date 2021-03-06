package com.kedu.arias.member.controller;

import java.util.Date;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.kedu.arias.common.dao.CountryDao;
import com.kedu.arias.common.dto.PageDto;
import com.kedu.arias.member.dto.LoginDto;
import com.kedu.arias.member.dto.MemberDto;
import com.kedu.arias.member.dto.SearchCriteria;
import com.kedu.arias.member.service.CountrycodeService;
import com.kedu.arias.member.service.MemberService;
import com.kedu.arias.notice.dto.NoticeDto;
import com.kedu.arias.util.FileUploader;
import com.kedu.arias.util.PageHelper;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Inject
	CountryDao countryDao;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	private PageHelper pageHelper = PageHelper.getInstance();
	
	@Inject
	private MemberService service;
	
	@Inject
	private CountrycodeService coService;

	FileUploader fileUploader = FileUploader.getInstance();
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void login(@ModelAttribute("ldto")LoginDto ldto){
		
	}

	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public String loginPOST(LoginDto ldto, HttpSession session, Model model) throws Exception {
	
		System.out.println("로그인 성공");
		//로그인 성공시 db에서 member 정보들을 가져온다
		MemberDto mdto = service.login(ldto);
		
		//이미 세션이 존재할 경우 삭제한다.
		if(session.getAttribute("member")!=null)
			session.removeAttribute("member");
		if(session.getAttribute("admin")!=null)
			session.removeAttribute("admin");
		

		//remember me 코드
		if(ldto.isUseCookie()) {
			int amount = 60*60*24*7;
			Date sessionlimit = new Date(System.currentTimeMillis() + (1000*amount));
			
			service.keepLogin(mdto.getMember_id(), session.getId(), sessionlimit);
		}
		
		//회원 정보를 세션에 추가
		session.setAttribute("member", mdto);
		//admin 체크
		if(service.adminCheck(mdto.getMember_id()))
			session.setAttribute("admin", "true");
	
		
		System.out.println(session.getAttribute("member"));
		System.out.println("admin 상태 : "+session.getAttribute("admin"));
		
		return "redirect:/";
		//model.addAttribute("member", mdto);
	}

	
	@RequestMapping(value="/member_reg", method=RequestMethod.GET)
	public void regMemberGet(HttpSession session, Model model, SearchCriteria cri) throws Exception {
		
		logger.info(cri.toString());
		
		model.addAttribute("listCountry", coService.listAll());
	}

	@RequestMapping(value="/member_reg", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	public ModelAndView regMemberPost(HttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception {
		
		HttpSession session = request.getSession();
		ModelAndView mnv = new ModelAndView();

		MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;
		MemberDto mdto = new MemberDto();
		mdto.setMember_id(service.create_next_memberid());
		mdto.setMember_first_name(multi.getParameter("member_first_name"));
		mdto.setMember_last_name(multi.getParameter("member_last_name"));
		mdto.setCountry_id(multi.getParameter("country_id"));
		mdto.setMember_email(multi.getParameter("member_email"));
		mdto.setMember_pwd(multi.getParameter("member_pwd"));
		mdto.setMember_phone(multi.getParameter("member_phone"));
		mdto.setMember_birthday(multi.getParameter("member_birthday"));
		System.out.println(mdto);
		
		List<String> imageNames;
		String attach_path = "resources/member/member_img/";
		
		imageNames = fileUploader.fileUpload(attach_path, "member_img", multi);
		
		if(imageNames != null && imageNames.size() > 0) {
			for(int i = 0; i < imageNames.size(); i++) {
				System.out.println("회원사진 이름 : " + imageNames.get(i));
				mdto.setMember_img(imageNames.get(i));
			}
		}
	    service.create(mdto);

		session.setAttribute("member_id", mdto.getMember_id());
		session.setAttribute("reg_status", "completed");
		mnv.setViewName("redirect:/member/member_reg_confirm");
		
		return mnv;
	}
	
	
	@RequestMapping(value="/member_reg_confirm", method=RequestMethod.GET)
	public String regSuccess(HttpServletRequest request) throws Exception {
		HttpSession session =request.getSession();
		if(session.getAttribute("reg_status")!=null&&session.getAttribute("reg_status").equals("completed")){

			session.removeAttribute("reg_status");
			return "/member/member_reg_confirm";
		}
		else{
			return "redirect:/";
		}
	}
	
	
	
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public void goHome(Model model) throws Exception{

	}

	
   
	@RequestMapping(value = "/list", method = RequestMethod.GET)
    /*public void listAll(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

	    logger.info(cri.toString());

	    model.addAttribute("list", service.listSearchCriteria(cri));

	    System.out.println("list!!"+service.listSearchCriteria(cri));*/
	
	public void listAll( Model model
    		,@ModelAttribute("page") PageDto pageDto
    		) throws Exception {

		if(pageDto.getCurPage()<1)
			pageDto.setCurPage(1);
		
	    int recordPerPage = 10;
	    
	    //공지사항의 총 개수 
	    int totalRecord   = service.selectAllMemberCount(pageDto);
	    List<MemberDto> nDto = service.selectMemberList(pageDto, recordPerPage);
	    model.addAttribute("list", nDto);
	    System.out.println("totalRecord : "+ totalRecord);
	    System.out.println(nDto);
	    System.out.println(nDto.size());
	    
	    
	    //페이징 블럭 그룹 생성
	    pageHelper.getBlockGroup(pageDto.getCurPage(), recordPerPage, totalRecord,pageDto);
	    System.out.println(pageDto);
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
		  
		  model.addAttribute("country_list", countryDao.selectAllCountry()); 
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
	  
	  @RequestMapping(value = "/logout", method=RequestMethod.GET)
	  public String logout(HttpSession session){
		  session.removeAttribute("member");
		  session.removeAttribute("admin");
		  return "redirect:/";
	  }

}
