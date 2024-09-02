package com.zerock.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.zerock.test.dto.ProductDTO;
import com.zerock.test.dto.ReviewDTO;
import com.zerock.test.dto.ShopDTO;
import com.zerock.test.service.ProductService;
import com.zerock.test.service.ReviewsService;
import com.zerock.test.service.ShopService;

@RestController
public class RestProductController {
	
	@Autowired
	ProductService productService;
	
	
	@GetMapping("/getProducts")
	public ModelAndView getProducts(@RequestParam(value = "size", defaultValue = "10") int size) {
	    List<ProductDTO> products = productService.AllProducts(size);
	    Integer cnt = productService.AllProductsCnt();
	    ModelAndView mav = new ModelAndView("list");
	    mav.addObject("products", products);
	    mav.addObject("cnt", cnt);
	    return mav; 
	}
	
	
	
	
}
