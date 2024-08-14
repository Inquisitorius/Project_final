package com.zerock.test.mapper;

import com.zerock.test.dto.ShopDTO;
import com.zerock.test.dto.UserDTO;

public interface UserMapper {
	void insertUser(UserDTO dto);
	
	UserDTO findById(String id);
	
	UserDTO findUser(String email, String number);
	
	String findPwd(String id);
	
	void updateUserPassWord(String email, String pwd);
	
	Integer existById(String id);
	
	Integer existByemail(String email);
	
	Integer findResetUser(String id);
	
	void ChangePassWord(String id, String pwd);
	
	void insertShop(ShopDTO dto);
	
	UserDTO GetUserInfo(String id);
	
	void UpdateUser(UserDTO dto);
}
