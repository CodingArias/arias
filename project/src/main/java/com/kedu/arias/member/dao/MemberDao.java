package com.kedu.arias.member.dao;

import java.util.Date;
import java.util.List;
import com.kedu.arias.member.dto.SearchCriteria;
import com.kedu.arias.notice.dto.NoticeDto;
import com.kedu.arias.common.dto.PageDto;
import com.kedu.arias.member.dto.LoginDto;
import com.kedu.arias.member.dto.MemberDto;

public interface MemberDao {
	//숙영
	public MemberDto login(LoginDto ldto) throws Exception;
	public void create(MemberDto mdto) throws Exception;
	public String create_next_memberid() throws Exception;
	public String memberCheck(String member_email) throws Exception;
	
	public void keepLogin(String member_id, String sessionid, Date next) throws Exception;
	public MemberDto checkUserWithSessionKey(String value);
	
	//회원조회,수정,삭제
	public List<MemberDto> listSearch(SearchCriteria cri)throws Exception;
	
	public MemberDto read(String member_id) throws Exception;

	public void update(MemberDto mdto) throws Exception;

	public void delete(String member_id) throws Exception;
	
	//페이징
    public Integer selectAllMemberCount(PageDto pageDto)throws Exception;
	
	public List<MemberDto> selectMemberList(PageDto pageDto,int recordPerPage);
	
	//관리자확인
	public boolean adminCheck(String member_id);
}
