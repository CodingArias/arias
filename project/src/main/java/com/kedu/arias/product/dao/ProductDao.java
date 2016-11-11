package com.kedu.arias.product.dao;


import java.util.List;

import com.kedu.arias.product.dto.NotsalesDto;
import com.kedu.arias.product.dto.ProductDto;

public interface ProductDao {
	public boolean step1_insert(ProductDto pDto)throws Exception;
	public boolean step2_insert(ProductDto pDto)throws Exception;
	public boolean notsales_insert(int product_seq,List<NotsalesDto> notsalesList);
	public int create_next_product_seq(String member_id);


}
