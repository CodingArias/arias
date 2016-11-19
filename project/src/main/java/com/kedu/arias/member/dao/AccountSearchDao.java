package com.kedu.arias.member.dao;

import java.util.List;

public interface AccountSearchDao {
	
	public List<String> listAccountEmail(String member_first_name
								  , String member_last_name
								  , String country_id) throws Exception;
	
	public String accountPwd(String member_first_name
						   , String member_last_name
						   , String member_email) throws Exception;
}
