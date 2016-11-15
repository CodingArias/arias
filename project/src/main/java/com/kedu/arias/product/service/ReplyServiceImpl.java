package com.kedu.arias.product.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kedu.arias.product.dao.ReplyDao;
import com.kedu.arias.product.dto.ReplyDto;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDao rDao;
	
	@Override
	public void insert_reply(ReplyDto dto) throws Exception {
		rDao.insert_reply(dto);
	}
	
	@Override
	public List<ReplyDto> list_reply(int product_seq) throws Exception {
		return rDao.list_reply(product_seq);
	}
	
	@Override
	public void update_reply(ReplyDto dto) throws Exception {
		rDao.update_reply(dto);
	}

	@Override
	public void delete_reply(ReplyDto dto) throws Exception {
		rDao.delete_reply(dto);
	}
}
