package com.kedu.arias.member.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.arias.member.dto.SearchCriteria;
import com.kedu.arias.notice.dto.NoticeDto;
import com.kedu.arias.common.dto.PageDto;
import com.kedu.arias.member.dto.LoginDto;
import com.kedu.arias.member.dto.MemberDto;


@Repository
public class MemberDaoImpl implements MemberDao {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kedu.arias.MemberMapper";
	private static String loginspace = "com.kedu.arias.LoginMapper";
	
	@Override
	public MemberDto login(LoginDto ldto) throws Exception {
		return session.selectOne(loginspace + ".login", ldto);
	}

	@Override
	public String memberCheck(String member_email) throws Exception {
		return session.selectOne(loginspace + ".memberCheck", member_email);
	}
	
	@Override
	public void create(MemberDto mdto) throws Exception {
		session.insert(namespace+ ".create", mdto);
	}
	
	@Override
	public String create_next_memberid() throws Exception {
		return session.selectOne(namespace + ".create_next_memberid");
	}

	//현수
	
	@Override
	public List<MemberDto> listSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public MemberDto read(String member_id) throws Exception {
		
		return session.selectOne(namespace+".read",member_id);
	}

	@Override
	public void update(MemberDto mdto) throws Exception {
		session.update(namespace+".update",mdto);
		
	}

	@Override
	public void delete(String member_id) throws Exception {
		session.delete(namespace+".delete",member_id);

	}

	@Override
	public Integer selectAllNoticeCount(PageDto pageDto) throws Exception {
		HashMap<String,Object> map =new HashMap<>(); 

		map.put("searchType", pageDto.getSearchType());
		map.put("keyword", pageDto.getKeyword());
		return session.selectOne(namespace+".selectAllNoticeCount",map);
	}

	@Override
	public List<NoticeDto> selectNoticeList(PageDto pageDto, int recordPerPage) {
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
