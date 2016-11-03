package com.kedu.arias.product.dao;

import java.util.List;

import com.kedu.arias.product.dto.ProductDto;

public interface ProductDao {
	public boolean step1_insert(ProductDto pDto)throws Exception;
	public List<ProductDto> selectAllListOfCity();

}
