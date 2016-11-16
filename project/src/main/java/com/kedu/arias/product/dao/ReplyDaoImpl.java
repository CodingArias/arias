package com.kedu.arias.product.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.arias.product.dto.ReplyDto;

@Repository
public class ReplyDaoImpl implements ReplyDao {

	@Inject
	private SqlSession session;
	
	
	private static String namespace = "com.kedu.arias.productMapper";
	
	@Override
	public void insert_reply(ReplyDto dto) throws Exception {
		session.insert(namespace + ".insert_reply", dto);
	}
	
	@Override
	public List<ReplyDto> list_reply(int product_seq) throws Exception {
		return session.selectList(namespace+".list_reply", product_seq);
	}
	
	@Override
	public void update_reply(ReplyDto dto) throws Exception {
		session.update(namespace+".update_reply", dto);
	}
	@Override
	public void delete_reply(Map<String, Object> map) throws Exception {
		session.delete(namespace+".delete_reply", map);
	}
}
