package com.kedu.arias.member.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.arias.member.dto.LoginDto;
import com.kedu.arias.member.dto.MemberDto;


@Repository
public class MemberDaoImpl implements MemberDao {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kedu.mappers.LoginMapper";
	
	@Override
	public MemberDto login(LoginDto ldto) throws Exception {
		return session.selectOne(namespace + ".login", ldto);
	}

	@Override
	public void regMember(MemberDto mdto) throws Exception {
		session.insert(namespace+ ".regMember", mdto);
	}

	@Override
	public MemberDto readMember(String member_id) throws Exception {
		return session.selectOne(namespace +".readMember", member_id);
	}

	@Override
	public void updateMember(MemberDto mdto) throws Exception {
		session.update(namespace + ".updateMember", mdto);
	}

	@Override
	public void deleteMember(String member_id) throws Exception {
		session.delete(namespace + ".deleteMember", member_id);
	}

	@Override
	public List<MemberDto> listAllMember() throws Exception {
		return session.selectList(namespace + ".listAllMember");
	}
}
