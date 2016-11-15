package com.kedu.arias.notice.dao;

import java.util.List;

import com.kedu.arias.common.dto.PageDto;
import com.kedu.arias.notice.dto.NoticeDto;
import com.kedu.arias.notice.dto.SearchCriteria;


public interface NoticeDao {
	
	public void create(NoticeDto ndto)throws Exception;
	
	public NoticeDto read(Integer notice_seq) throws Exception;
	
	public void update(NoticeDto ndto) throws Exception;

	public void delete(Integer notice_seq) throws Exception;
	
	public List<NoticeDto> listSearch(SearchCriteria cri)throws Exception;
	
	public void updateViewCnt(Integer notice_seq)throws Exception;
	
	public Integer selectAllNoticeCount(PageDto pageDto)throws Exception;
	
	public List<NoticeDto> selectNoticeList (PageDto pageDto,int recordPerPage);

}
