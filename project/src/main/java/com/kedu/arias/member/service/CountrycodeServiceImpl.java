package com.kedu.arias.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kedu.arias.common.dto.PageCriteria;
import com.kedu.arias.member.dao.CountrycodeDao;
import com.kedu.arias.member.dto.CountryDto;

@Service
public class CountrycodeServiceImpl implements CountrycodeService {

	@Inject
	private CountrycodeDao cdao;
	
	@Override
	public List<CountryDto> listAll() throws Exception {
		return cdao.listAll();
	}

	@Override
	public List<CountryDto> listCriteria(PageCriteria pcri) throws Exception {
		return cdao.listCriteria(pcri);
	}

}
