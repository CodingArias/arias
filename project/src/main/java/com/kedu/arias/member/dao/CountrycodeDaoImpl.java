package com.kedu.arias.member.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.arias.common.dto.PageCriteria;
import com.kedu.arias.member.dto.CountryDto;

@Repository
public class CountrycodeDaoImpl implements CountrycodeDao {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kedu.arias.countryMapper";
	
	@Override
	public List<CountryDto> listAll() throws Exception {
			
		return session.selectList(namespace + ".listAll");
	}

	@Override
	public List<CountryDto> listCriteria(PageCriteria pcri) throws Exception {
		return session.selectList(namespace + ".listCriteria", pcri);
	}

}
