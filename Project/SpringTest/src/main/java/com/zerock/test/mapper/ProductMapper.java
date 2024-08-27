package com.zerock.test.mapper;

import java.util.List;

import com.zerock.test.dto.ProductDTO;

public interface ProductMapper {


	

	List<ProductDTO> selectProduct(Integer shop_id, int size);

	Integer countProductsByShopId(Integer shop_id);
	
	Integer completedcnt(Integer shop_id);
	
	Integer sortCnt(Integer shop_id, String status);

	List<ProductDTO> selectLowPrice(Integer shop_id, int size);

	List<ProductDTO> selectHighPrice(Integer shop_id, int size);

	List<ProductDTO> selectNewst(Integer shop_id, int size);

	List<ProductDTO> selectpopularity(Integer shop_id, int size);
	
	List<ProductDTO> completed(Integer shop_id, int size);

	List<ProductDTO> selectPro(int idx);
	
	List<ProductDTO> selectAllPriceAsc(Integer shop_id, int size);
	
	List<ProductDTO> selectCompletedPriceAsc(Integer shop_id, int size);

	Integer saleCnt(Integer shop_id);

	Integer progressCnt(Integer shop_id);

	List<ProductDTO> selectSalePriceAsc(Integer shop_id, int size);
	
	List<ProductDTO> selectProgressPriceAsc(Integer shop_id, int size);
	
	List<ProductDTO> selectdescProducts(Integer shop_id, int size, String status);
	
	List<ProductDTO> selectdescAllProducts(Integer shop_id, int size);

	List<ProductDTO> selectnewestProducts(Integer shop_id, int size, String status);
	
	List<ProductDTO> selectpopularityProducts(Integer shop_id, int size, String status);

	List<ProductDTO> statusProducts(Integer shop_id, int size, String status);
				
}

