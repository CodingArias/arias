package com.kedu.arias.product.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.arias.product.dto.NotsalesDto;
import com.kedu.arias.product.dto.ProductDto;
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
		int reserv_status= 0;
		int count =(Integer)session.selectOne(namespace+".duplicateReservationCheck",map);
		System.out.println("count : " + count);
		if(count>0)
			reserv_status=session.selectOne(namespace+".selectMyReservationStatus",map);
		System.out.println("reserv_status : " +reserv_status);
		return reserv_status;
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
	public boolean reservationHostCheck(Integer product_seq, String member_id) {
		HashMap<String,Object> map = new HashMap<>();
		map.put("product_seq", product_seq);
		map.put("member_id", member_id);
		Integer count =session.selectOne(namespace+".reservationHostCheck",map);
		if(count>0)
			return true;
		else
			return false;
	}

	@Override
	public ReservationDto selectReservationDetail(Integer product_seq, String member_id,Integer reservation_seq) {
		HashMap<String,Object> map = new HashMap<>();
		map.put("product_seq", product_seq);
		map.put("member_id", member_id);
		map.put("reservation_seq", reservation_seq);
		
		return session.selectOne(namespace+".selectReservationDetail",map);
	}

	@Override
	public List<ReservationDto> selectMyReservationList(String member_id) {
		
		return session.selectList(namespace+".selectMyReservationList",member_id);
	}

	@Override
	public void cancelMyReservation(int reservation_seq) {
		session.delete(namespace+".cancelMyReservation",reservation_seq);
		
	}

}
