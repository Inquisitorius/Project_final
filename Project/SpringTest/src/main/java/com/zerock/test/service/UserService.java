package com.zerock.test.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zerock.test.dto.UserDTO;
import com.zerock.test.mapper.UserMapper;

@Service
public class UserService {
	
	@Autowired
	private UserMapper mapper;
	
	public void registUser(UserDTO dto) {
		mapper.insertUser(dto);
	}
}
