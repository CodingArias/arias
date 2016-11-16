package com.kedu.arias.member.dao;

import java.util.List;

import com.kedu.arias.member.dto.SearchCriteria;
import com.kedu.arias.notice.dto.NoticeDto;
import com.kedu.arias.common.dto.PageDto;
import com.kedu.arias.member.dto.LoginDto;
import com.kedu.arias.member.dto.MemberDto;

public interface MemberDao {
	
	public MemberDto login(LoginDto ldto) throws Exception;
	public void create(MemberDto mdto) throws Exception;
	public String create_next_memberid() throws Exception;
	
	
	//현수
	public List<MemberDto> listSearch(SearchCriteria cri)throws Exception;
	
	public MemberDto read(String member_id) throws Exception;

	public void update(MemberDto mdto) throws Exception;

	public void delete(String member_id) throws Exception;
	
	//페이징
    public Integer selectAllNoticeCount(PageDto pageDto)throws Exception;
	
	public List<NoticeDto> selectNoticeList (PageDto pageDto,int recordPerPage);
}
