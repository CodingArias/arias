package com.kedu.arias.product.service;

import com.kedu.arias.product.dto.ProductDto;

public interface ProductService {
	public boolean step1_insert(ProductDto pDto)throws Exception;
	public int create_next_product_seq(String member_id);
}
