package com.zerock.test.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.zerock.test.dto.CustomUserDetails;

@ControllerAdvice
public class GlobalControllerAdvice {
	 @ModelAttribute("username")
	    public String getUsername() {
	        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	        if(auth != null && auth.isAuthenticated() && auth.getPrincipal() instanceof CustomUserDetails) {
	        	CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
	            return userDetails.getUserDTO().getName();  // UserDTO의 name 속성
	        }else {
	        	return null;
	        }
//	        return (auth != null && auth.isAuthenticated()) ? auth.getName() : null;
	    }
	 
	 @ModelAttribute("isAdmin")
	 	public boolean isAdmin() {
		 Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		 if(auth != null && auth.isAuthenticated() && auth.getPrincipal() instanceof CustomUserDetails) {
			 CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
			 return userDetails.getAuthorities().stream().anyMatch(authority -> authority.getAuthority().equals("ROLE_ADMIN"));
		 }
		 return false;
	 }
}
