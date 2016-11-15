package com.kedu.arias.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kedu.arias.member.dao.MemberDao;
import com.kedu.arias.member.dto.LoginDto;
import com.kedu.arias.member.dto.MemberDto;
import com.kedu.arias.member.dto.SearchCriteria;


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
	public void updateMember(MemberDto mdto) throws Exception {
		mdao.updateMember(mdto);
	}

	@Override
	public void deleteMember(String member_id) throws Exception {
		mdao.deleteMember(member_id);
	}

	@Override
	public List<MemberDto> listAllMember() throws Exception {
		return mdao.listAllMember();
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

}
