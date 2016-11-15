package com.kedu.arias.member.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.arias.member.dto.SearchCriteria;
import com.kedu.arias.member.dto.LoginDto;
import com.kedu.arias.member.dto.MemberDto;


@Repository
public class MemberDaoImpl implements MemberDao {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kedu.arias.MemberMapper";
	
	@Override
	public MemberDto login(LoginDto ldto) throws Exception {
		return session.selectOne(namespace + ".login", ldto);
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

}
