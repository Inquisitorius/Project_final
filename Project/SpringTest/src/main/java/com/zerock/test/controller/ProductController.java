package com.zerock.test.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zerock.test.dto.ProductDTO;
import com.zerock.test.service.ProductService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	

	@GetMapping("/product")
	public String product(@RequestParam int p_idx ,Model model) {	
		List<ProductDTO> product = productService.selectPro(p_idx);
		model.addAttribute("product",product);
		return "ProductInfo";
	}

	@GetMapping("/product-add")
	public String productAdd(@RequestParam ("idx")int p_idx, HttpSession session, Model model) {
	    ProductDTO product = productService.selectOne(p_idx); // 단일 ProductDTO 객체를 가져온다고 가정

	    // 최근 본 상품 세션 처리
	    List<ProductDTO> recentlyViewed = (List<ProductDTO>) session.getAttribute("recentlyViewed");
	    if (recentlyViewed == null) {
	        recentlyViewed = new ArrayList<>();
	    }

	    // 이미 본 상품인지 확인하여 중복 추가 방지
	    if (recentlyViewed.stream().noneMatch(p -> p.getIdx() == p_idx)) {
	        recentlyViewed.add(product);
	        
	        session.setAttribute("recentlyViewed", recentlyViewed);
	    }

	    model.addAttribute("product", product);
	    return "view"; // 뷰 이름
	}
	
	@PostMapping("/product/status")
	@ResponseBody
		public String updateproduct(@RequestParam("product_idx") int idx) {
		 System.out.println("deletechatroom : " + idx);
		 log.info("deletechatroom " + idx);
		 try {
		        productService.updateproduct(idx);
		        return "success";  // 응답 문자열 확인
		    } catch (Exception e) {
		        e.printStackTrace();
		        return "error";
		    }
	}
}
