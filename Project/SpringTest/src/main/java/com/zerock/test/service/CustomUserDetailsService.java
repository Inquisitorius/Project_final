package com.zerock.test.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.zerock.test.dto.CustomUserDetails;
import com.zerock.test.dto.UserDTO;
import com.zerock.test.mapper.UserMapper;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	private final UserMapper userMapper;

	public CustomUserDetailsService(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserDTO userDTO = userMapper.findById(username);

		if (userDTO == null) {
			throw new UsernameNotFoundException("User not found with username: " + username);
		}
		  // 비밀번호와 권한 설정
        CustomUserDetails userDetails = new CustomUserDetails(userDTO.getId(), userDTO.getPwd(), userDTO);
		
        // 디버깅용 로그
        System.out.println("User password from DB: " + userDTO.getPwd());
        
        return userDetails;
	}

}
