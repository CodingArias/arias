package com.kedu.arias.product.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.arias.product.dto.ProductDto;

@Repository
public class ProductDaoImpl implements ProductDao{

	@Inject
	SqlSession session;
	final String namespace= "com.kedu.arias.productMapper";
	@Override
	public boolean insert(ProductDto pDto) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<ProductDto> selectAllListOfCity() {
		Map<String,Object> paramMap =new HashMap<>();
		paramMap.put("country_id", "c0001");
		paramMap.put("city_id", "ct0001");
		
		return session.selectList(namespace+".selectAllListByKeyword", paramMap);
	}


}
