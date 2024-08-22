package com.zerock.test.mapper;

import java.util.List;

import com.zerock.test.dto.ProductDTO;

public interface ProductMapper {

	List<ProductDTO> selectProduct(Integer shop_id);

	Integer countProductsByShopId(Integer shop_id);
	
	List<ProductDTO> selectLowPrice(Integer shop_id);
	
	List<ProductDTO> selectHighPrice(Integer shop_id);
	
	List<ProductDTO> selectNewst(Integer shop_id);
	
	List<ProductDTO> selectpopularity(Integer shop_id);
	
	List<ProductDTO> selectPro(int idx);
	
}
