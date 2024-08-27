package com.zerock.test.service;

import org.springframework.stereotype.Service;

import com.zerock.test.mapper.Product_DetailMapper;

@Service
public class Product_DetailService
{
	private final Product_DetailMapper mapper;
	
	public Product_DetailService(Product_DetailMapper mapper)
	{
		this.mapper = mapper;
	}
}
