package com.kedu.arias.product.dao;

import java.util.List;
import java.util.Map;

import com.kedu.arias.product.dto.ReplyDto;

public interface ReplyDao {
	public void insert_reply(ReplyDto dto) throws Exception;
	
	public List<ReplyDto> list_reply(int product_seq) throws Exception;
	
	public void update_reply(ReplyDto dto) throws Exception;
	
	public void delete_reply(Map<String, Object> map) throws Exception;
	
	
}
