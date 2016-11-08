package com.kedu.arias.member.dao;

import java.util.List;

import com.kedu.arias.member.dto.LoginDto;
import com.kedu.arias.member.dto.MemberDto;

public interface MemberDao {
	
	public MemberDto login(LoginDto ldto) throws Exception;
	
	public void regMember(MemberDto mdto) throws Exception;
	
	public MemberDto readMember(String member_id) throws Exception;
	
	public void updateMember(MemberDto mdto) throws Exception;
	
	public void deleteMember(String member_id) throws Exception;
	
	public List<MemberDto> listAllMember() throws Exception;
}
