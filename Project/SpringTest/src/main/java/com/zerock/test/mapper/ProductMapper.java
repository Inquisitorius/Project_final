package com.zerock.test.mapper;

import java.util.List;

import com.zerock.test.dto.ProductDTO;

public interface ProductMapper {

	List<ProductDTO> selectProduct(Integer shop_id, int size);

	Integer countProductsByShopId(Integer shop_id);

	List<ProductDTO> selectLowPrice(Integer shop_id, int size);

	List<ProductDTO> selectHighPrice(Integer shop_id, int size);

	List<ProductDTO> selectNewst(Integer shop_id, int size);

	List<ProductDTO> selectpopularity(Integer shop_id,int offset, int size);

	List<ProductDTO> selectPro(int idx);
}

