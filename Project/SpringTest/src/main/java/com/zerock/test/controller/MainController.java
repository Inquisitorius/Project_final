package com.zerock.test.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.zerock.test.dto.UserDTO;
import com.zerock.test.service.SendMailService;
import com.zerock.test.service.UserService;



@Controller
@MapperScan("com.zerock.test.mapper")
public class MainController {



    @Autowired
    private UserService userService;
    
    @Autowired
    private SendMailService sendMailService;
 
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
    
   
    @ResponseBody
    @PostMapping("/findId")
    public Map<String, Object> findUserId(@RequestParam String email, @RequestParam String number)  {
    	UserDTO dto = userService.findUser(email, number);
    	
    	Map<String, Object> response = new HashMap<>();
    	if(dto.getId() != null) {
    		response.put("id", dto.getId());
    	}else {
    		response.put("id", "");
    	}
		return response;
    }
    
    @ResponseBody
    @PostMapping("/findPwd")
    public Map<String, Object> findUserPwd(@RequestParam String id){
    	String email = userService.findPwd(id);
    	
    	Map<String, Object> response = new HashMap<>();
    	if(email != null) {
    		
    		response.put("email", email);
    		response.put("status", "success");
    	}else {
    		response.put("email", "");
    		response.put("status", "fail");
    	}
    	return response;
    }
    
    @PostMapping("/updatePwd")
    public String updatePwd(@RequestBody UserDTO dto) {
    	try {
    		sendMailService.UpdatePassword(dto);
    		return "비밀번호 성공";
    	}catch (Exception e) {
			// TODO: handle exception
    		return "asdds";
		}
    }
    
}
