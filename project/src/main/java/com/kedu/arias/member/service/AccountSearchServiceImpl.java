package com.kedu.arias.member.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.kedu.arias.member.dao.AccountSearchDao;

@Service
public class AccountSearchServiceImpl implements AccountSearchService {

	@Inject
	private AccountSearchDao dao;
	
	@Override
	public List<String> listAccountEmail(String member_first_name, String member_last_name, String country_id)
			throws Exception {
		return dao.listAccountEmail(member_first_name, member_last_name, country_id);
	}

	@Override
	public String accountPwd(String member_first_name, String member_last_name, String member_email) throws Exception {
		return dao.accountPwd(member_first_name, member_last_name, member_email);
	}

}
