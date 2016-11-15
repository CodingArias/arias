package com.kedu.arias.notice.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.arias.notice.dto.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kedu.arias.noticeMapper";

	@Override
	public void create(NoticeDto ndto) throws Exception {
		session.insert(namespace+ ".create", ndto);
		
	}

	@Override
	public NoticeDto read(Integer notice_seq) throws Exception {
		return session.selectOne(namespace+".read",notice_seq);
	}

	@Override
	public void update(NoticeDto ndto) throws Exception {
		session.update(namespace+".update",ndto);
		
	}

	@Override
	public void delete(Integer notice_seq) throws Exception {
		session.delete(namespace+".delete",notice_seq);
		
	}

	@Override
	public List<NoticeDto> listSearch(com.kedu.arias.notice.dto.SearchCriteria cri) throws Exception {
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public void updateViewCnt(Integer notice_seq) throws Exception {
		session.update(namespace+".updateViewCnt",notice_seq);
		
	}
	
}
