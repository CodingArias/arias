package com.kedu.arias.member.service;

import java.util.List;

public interface AccountSearchService {

	public List<String> listAccountEmail (String member_first_name, String member_last_name, String country_id) throws Exception;
	public String accountPwd (String member_first_name, String member_last_name, String member_email) throws Exception;
}
