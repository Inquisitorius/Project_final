package com.zerock.test.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.Redirect;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.zerock.test.dto.TestDTO;
import com.zerock.test.dto.UserDTO;
import com.zerock.test.service.TestService;
import com.zerock.test.service.UserService;


@Controller
@MapperScan("com.zerock.test.mapper")
public class MainController {



    @Autowired
    private UserService userService;
 
    @GetMapping("/hello")
    public String hello() {
    	
        return "view";
    }

    
    
    @GetMapping("/login")
    public String Login() {
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	
    	if(authentication != null && authentication.isAuthenticated() && authentication.getPrincipal() instanceof UserDetails) {
    		return "redirect:/hello";
    	}
    	return "LoginPage";
    }
    
    @GetMapping("/adminfail")
    public String AdminFail() {
    	return "adminPage2";
    }
    
    
    @GetMapping("/admin")
    public String Admin() {
    	return "adminPage";
    }
    
    @GetMapping("/join")
    public String join() {
    	return "joinPage";
    }
    
    @PostMapping("/join")
    public String handleJoin(@RequestParam("id") String id, 
                             @RequestParam("pwd") String pwd,
                             @RequestParam("name") String name,
                             @RequestParam("mail") String mail,
                             @RequestParam("number") String number,
                             @RequestParam("roadAddress") String streetAddress,
                             @RequestParam("detailAddress") String detailAddress,
                             @RequestParam("gender") String gender,
                             @RequestParam("year") String year,
                             @RequestParam("month") String month,
                             @RequestParam("day") String day,
                             Model model) {
    	
    	  
        String birthdateString = year + "-" + month + "-" + day;
        LocalDate birthdate = null;

        try {
            DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            birthdate = LocalDate.parse(birthdateString, dateTimeFormatter);
            
            UserDTO dto = new UserDTO();
            dto.setId(id); 
            dto.setPwd(pwd); // 암호화된 비밀번호 저장
            dto.setName(name);
            dto.setMail(mail);
            dto.setNumber(number);
            dto.setStreet_address(streetAddress);
            dto.setDetail_address(detailAddress);
            dto.setGender(gender);
            dto.setBirthDate(year, month, day);
            
            userService.registUser(dto);
            model.addAttribute("dto", dto);
           
        } catch (DateTimeParseException e) {

            e.printStackTrace();
            
        } catch (Exception e) {

            e.printStackTrace();
            
        }

        return "view"; 
    }
    

  
    
}
