package com.kedu.arias.product.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.arias.member.dto.MemberDto;
import com.kedu.arias.product.dto.Convin_code;
import com.kedu.arias.product.dto.NotsalesDto;
import com.kedu.arias.product.dto.ProductDto;
import com.kedu.arias.product.dto.ProductImgDto;
import com.kedu.arias.product.dto.Regulation_code;
import com.kedu.arias.product.dto.Safety_code;
import com.kedu.arias.product.dto.Space_code;

@Repository
public class ProductDaoImpl implements ProductDao{

	@Inject
	SqlSession session;
	final String namespace= "com.kedu.arias.productMapper";
	@Override
	public boolean step1_insert(ProductDto pDto) throws Exception {
		session.insert(namespace+".product_insert_step1", pDto);
		return false;
	}
	@Override
	public int create_next_product_seq(String member_id) {
		return session.selectOne(namespace+".create_next_product_seq",member_id);
	}
	@Override
	public boolean step2_insert(ProductDto pDto) throws Exception {
		int result=0;
		 result=session.update(namespace+".product_insert_step2", pDto);
		 if(result>-1)
			 return true;
		 else
			 return false;
	}
	@Override
	public boolean notsales_insert(int product_seq,List<NotsalesDto> notsalesList) {
		int notsales_seq=0;
		for(NotsalesDto nDto : notsalesList){
			if(nDto!=null){
				nDto.setNotsales_seq(notsales_seq);
				nDto.setProduct_seq(product_seq);
				session.insert(namespace+".insert_notsales",nDto);
			}
			notsales_seq++;
		}
		return false;
	}
	
	@Override
	public boolean update_product_options(int product_seq, String building_id, String accom_id, String bed_id,
			String sguest_id) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("product_seq", product_seq);
		map.put("building_id", building_id);
		map.put("accom_id", accom_id);
		map.put("bed_id", bed_id);
		map.put("sguest_id", sguest_id);
		
		session.insert(namespace+".update_product_options", map);
		return false;
	}
	@Override
	public boolean insert_convin_options(int product_seq, List<String> convin_code_checkeds) {
		HashMap<String,Object> map = new HashMap<>();
		for(String convin_id : convin_code_checkeds){
			map.put("product_seq", product_seq);
			map.put("convin_id", convin_id);
			session.insert(namespace+".insert_convin_options", map);
		}
		return false;
	}
	@Override
	public boolean insert_bath_options(int product_seq, List<String> bath_code_checkeds) {
		HashMap<String,Object> map = new HashMap<>();
		for(String bath_id : bath_code_checkeds){
			map.put("product_seq", product_seq);
			map.put("bath_id", bath_id);
			session.insert(namespace+".insert_bath_options", map);
		}
		return false;
	}
	@Override
	public boolean insert_safety_options(int product_seq, List<String> safety_code_checkeds) {
		HashMap<String,Object> map = new HashMap<>();
		for(String safety_id : safety_code_checkeds){
			map.put("product_seq", product_seq);
			map.put("safety_id", safety_id);
			session.insert(namespace+".insert_safety_options", map);
		}
		return false;
	}
	@Override
	public boolean insert_regulation_options(int product_seq, List<String> regulation_code_checkeds) {
		HashMap<String,Object> map = new HashMap<>();
		for(String regulation_id : regulation_code_checkeds){
			map.put("product_seq", product_seq);
			map.put("regulation_id", regulation_id);
			session.insert(namespace+".insert_regulation_options", map);
		}
		return false;
	}
	@Override
	public boolean insert_space_options(int product_seq, List<String> space_code_checkeds) {
		HashMap<String,Object> map = new HashMap<>();
		for(String space_id : space_code_checkeds){
			map.put("product_seq", product_seq);
			map.put("space_id", space_id);
			session.insert(namespace+".insert_space_options", map);
		}
		return false;
	}
	
	@Override
	public List<ProductDto> select_product_search(double lng, double lat, int number_of_people) throws Exception {
		HashMap<String,Object> map = new HashMap<>();
		map.put("lng", lng);
		map.put("lat", lat);
		map.put("number_of_people", number_of_people);
		return session.selectList(namespace+".select_product_search", map);
	}
	
	@Override
	public boolean insert_product_images(int product_seq, List<String> pimgs) {
		HashMap<String,Object> map = new HashMap<>();
		for(String pimg_name : pimgs){
			map.put("product_seq", product_seq);
			map.put("pimg_name", pimg_name);
			session.insert(namespace+".insert_product_images", map);
		}
		return false;
	}

	@Override
	public ProductDto select_product_detail(int prdouct_seq) throws Exception {
		return session.selectOne(namespace+".select_product_detail", prdouct_seq);
	}
	
	@Override
	public List<Safety_code> product_safety(int product_seq) throws Exception {
		return session.selectList(namespace+".product_safety", product_seq);
	}
	
	@Override
	public List<Convin_code> product_convin(int product_seq) throws Exception {
		return session.selectList(namespace+".product_convin", product_seq);
	}
	
	@Override
	public List<Space_code> product_space(int product_seq) throws Exception {
		return session.selectList(namespace+".product_space", product_seq);
	}
	
	@Override
	public List<Regulation_code> product_regulation(int product_seq) throws Exception {
		return session.selectList(namespace+".product_regulation", product_seq);
	}
	
	@Override
	public MemberDto product_member(int product_seq) throws Exception {
		return session.selectOne(namespace+".product_member", product_seq);
	}
	@Override
	public List<ProductImgDto> selectAllproductPicture(int product_seq) {
		return session.selectList(namespace+".selectAllproductPicture", product_seq);
	}
}
