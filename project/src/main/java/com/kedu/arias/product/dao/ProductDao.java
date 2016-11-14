package com.kedu.arias.product.dao;


import java.util.List;

import com.kedu.arias.product.dto.Accom_code;
import com.kedu.arias.product.dto.Bath_code;
import com.kedu.arias.product.dto.Bed_code;
import com.kedu.arias.product.dto.Building_code;
import com.kedu.arias.product.dto.Convin_code;
import com.kedu.arias.product.dto.NotsalesDto;
import com.kedu.arias.product.dto.ProductDto;
import com.kedu.arias.product.dto.Regulation_code;
import com.kedu.arias.product.dto.Safety_code;
import com.kedu.arias.product.dto.Space_code;
import com.kedu.arias.product.dto.Suit_guest_code;

public interface ProductDao {
	public boolean step1_insert(ProductDto pDto)throws Exception;
	public boolean step2_insert(ProductDto pDto)throws Exception;
	public boolean notsales_insert(int product_seq,List<NotsalesDto> notsalesList);

	public boolean insert_convin_options(int product_seq, List<String> convin_code_checkeds);
	public boolean insert_bath_options(int product_seq, List<String> bath_code_checkeds);
	public boolean insert_safety_options(int product_seq, List<String> safety_code_checkeds);
	public boolean insert_regulation_options(int product_seq, List<String> regulation_code_checkeds);
	public boolean insert_space_options(int product_seq, List<String> space_code_checkeds);
	

	
	public boolean update_product_options(int product_seq, String building_id, String accom_id, String bed_id, String sguest_id);
	
	public int create_next_product_seq(String member_id);
	

	
	public List<ProductDto> select_product_search(double lng, double lat, int number_of_people) throws Exception;


}
