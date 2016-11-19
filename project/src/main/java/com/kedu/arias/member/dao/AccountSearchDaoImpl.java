package com.kedu.arias.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AccountSearchDaoImpl implements AccountSearchDao {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kedu.arias.LoginMapper";
	
	@Override
	public List<String> listAccountEmail(String member_first_name, String member_last_name, String country_id)
			throws Exception {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("member_first_name", member_first_name);
		param.put("member_last_name", member_last_name);
		param.put("country_id", country_id);
		
		return session.selectList(namespace + ".searchId", param);
	}

	@Override
	public String accountPwd(String member_first_name, String member_last_name, String member_email) throws Exception {
		
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("member_first_name", member_first_name);
		parameter.put("member_last_name", member_last_name);
		parameter.put("member_email", member_email);
		
		return session.selectOne(namespace + ".searchPwd", parameter);
	}

}
