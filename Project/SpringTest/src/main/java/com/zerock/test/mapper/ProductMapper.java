package com.zerock.test.mapper;

import java.util.List;

import com.zerock.test.dto.ProductDTO;

public interface ProductMapper {

	ProductDTO selectProduct(Integer shop_id);

	Integer countProductsByShopId(Integer shop_id);
	
	 List<ProductDTO> selectPro(int idx);
	
}
