package com.kedu.arias.email;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kedu.arias.member.dto.LoginDto;
import com.kedu.arias.member.dto.MemberDto;
import com.kedu.arias.member.service.AccountSearchService;
import com.kedu.arias.member.service.CountrycodeService;

@Controller
@RequestMapping("/member")
public class EmailController {
	
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
	
	@Inject
	private AccountSearchService asService;
	@Inject
	private CountrycodeService coService;
	
	
	
	@Autowired
	private EmailSender emailsender;
	@Autowired
	private EmailDto emailDto;
	@Autowired
	private MemberDto memberDto;
	
	@RequestMapping(value="/accountSearching", method=RequestMethod.GET)
	public void emailSearch(LoginDto ldto, HttpSession session, Model model) throws Exception{
		
		model.addAttribute("listCountry", coService.listAll());
	}
	
	
	@RequestMapping(value="/accountSearching", method=RequestMethod.POST)
	public String emailSearch(@RequestParam("member_first_name") String member_first_name
								,@RequestParam("member_last_name") String member_last_name
								,@RequestParam("country_id") String country_id, Model model) throws Exception {
		
		List<String> emailList=asService.listAccountEmail(member_first_name, member_last_name, country_id);
		
		if(emailList!=null && emailList.size()>0)
			model.addAttribute("result", emailList);
		else
			model.addAttribute("result",null);
		return "/member/accountResult";
	}
	
	
	
	@RequestMapping(value="/accountResult", method=RequestMethod.GET)
	public void accountResult(@RequestParam("member_first_name") String member_first_name
			,@RequestParam("member_last_name") String member_last_name
			,@RequestParam("country_id") String country_id, RedirectAttributes rttr) throws Exception{
	
		rttr.addFlashAttribute("result", asService.listAccountEmail(member_first_name, member_last_name, country_id));	
	}

	
	
	@RequestMapping(value="/passwordSearching", method=RequestMethod.GET)
	public void passwordSearching(HttpSession session, Model model) throws Exception {

	}
	
	@RequestMapping(value="/passwordSearching", method=RequestMethod.POST)
	public String passwordSearching(String member_first_name
								, String member_last_name
								, String member_email, MemberDto mdto, Model model) throws Exception{
		
		String password = asService.accountPwd(member_first_name, member_last_name, member_email);
		MemberDto memberdto = asService.loginInfo(member_email, password);
		
		System.out.println(memberdto);		
		System.out.println(password);
		
		if(password != null) {
			model.addAttribute("password", password);
			model.addAttribute("memberdto", memberdto);
		} else {
			model.addAttribute("password", null);
		}
		return "/member/passwordMiddle";
	}
	
	@RequestMapping(value="/checkpwd", method=RequestMethod.POST)
	public ModelAndView sendEmailAction(String member_email,
										String member_first_name,
										String member_last_name,
										String member_pwd, RedirectAttributes rttr) throws Exception {
		
		ModelAndView mav;
		Map<String, Object>param = new HashMap<String, Object>();
		param.put("member_email", member_email);
		param.put("member_pwd", member_pwd);
		param.put("member_first_name", member_first_name);
		param.put("member_last_name", member_last_name);

		
		emailDto.setContent("설정하신 비밀번호는 " + member_pwd + "입니다.");
		emailDto.setReceiver(member_email);
		emailDto.setSubject(member_first_name + "님의 ARIAS 비밀번호 확인 메일입니다.");
		emailsender.SendEmail(emailDto);
			
		rttr.addAttribute("result", "회원님의 등록된 이메일 주소로 메일이 발송 되었습니다.");
		rttr.addAttribute("resultEng", "The email sent to your registed address.");
		
		mav = new ModelAndView("redirect:/member/passwordResult");
		return mav;
	}
	
	@RequestMapping(value="/passwordResult", method=RequestMethod.GET)
	public void passwordResult(ModelAndView mav) throws Exception {
		

	}
}
