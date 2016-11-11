package com.kedu.arias.product.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.arias.product.dto.NotsalesDto;
import com.kedu.arias.product.dto.ProductDto;

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



}
