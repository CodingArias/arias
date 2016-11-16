package com.kedu.arias.notice.service;

import java.util.List;

import com.kedu.arias.notice.dto.SearchCriteria;
import com.kedu.arias.common.dto.PageDto;
import com.kedu.arias.notice.dto.NoticeDto;

public interface NoticeService {
	
	public List<NoticeDto> listSearchCriteria(SearchCriteria cri) 
		      throws Exception;
	
	public void regist(NoticeDto ndto) throws Exception;
	
	public NoticeDto read(Integer notice_seq) throws Exception;
	
	public void modify(NoticeDto notice) throws Exception;

	public void remove(Integer notice_seq) throws Exception;
	
	public Integer selectAllNoticeCount(PageDto pageDto)throws Exception;
	
	public List<NoticeDto> selectNoticeList(PageDto pageDto , int recordPerPage);

}
