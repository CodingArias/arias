package com.kedu.arias.common.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.arias.common.dto.Country;

@Repository
public class CountryDaoImpl implements CountryDao {

	@Inject
	SqlSession session;
	private final String namespace="com.kedu.arias.commonMapper";
	@Override
	public List<Country> selectAllCountry() {
		return session.selectList(namespace+".selectAllCountry");
	}


}
