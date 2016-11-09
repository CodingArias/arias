package com.kedu.arias.member.dao;

import java.util.List;

import com.kedu.arias.common.dto.PageCriteria;
import com.kedu.arias.member.dto.CountryDto;

public interface CountrycodeDao {

	public List<CountryDto> listAll() throws Exception;
	
	public List<CountryDto> listCriteria(PageCriteria pcri) throws Exception;
}
