package com.kedu.arias.member.service;

import java.util.List;

import com.kedu.arias.member.dto.MemberDto;

public interface AccountSearchService {

	public List<String> listAccountEmail (String member_first_name, String member_last_name, String country_id) throws Exception;
	public String accountPwd (String member_first_name, String member_last_name, String member_email) throws Exception;
	public MemberDto loginInfo(String member_email, String member_pwd) throws Exception;
}
