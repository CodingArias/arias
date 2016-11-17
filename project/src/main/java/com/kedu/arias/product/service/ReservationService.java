package com.kedu.arias.product.service;

import java.util.List;

import com.kedu.arias.product.dto.NotsalesDto;
import com.kedu.arias.product.dto.ReservationDto;

public interface ReservationService {
	public Integer duplicateReservationCheck(String member_id, int product_seq);
	public boolean insertReservation(ReservationDto reservDto);
	public boolean updateReservationStatus(ReservationDto reservDto);
	public List<NotsalesDto> selectInvalidReservationDate(Integer product_seq);
}
