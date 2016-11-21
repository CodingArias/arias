package com.kedu.arias.notice.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kedu.arias.common.dto.PageDto;
import com.kedu.arias.notice.dto.NoticeDto;
import com.kedu.arias.notice.dto.SearchCriteria;
import com.kedu.arias.notice.service.NoticeService;
import com.kedu.arias.util.PageHelper;


@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	private PageHelper pageHelper = PageHelper.getInstance();
	@Inject
	private NoticeService service;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	  public void registGET() throws Exception {

	    logger.info("regist get ...........");
	  }

	  @RequestMapping(value = "/register", method = RequestMethod.POST)
	  public String registPOST(HttpServletRequest request,NoticeDto notice, RedirectAttributes rttr) throws Exception {
	/*	  String attach_path = "resources/member/";*/
	    logger.info("regist post ...........");
	    logger.info(notice.toString());
	    /*String member_id = "201611180004";*/
	    String member_id = "admin";

	 /*  MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request; 

		String imageNames[];
		//이미지 저장 후 이름들을 반환한다.
		imageNames=fileUploader.fileUpload(attach_path,"member_img", multi);
		
		for(int i=0;i<imageNames.length;i++){
			System.out.println("이미지 이름 : "+imageNames[i]);
		}*/
		notice.setMember_id(member_id);
	    service.regist(notice);

	    rttr.addFlashAttribute("msg", "SUCCESS");
	    
	    return "redirect:/notice/list";

	  }
	
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
    public void listAll( Model model
    		,@ModelAttribute("page") PageDto pageDto
    		) throws Exception {

		if(pageDto.getCurPage()<1)
			pageDto.setCurPage(1);
		
	    int recordPerPage = 10;
	    
	    //공지사항의 총 개수 
	    int totalRecord   = service.selectAllNoticeCount(pageDto);
	    List<NoticeDto> nDto = service.selectNoticeList(pageDto, recordPerPage);
	    model.addAttribute("list", nDto);
	    System.out.println("totalRecord : "+ totalRecord);
	    System.out.println(nDto);
	    System.out.println(nDto.size());
	    
	    
	    //페이징 블럭 그룹 생성
	    pageHelper.getBlockGroup(pageDto.getCurPage(), recordPerPage, totalRecord,pageDto);
	    System.out.println(pageDto);
	}
	
	
	
	
	  @RequestMapping(value = "/read", method = RequestMethod.GET)
	  public void read(@RequestParam("notice_seq") Integer notice_seq, @ModelAttribute("page") PageDto page, Model model)
		      throws Exception {

		    model.addAttribute(service.read(notice_seq));
		  }
	  
	  @RequestMapping(value = "/remove", method = RequestMethod.POST)
	  public String remove(@RequestParam("notice_seq") Integer notice_seq,SearchCriteria cri,RedirectAttributes rttr) throws Exception {

	    service.remove(notice_seq);

	    rttr.addAttribute("searchType", cri.getSearchType());
	    rttr.addAttribute("keyword", cri.getKeyword());
	    rttr.addFlashAttribute("msg", "SUCCESS");

	    return "redirect:/notice/list";
	  }
	  
	  @RequestMapping(value = "/modify", method = RequestMethod.GET)
		
	    public void modifyGET(Integer notice_seq, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

	        model.addAttribute(service.read(notice_seq));
	      }
	    
	  
	  @RequestMapping(value = "/modify", method = RequestMethod.POST)
	  public String modifyPOST(NoticeDto notice, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

		    logger.info(cri.toString());
		    service.modify(notice);

		    rttr.addAttribute("searchType", cri.getSearchType());
		    rttr.addAttribute("keyword", cri.getKeyword());

		    rttr.addFlashAttribute("msg", "SUCCESS");

		    logger.info(rttr.toString());

		    return "redirect:/notice/list";
		  }
}
