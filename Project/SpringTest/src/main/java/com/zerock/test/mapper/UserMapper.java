package com.zerock.test.mapper;

import java.util.Map;

import com.zerock.test.dto.UserDTO;

public interface UserMapper {
	void insertUser(UserDTO dto);
	
	UserDTO findById(String id);
	
	UserDTO findUser(Map<String, Object> params);

}
