package com.zerock.test.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.zerock.test.dto.TestDTO;
import com.zerock.test.mapper.TestMapper;

@Service
public class TestService {
	private final TestMapper mapper;
	
	public TestService(TestMapper mapper) {
		this.mapper = mapper;
	}
	
	public List<TestDTO> getAllTables(){
		return mapper.selectAll();
	}
}
