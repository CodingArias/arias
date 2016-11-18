package com.kedu.arias.product.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kedu.arias.product.dao.ReservationDao;
import com.kedu.arias.product.dto.NotsalesDto;
import com.kedu.arias.product.dto.ReservationDto;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Inject
	ReservationDao reservDao;
	@Override
	public Integer duplicateReservationCheck(String member_id, int product_seq) {
		return reservDao.duplicateReservationCheck(member_id, product_seq);
	}

	@Override
	public boolean insertReservation(ReservationDto reservDto) {
		
		if(reservDao.duplicateReservationCheck(reservDto.getMember_id(), reservDto.getProduct_seq())>0)
			return false;
		else{
			reservDao.insertReservation(reservDto);
			return true;
		}
	}

	@Override
	public boolean updateReservationStatus(ReservationDto reservDto) {
		return reservDao.updateReservationStatus(reservDto);
	}

	@Override
	public List<NotsalesDto> selectInvalidReservationDate(Integer product_seq) {
		return reservDao.selectInvalidReservationDate(product_seq);
	}

	@Override
	public List<ReservationDto> selectReservationList(Integer product_seq) {
		return reservDao.selectReservationList(product_seq);
	}

	@Override
	public boolean reservationHostCheck(Integer product_seq, String member_id) {
		return reservDao.reservationHostCheck(product_seq,member_id);
	}
}
