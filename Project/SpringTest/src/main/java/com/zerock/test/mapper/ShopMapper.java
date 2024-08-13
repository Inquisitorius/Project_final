package com.zerock.test.mapper;

import java.util.Map;

import com.zerock.test.dto.ShopDTO;

public interface ShopMapper {
	public Integer findNum(String userid);
	
	public ShopDTO viewShop(Integer shop_id);
	
	public int updateShopName(Map<String, Object> params);
}
