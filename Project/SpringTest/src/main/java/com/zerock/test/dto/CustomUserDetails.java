package com.zerock.test.dto;

import java.util.Collection;
import java.util.Collections;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomUserDetails implements UserDetails{
	
	private static final long serialVersionUID = 1L; 
	
	private UserDTO userDTO;
	
	private String username;
    private String password;
    
    public CustomUserDetails(String username, String password, UserDTO userDTO) {
    	this.username = username;
    	this.password = password;
    	this.userDTO = userDTO;
    }
    
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		if("TEST_ID".equals(username)) {
			return Collections.singleton(() -> "ROLE_ADMIN");
		}
		return Collections.singleton(() -> "ROLE_USER");
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return password;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return username;
	}
	
	public UserDTO getUserDTO() {
		return userDTO;
	}
	
    @Override
    public boolean isAccountNonExpired() {
        // 계정이 만료되지 않았다고 가정합니다.
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        // 계정이 잠겨 있지 않았다고 가정합니다.
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        // 자격 증명이 만료되지 않았다고 가정합니다.
        return true;
    }

    @Override
    public boolean isEnabled() {
        // 계정이 활성화되어 있다고 가정합니다.
        return true;
    }

}
