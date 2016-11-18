package com.kedu.arias.product.dao;

import java.util.List;

import com.kedu.arias.product.dto.NotsalesDto;
import com.kedu.arias.product.dto.ReservationDto;

public interface ReservationDao {
	public Integer duplicateReservationCheck(String member_id, int product_seq);
	public boolean insertReservation(ReservationDto reservDto);
	public boolean updateReservationStatus(ReservationDto reservDto);
	
	public List<NotsalesDto> selectInvalidReservationDate(Integer product_seq);
	public List<ReservationDto> selectReservationList (Integer product_seq);
	public Integer reservationHostCheck (Integer product_seq, String member_id);
}
