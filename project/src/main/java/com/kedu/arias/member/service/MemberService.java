package com.kedu.arias.member.service;

import java.util.List;

import com.kedu.arias.member.dto.SearchCriteria;
import com.kedu.arias.member.dto.LoginDto;
import com.kedu.arias.member.dto.MemberDto;

public interface MemberService {
	
	public MemberDto login(LoginDto ldto) throws Exception;
	public void create(MemberDto mdto) throws Exception;
	public String create_next_memberid()throws Exception;
	
	
	//현수
	public List<MemberDto> listSearchCriteria(SearchCriteria cri) 
		      throws Exception;
	
	public MemberDto read(String member_id) throws Exception;
	
	  public void modify(MemberDto member) throws Exception;

	  public void remove(String member_id) throws Exception;
}
