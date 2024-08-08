package com.zerock.test.service;


import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.zerock.test.dto.UserDTO;
import com.zerock.test.mapper.UserMapper;

@Service
public class UserService  {

    private final UserMapper mapper;
    private final PasswordEncoder passwordEncoder;
    

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
}