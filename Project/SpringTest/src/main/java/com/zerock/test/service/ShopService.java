package com.zerock.test.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zerock.test.dto.ShopDTO;
import com.zerock.test.mapper.ShopMapper;

@Service
public class ShopService {
	@Autowired
	private ShopMapper mapper;
	
	public Integer findNum(String userid) {
		return mapper.findNum(userid);
	}
	
	public ShopDTO viewShop(Integer shop_id) {
		return mapper.viewShop(shop_id);
	}
	
	public boolean updateShopName(Map<String, Object> params) {
		return mapper.updateShopName(params) > 0;
	}
	
	public boolean updateShopInfo(Map<String, Object> params) {
		return mapper.updateShopInfo(params) > 0;
	}
}
