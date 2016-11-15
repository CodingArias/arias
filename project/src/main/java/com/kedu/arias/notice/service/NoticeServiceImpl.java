package com.kedu.arias.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kedu.arias.notice.dto.SearchCriteria;
import com.kedu.arias.common.dto.PageDto;
import com.kedu.arias.notice.dao.NoticeDao;
import com.kedu.arias.notice.dto.NoticeDto;


@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Inject
	private NoticeDao ndao;

	@Override
	public List<NoticeDto> listSearchCriteria(SearchCriteria cri) throws Exception {
		return ndao.listSearch(cri);
	}

	@Override
	public void regist(NoticeDto notice) throws Exception {
		ndao.create(notice);
	}

	@Override
	public NoticeDto read(Integer notice_seq) throws Exception {
		ndao.updateViewCnt(notice_seq);
		return ndao.read(notice_seq);
	}

	@Override
	public void modify(NoticeDto notice) throws Exception {
		ndao.update(notice);
		
	}

	@Override
	public void remove(Integer notice_seq) throws Exception {
		ndao.delete(notice_seq);
	}

	@Override
	public Integer selectAllNoticeCount(PageDto pageDto) throws Exception {
		return ndao.selectAllNoticeCount(pageDto);
	}

	@Override
	public List<NoticeDto> selectNoticeList(PageDto pageDto, int recordPerPage) {
		return ndao.selectNoticeList(pageDto, recordPerPage);
	}
	
}
