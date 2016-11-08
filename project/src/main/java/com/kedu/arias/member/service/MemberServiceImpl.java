package com.kedu.arias.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kedu.arias.member.dao.MemberDao;
import com.kedu.arias.member.dto.LoginDto;
import com.kedu.arias.member.dto.MemberDto;


@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDao mdao;
	
	@Override
	public MemberDto login(LoginDto ldto) throws Exception {
		return mdao.login(ldto);
	}

	@Override
	public void regMember(MemberDto mdto) throws Exception {
		mdao.regMember(mdto);
	}

	@Override
	public MemberDto readMember(String member_id) throws Exception {
		return mdao.readMember(member_id);
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

}
