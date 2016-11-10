package com.kedu.arias.product.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kedu.arias.product.dao.ProductDao;
import com.kedu.arias.product.dto.ProductDto;

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

}
