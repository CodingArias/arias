package com.kedu.arias.common.dao;

import java.util.List;

import com.kedu.arias.product.dto.Accom_code;
import com.kedu.arias.product.dto.Bath_code;
import com.kedu.arias.product.dto.Bed_code;
import com.kedu.arias.product.dto.Building_code;
import com.kedu.arias.product.dto.Convin_code;
import com.kedu.arias.product.dto.Regulation_code;
import com.kedu.arias.product.dto.Safety_code;
import com.kedu.arias.product.dto.Space_code;
import com.kedu.arias.product.dto.Suit_guest_code;

public interface ProductOptionsDao {
	public List<Building_code> selectAllBuildingCode();
	public List<Regulation_code> selectAllRegulationCode();
	public List<Accom_code> selectAllAccomCode();
	public List<Bed_code> selectAllBedCode();
	public List<Suit_guest_code> selectAllSuitGuestCode();
	public List<Bath_code> selectAllBathCode();
	public List<Convin_code> selectAllConvinCode();
	public List<Space_code> selectAllSpaceCode();
	public List<Safety_code> selectAllSafetyCode();

}
