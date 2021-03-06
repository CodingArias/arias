package com.kedu.arias.product.service;

import java.util.List;

import com.kedu.arias.product.dto.NotsalesDto;
import com.kedu.arias.product.dto.ProductDto;
import com.kedu.arias.product.dto.ReservationDto;

public interface ReservationService {
	public Integer duplicateReservationCheck(String member_id, int product_seq);
	public boolean insertReservation(ReservationDto reservDto);
	public boolean updateReservationStatus(ReservationDto reservDto);
	public List<NotsalesDto> selectInvalidReservationDate(Integer product_seq);

	public List<ReservationDto> selectReservationList (Integer product_seq);
	public boolean reservationHostCheck (Integer product_seq, String member_id);
	public ReservationDto selectReservationDetail(Integer product_seq, String member_id,Integer reservation_seq);
	
	public List<ReservationDto> selectMyReservationList(String member_id);
	
	public void cancelMyReservation(int reservation_seq);
	
}
