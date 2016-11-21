package com.kedu.arias.member.service;

import java.util.Date;
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
	

	@Override
	public void keepLogin(String member_id, String sessionid, Date next) throws Exception {
		mdao.keepLogin(member_id, sessionid, next);
	}
	

	@Override
	public MemberDto checkLoginBefore(String value) {
		return mdao.checkUserWithSessionKey(value);
	}
	
	//회원조회
	@Override
	public List<MemberDto> listSearchCriteria(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return mdao.listSearch(cri);
	}
    
	//회원상세정보
	@Override
	public MemberDto read(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return mdao.read(member_id);
	}
    
	//회원정보수정
	@Override
	public void modify(MemberDto member) throws Exception {
		mdao.update(member);
	}
	
	//회원정보삭제
	@Override
	public void remove(String member_id) throws Exception {
		mdao.delete(member_id);	
	}

	//페이징
	@Override
	public Integer selectAllMemberCount(PageDto pageDto) throws Exception {
		return mdao.selectAllMemberCount(pageDto);
	}

	@Override
	public List<MemberDto> selectMemberList(PageDto pageDto, int recordPerPage) {
		return mdao.selectMemberList(pageDto, recordPerPage);
	}

	//관리자확인
	@Override
	public boolean adminCheck(String member_id) {
		return mdao.adminCheck(member_id);
	}


}
