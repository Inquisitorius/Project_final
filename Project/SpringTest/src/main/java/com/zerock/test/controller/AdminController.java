package com.zerock.test.controller;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.zerock.test.dto.AdminTestDTO;
import com.zerock.test.service.AdminService;

@Controller
@MapperScan("com.zerock.test.mapper")
public class AdminController {
	
	private final AdminService service;
	
	public AdminController(AdminService service)
	{
		this.service = service;
	}
	
	@GetMapping("/admin")
	public String adminHome()
	{
		List<AdminTestDTO> list = this.service.getAllTables();
		System.out.println("adminHome Test list cnt : " + list.size());
		
		return "admin/adminHome";
	}
		
	
	
}
