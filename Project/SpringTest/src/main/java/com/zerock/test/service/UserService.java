package com.zerock.test.service;


import java.util.Random;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.zerock.test.dto.ShopDTO;
import com.zerock.test.dto.UserDTO;
import com.zerock.test.mapper.UserMapper;

@Service
public class UserService  {

    private  UserMapper mapper;
    private  PasswordEncoder passwordEncoder;
    private Random random = new Random();
    
    private String generateShopName() {
    	int randNum = random.nextInt(90000000) + 10000000;
    	return String.format("상점%d호", randNum);
    }
    
    public UserService(UserMapper mapper, PasswordEncoder passwordEncoder) {
    	this.mapper = mapper;
    	this.passwordEncoder = passwordEncoder;
    }

    public void registUser(UserDTO dto, ShopDTO shop_dto) {
        String encodedPassword = passwordEncoder.encode(dto.getPwd());
        dto.setPwd(encodedPassword);
        shop_dto.setShop_name(generateShopName());
        mapper.insertUser(dto);
        mapper.insertShop(shop_dto);
    }

    public UserDTO findById(String id) {
        return mapper.findById(id);
    }
    
   public UserDTO findUser(String email, String number) {
	   return mapper.findUser(email, number);
   }

   public String findPwd(String id) {
	   return mapper.findPwd(id);
   }
   
   public void UserUpdatePwd(String email, String pwd) {
	   mapper.updateUserPassWord(email, pwd);
   }
   
   public Integer existById(String id) {
	   return mapper.existById(id);
   }
   
   public Integer existByemail(String email) {
	   return mapper.existByemail(email);
   }
   
   public Integer findResetUser(String id) {
	   
       return mapper.findResetUser(id);
   }
   
   public void ChangePassWord(String id, String pwd) {
	   String encodedPassword = passwordEncoder.encode(pwd);
	   mapper.ChangePassWord(id, encodedPassword);
   }
   
   public UserDTO GetUserInfo(String id) {
	   return mapper.GetUserInfo(id);
   }
   
   public void UpdateUser(UserDTO dto) {
	   String encodedPassword = passwordEncoder.encode(dto.getPwd());
	   dto.setPwd(encodedPassword);
	   mapper.UpdateUser(dto);
   }
  
}