package com.kedu.arias.notice.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.arias.common.dto.PageDto;
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

	@Override
	public Integer selectAllNoticeCount(PageDto pageDto) throws Exception {
		HashMap<String,Object> map =new HashMap<>(); 

		map.put("searchType", pageDto.getSearchType());
		map.put("keyword", pageDto.getKeyword());
		return session.selectOne(namespace+".selectAllNoticeCount",map);
	}

	@Override
	public List<NoticeDto> selectNoticeList(PageDto pageDto , int recordPerPage) {
		HashMap<String,Object> map =new HashMap<>(); 
		int curPage = pageDto.getCurPage();
		if (curPage < 1)
			curPage = 1;

		int start = ((curPage - 1) * recordPerPage) + 1;
		int end = start + recordPerPage - 1;
		
		System.out.println("start : "+ start);
		System.out.println("end : "+ end);
		
		map.put("start", start);
		map.put("end", end);
		map.put("searchType", pageDto.getSearchType());
		map.put("keyword", pageDto.getKeyword());
		
		return session.selectList(namespace+".selectNoticeList", map);
	}
	
}
