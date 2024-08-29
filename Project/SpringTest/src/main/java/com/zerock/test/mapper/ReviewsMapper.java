package com.zerock.test.mapper;

import java.util.List;

import com.zerock.test.dto.ReviewDTO;

public interface ReviewsMapper {
	Integer ReviewsCnt(Integer shop_id);
	
	List<ReviewDTO> selectReview(Integer shop_id, int size);
	
	Double ShopRating(Integer shop_id);

	void insertReview(ReviewDTO dto);

	String getImg(Integer otherShopIds);
	
	void UpdateReview(ReviewDTO dto);
	
	void deleteReview(int idx);

	
}
