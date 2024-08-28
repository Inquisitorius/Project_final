package com.zerock.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.zerock.test.service.AdminService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class Product_DetailController 
{
	private final AdminService service;	
	private boolean serverEnv;
	
	
	public Product_DetailController(AdminService service)
	{
		this.service = service;
	}
	
	@GetMapping("/ProductInsert")
	public String pTest(Model model)
	{
		return "pTest_1";
	}
	
	@GetMapping("/pTest_2")
	public String pTest2(Model model)
	{
		return "pTest_2";
	}
	
}
