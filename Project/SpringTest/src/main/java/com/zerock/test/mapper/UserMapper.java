package com.zerock.test.mapper;

import com.zerock.test.dto.UserDTO;

public interface UserMapper {
	void insertUser(UserDTO dto);
	
	UserDTO findById(String id);
	
	UserDTO findUser(String email, String number);
	
	String findPwd(String id);
	
	UserDTO updateUserPassWord(String email, String newPwd);
}
