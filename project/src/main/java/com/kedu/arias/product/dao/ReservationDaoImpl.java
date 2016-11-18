package com.kedu.arias.product.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.arias.product.dto.NotsalesDto;
import com.kedu.arias.product.dto.ReservationDto;

@Repository
public class ReservationDaoImpl implements ReservationDao{
	public final String namespace="com.kedu.arias.reservationMapper";
	
	@Inject
	SqlSession session;

	@Override
	public Integer duplicateReservationCheck(String member_id, int product_seq) {
		HashMap<String,Object> map =new HashMap<>();
		map.put("member_id", member_id);
		map.put("product_seq", product_seq);
		
		return session.selectOne(namespace+".duplicateReservationCheck",map);
	}

	@Override
	public boolean insertReservation(ReservationDto reservDto) {
		session.insert(namespace+".insertReservation", reservDto);
		return false;
	}

	@Override
	public boolean updateReservationStatus(ReservationDto reservDto) {
		session.update(namespace+".updateReservationStatus", reservDto);
		return false;
	}

	@Override
	public List<NotsalesDto> selectInvalidReservationDate(Integer product_seq) {
		return session.selectList(namespace+".selectInvalidReservationDate",product_seq );
	}

	@Override
	public List<ReservationDto> selectReservationList(Integer product_seq) {
		return session.selectList(namespace+".selectReservationList",product_seq);
	}

	@Override
	public Integer reservationHostCheck(Integer product_seq, String member_id) {
		HashMap<String,Object> map = new HashMap<>();
		map.put("product_seq", product_seq);
		map.put("member_id", member_id);
		
		return session.selectOne(namespace+".reservationHostCheck",map);
	}

}
