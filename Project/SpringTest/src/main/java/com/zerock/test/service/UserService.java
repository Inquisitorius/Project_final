package com.zerock.test.service;


import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.zerock.test.dto.UserDTO;
import com.zerock.test.mapper.UserMapper;

@Service
public class UserService  {

    private  UserMapper mapper;
    private  PasswordEncoder passwordEncoder;
    

    public UserService(UserMapper mapper, PasswordEncoder passwordEncoder) {
        this.mapper = mapper;
        this.passwordEncoder = passwordEncoder;
    }

    public void registUser(UserDTO dto) {
        String encodedPassword = passwordEncoder.encode(dto.getPwd());
        dto.setPwd(encodedPassword);
        mapper.insertUser(dto);
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
   
   public Integer findResetUser(String id) {
	   return mapper.findResetUser(id);
   }
   
   public void ChangePassWord(String id, String pwd) {
	   String encodedPassword = passwordEncoder.encode(pwd);
	   mapper.ChangePassWord(id, encodedPassword);
   }
}