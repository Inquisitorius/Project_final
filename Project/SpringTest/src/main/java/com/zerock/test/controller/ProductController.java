package com.zerock.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zerock.test.dto.ProductDTO;
import com.zerock.test.service.ProductService;

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
	/*
	 * @PostMapping("/product/status") public String product_trans() {
	 * 
	 * }
	 */
	
}
