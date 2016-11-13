package com.kedu.arias.common.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.arias.product.dto.Accom_code;
import com.kedu.arias.product.dto.Bath_code;
import com.kedu.arias.product.dto.Bed_code;
import com.kedu.arias.product.dto.Building_code;
import com.kedu.arias.product.dto.Convin_code;
import com.kedu.arias.product.dto.Regulation_code;
import com.kedu.arias.product.dto.Safety_code;
import com.kedu.arias.product.dto.Space_code;
import com.kedu.arias.product.dto.Suit_guest_code;

@Repository
public class ProductOptionsDaoImpl implements ProductOptionsDao {

	@Inject
	SqlSession session;
	final String namespace= "com.kedu.arias.productOptionsMapper";
	
	@Override
	public List<Building_code> selectAllBuildingCode() {
		return session.selectList(namespace+".select_building_code");
	}
	@Override
	public List<Regulation_code> selectAllRegulationCode() {
		return session.selectList(namespace+".select_regulation_code");
	}
	@Override
	public List<Accom_code> selectAllAccomCode() {
		return session.selectList(namespace+".select_accom_code");
	}
	@Override
	public List<Bed_code> selectAllBedCode() {
		return session.selectList(namespace+".select_bed_code");
	}
	@Override
	public List<Suit_guest_code> selectAllSuitGuestCode() {
		return session.selectList(namespace+".select_suit_guest_code");
	}
	@Override
	public List<Bath_code> selectAllBathCode() {
		return session.selectList(namespace+".select_bath_code");
	}
	@Override
	public List<Convin_code> selectAllConvinCode() {
		return session.selectList(namespace+".select_convin_code");
	}
	@Override
	public List<Space_code> selectAllSpaceCode() {
		return session.selectList(namespace+".select_space_code");
	}
	@Override
	public List<Safety_code> selectAllSafetyCode() {
		return session.selectList(namespace+".select_safety_code");
	}
}
