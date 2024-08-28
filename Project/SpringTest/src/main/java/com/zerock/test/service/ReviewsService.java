package com.zerock.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zerock.test.dto.ReviewDTO;
import com.zerock.test.mapper.ReviewsMapper;

@Service
public class ReviewsService {
	@Autowired
	ReviewsMapper mapper;
	
	public Integer ReviewsCnt(Integer shop_id) {
		return mapper.ReviewsCnt(shop_id);
	}
	
	public List<ReviewDTO> selectReview(Integer shop_id, int size){
		return mapper.selectReview(shop_id, size);
	}
	
	public Double ShopRating(Integer shop_id) {
		return mapper.ShopRating(shop_id);
	}
}
