package com.kedu.arias.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.kedu.arias.member.dto.MemberDto;
import com.kedu.arias.member.service.MemberService;

public class AuthInterceptor extends HandlerInterceptorAdapter {
		
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Inject
	private MemberService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("member") == null) {
			logger.info("current user is not logined");
			saveDest(request);
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if(loginCookie != null) {
				MemberDto mdto = service.checkLoginBefore(loginCookie.getValue());
				logger.info("MemberDto : " + mdto);
				
				if(mdto != null) {
					session.setAttribute("login", mdto);
					return true;
				}
			}
			response.sendRedirect("/member/login");
			return false;
		}
		return true;
	}
	
	private void saveDest(HttpServletRequest req) {
		
		String uri = req.getRequestURI();
		
		String query = req.getQueryString();
		
		if(query == null || query.equals("")) {
			query = "";
		} else {
			query = "?" + query;
		}
		
		if(req.getMethod().equals("GET")) {
			logger.info("destination : " + (uri + query));
			req.getSession().setAttribute("dest", uri + query);
		}
	}
}
