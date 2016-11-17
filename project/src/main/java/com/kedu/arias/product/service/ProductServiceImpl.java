package com.kedu.arias.product.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kedu.arias.member.dto.MemberDto;
import com.kedu.arias.product.dao.ProductDao;
import com.kedu.arias.product.dto.Convin_code;
import com.kedu.arias.product.dto.NotsalesDto;
import com.kedu.arias.product.dto.ProductDto;
import com.kedu.arias.product.dto.ProductImgDto;
import com.kedu.arias.product.dto.Regulation_code;
import com.kedu.arias.product.dto.Safety_code;
import com.kedu.arias.product.dto.Space_code;

@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	ProductDao pDao;
	@Override
	public boolean step1_insert(ProductDto pDto) throws Exception {
		return pDao.step1_insert(pDto);
	}
	@Override
	public int create_next_product_seq(String member_id) {
		return pDao.create_next_product_seq(member_id);
	}
	@Override
	public boolean step2_insert(ProductDto pDto) throws Exception {
		return pDao.step2_insert(pDto);
	}
	@Override
	public boolean notsales_insert(int product_seq,List<NotsalesDto> notsalesList) {
		pDao.notsales_insert(product_seq, notsalesList);
		return false;
	}
	@Override
	public boolean update_product_options(int product_seq, String building_id, String accom_id, String bed_id,
			String sguest_id) {
		return pDao.update_product_options(product_seq, building_id, accom_id, bed_id, sguest_id);
		
	}
	@Override
	public boolean insert_convin_options(int product_seq, List<String> convin_code_checkeds) {
		if(convin_code_checkeds!=null && convin_code_checkeds.size()>0)
			return pDao.insert_convin_options(product_seq, convin_code_checkeds);
		else
			return false;
		
	}
	@Override
	public boolean insert_bath_options(int product_seq, List<String> bath_code_checkeds) {
		if(bath_code_checkeds!=null && bath_code_checkeds.size()>0)
			return pDao.insert_bath_options(product_seq, bath_code_checkeds);
		else
			return false;
		
	}
	@Override
	public boolean insert_safety_options(int product_seq, List<String> safety_code_checkeds) {
		if(safety_code_checkeds!=null && safety_code_checkeds.size()>0)
			return pDao.insert_safety_options(product_seq, safety_code_checkeds);
		else
			return false;
	}
	@Override
	public boolean insert_regulation_options(int product_seq, List<String> regulation_code_checkeds) {
		if(regulation_code_checkeds!=null && regulation_code_checkeds.size()>0)
			return pDao.insert_regulation_options(product_seq, regulation_code_checkeds);
		else
			return false;
				
	}
	@Override
	public boolean insert_space_options(int product_seq, List<String> space_checkeds) {
		if(space_checkeds!=null && space_checkeds.size()>0)
			return pDao.insert_space_options(product_seq, space_checkeds);
		else
			return false;
	}
	
	@Override
	public List<ProductDto> select_product_search(double lng, double lat, int number_of_people) throws Exception {
		return pDao.select_product_search(lng, lat, number_of_people);
	}
	
	
	@Override
	public boolean insert_product_images(int product_seq, List<String> pimgs) {
		if(pimgs!=null && pimgs.size()>0)
			return pDao.insert_product_images(product_seq, pimgs);
		else
			return false;
		
	}
		
	@Override
	public ProductDto select_product_detail(int product_seq) throws Exception {
		return pDao.select_product_detail(product_seq);
	}
	
	@Override
	public List<Safety_code> product_safety(int product_seq) throws Exception {
		return pDao.product_safety(product_seq);
	}
	
	@Override
	public List<Convin_code> product_convin(int product_seq) throws Exception {
		return pDao.product_convin(product_seq);
	}
	
	@Override
	public List<Space_code> product_space(int product_seq) throws Exception {
		return pDao.product_space(product_seq);
	}
	
	@Override
	public List<Regulation_code> product_regulation(int product_seq) throws Exception {
		return pDao.product_regulation(product_seq);
	}
	
	@Override
	public MemberDto product_member(int product_seq) throws Exception {
		return pDao.product_member(product_seq);
	}
	@Override
	public List<ProductImgDto> selectAllproductPicture(int product_seq) {
		return pDao.selectAllproductPicture(product_seq);
	}
	
	@Override
	public List<ProductDto> select_product_list(String member_id) throws Exception {
		return pDao.select_product_list(member_id);
	}
}
