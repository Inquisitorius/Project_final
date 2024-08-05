package com.zerock.test.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.zerock.test.dto.AdminTestDTO;
import com.zerock.test.mapper.AdminMapper;

@Service
public class AdminService {
	private final AdminMapper mapper;
	
	public AdminService(AdminMapper mapper)
	{
		this.mapper = mapper;
	}
	
	public List<AdminTestDTO> getAllTables()
	{
		return mapper.selectAll();
	}
	
}
