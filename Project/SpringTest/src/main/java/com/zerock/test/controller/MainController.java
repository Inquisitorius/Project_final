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
    public String handleJoin(@RequestParam String id, 
                             @RequestParam String pwd,
                             @RequestParam String name,
                             @RequestParam String mail,
                             @RequestParam String number,
                             @RequestParam String roadAddress,
                             @RequestParam String detailAddress,
                             @RequestParam String gender,
                             @RequestParam String year,
                             @RequestParam String month,
                             @RequestParam String day,
                             @RequestParam String expJibunAddr,
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
            dto.setStreet_address(roadAddress);
            dto.setDetail_address(detailAddress);
            dto.setExpJibunAddr(expJibunAddr);
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
    
    
    @GetMapping("/mypage")
    public String MyPage() {
    	return "MyPage";
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
    
    @ResponseBody
    @PostMapping("/updatePwd")
    public Map<String, Object> updatePwdByEmail(@RequestParam String email) {
        Map<String, Object> response = new HashMap<>();
        try {
            sendMailService.UpdatePassword(email);
            response.put("status", "success");
            response.put("message", "임시 비밀번호가 이메일로 전송되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            response.put("status", "fail");
            response.put("message", "비밀번호 변경에 실패했습니다.");
        }
        return response;
    }
    
    @PostMapping("/idexits")
    @ResponseBody
    public int idExits(@RequestParam String id) {
    	return userService.existById(id);
    }
    
    @PostMapping("/mailexits")
    @ResponseBody
    public int emailExits(@RequestParam String email) {
    	return userService.existByemail(email);
    }
    
    @PostMapping("/reset-password")
    @ResponseBody
    public int ResetPassWord(@RequestParam String id) {
    	Integer result = userService.findResetUser(id);

        if (result == null) {
            // 특정 값(예: -1)을 반환하여 클라이언트에서 이를 처리할 수 있게 합니다.
            return -1; // -1은 존재하지 않는 ID를 나타내는 값으로 사용할 수 있습니다.
        }

        return result;
    }
    
    @PostMapping("/changePwd")
    @ResponseBody
    public Map<String, Object> ChangePwd(@RequestParam String id, @RequestParam String pwd){
    	Map<String, Object> response = new HashMap<>();
    	try {
    		userService.ChangePassWord(id, pwd);
    		response.put("status", "success");
    		
    	}catch (Exception e) {
			// TODO: handle exception
    		e.printStackTrace();
    		 response.put("status", "error");
    	    
		}
    	return response;
    }
    
    
}
