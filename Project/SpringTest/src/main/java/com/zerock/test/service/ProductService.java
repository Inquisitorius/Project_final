package com.zerock.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zerock.test.dto.ProductDTO;
import com.zerock.test.mapper.ProductMapper;

@Service
public class ProductService {
	@Autowired
	ProductMapper mapper;
	
	public ProductDTO selectProduct(Integer shop_id) {
		return mapper.selectProduct(shop_id);
	}
	
	public Integer countProductsByShopId(Integer shop_id) {
		return mapper.countProductsByShopId(shop_id);
	}
	

	    public List<ProductDTO> selectPro(int idx) {
	        return mapper.selectPro(idx);
	    }
}
