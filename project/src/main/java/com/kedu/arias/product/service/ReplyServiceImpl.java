package com.kedu.arias.product.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kedu.arias.common.dto.PageCriteria;
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
	public void delete_reply(int product_seq, String member_id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product_seq", product_seq);
		map.put("member_id", member_id);
		rDao.delete_reply(map);
	}
	
	@Override
	public List<ReplyDto> reply_page(int product_seq, PageCriteria cri) throws Exception {
		return rDao.reply_page(product_seq, cri);
	}

	@Override
	public int reply_count(int product_seq) throws Exception {
		return rDao.reply_count(product_seq);
	}
	
	@Override
	public double avg_member_score(int product_seq) throws Exception {
		return rDao.avg_member_score(product_seq);
	}
}
