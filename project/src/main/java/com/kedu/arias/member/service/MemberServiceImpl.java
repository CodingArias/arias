package com.kedu.arias.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kedu.arias.common.dto.PageDto;
import com.kedu.arias.member.dao.MemberDao;
import com.kedu.arias.member.dto.LoginDto;
import com.kedu.arias.member.dto.MemberDto;
import com.kedu.arias.member.dto.SearchCriteria;
import com.kedu.arias.notice.dto.NoticeDto;


@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDao mdao;
	
	@Override
	public MemberDto login(LoginDto ldto) throws Exception {
		return mdao.login(ldto);
	}

	@Override
	public void create(MemberDto mdto) throws Exception {
		mdao.create(mdto);
	}

	@Override
	public String create_next_memberid() throws Exception {
		return mdao.create_next_memberid(); 
	}
	
	@Override
	public String memberCheck(String member_email) throws Exception {
		return mdao.memberCheck(member_email);
	}
	
	//현수
	
	@Override
	public List<MemberDto> listSearchCriteria(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return mdao.listSearch(cri);
	}

	@Override
	public MemberDto read(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return mdao.read(member_id);
	}

	@Override
	public void modify(MemberDto member) throws Exception {
		mdao.update(member);
		
	}

	@Override
	public void remove(String member_id) throws Exception {
		mdao.delete(member_id);
		
	}

	@Override
	public Integer selectAllNoticeCount(PageDto pageDto) throws Exception {
		return mdao.selectAllNoticeCount(pageDto);
	}

	@Override
	public List<NoticeDto> selectNoticeList(PageDto pageDto, int recordPerPage) {
		return mdao.selectNoticeList(pageDto, recordPerPage);
	}

	

}
