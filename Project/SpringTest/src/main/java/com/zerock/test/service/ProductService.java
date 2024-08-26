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
	
	
	private String convertStatus(String status) {
	    switch (status) {
	        case "completed":
	            return "거래완료";
	        case "for-sale":
	            return "판매중";
	        case "in-progress":
	            return "거래중";
	        default:
	            return "all"; // 기본값
	    }
	}
	
	
	public List<ProductDTO> selectProduct(Integer shop_id, int size) {
		
		return mapper.selectProduct(shop_id, size);
	}
	
	public Integer countProductsByShopId(Integer shop_id) {
		return mapper.countProductsByShopId(shop_id);
	}
	
	public Integer completedcnt(Integer shop_id) {
		return mapper.completedcnt(shop_id);
	}
	
	public Integer saleCnt(Integer shop_id) {
		return mapper.saleCnt(shop_id);
	}
	
	public Integer progressCnt(Integer shop_id){
		return mapper.progressCnt(shop_id);
	}
	
	public List<ProductDTO> selectLowPrice(Integer shop_id, int size){
		
		return mapper.selectLowPrice(shop_id, size);
	}
	
	public List<ProductDTO> selectHighPrice(Integer shop_id, int size){
		
		return mapper.selectHighPrice(shop_id, size);
	}
	
	public List<ProductDTO> selectNewst(Integer shop_id, int size){
		
		return mapper.selectNewst(shop_id, size);
	}
	
	public List<ProductDTO> selectpopularity(Integer shop_id, int size){
		
		return mapper.selectpopularity(shop_id, size);
	}
	
	public List<ProductDTO> completed(Integer shop_id, int size){
		
		return mapper.completed(shop_id, size);
	}
	
	
	public List<ProductDTO> selectPro(int idx){
		return mapper.selectPro(idx);
	}
	
	public List<ProductDTO> selectAllPriceAsc(Integer shop_id, int size){
		return mapper.selectAllPriceAsc(shop_id, size);
	}
	
	public List<ProductDTO> selectCompletedPriceAsc(Integer shop_id, int size){
		return mapper.selectCompletedPriceAsc(shop_id, size);
	}
	
	public List<ProductDTO> selectSalePriceAsc(Integer shop_id, int size){
		return mapper.selectSalePriceAsc(shop_id, size);
	}
	
	public List<ProductDTO> selectProgressPriceAsc(Integer shop_id, int size){
		return mapper.selectProgressPriceAsc(shop_id, size);
	}
	
	public List<ProductDTO> selectdescProducts(Integer shop_id, int size, String status){
		System.out.println(convertStatus(status) + "112123");
		return mapper.selectdescProducts(shop_id, size, convertStatus(status));
	}
	
	public List<ProductDTO> selectdescAllProducts(Integer shop_id, int size){
		return mapper.selectdescAllProducts(shop_id, size);
	}
	
	public Integer sortCnt(Integer shop_id, String status) {
		return mapper.sortCnt(shop_id, status);
	}
}
