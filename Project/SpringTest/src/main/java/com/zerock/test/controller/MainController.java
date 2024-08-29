package com.zerock.test.controller;


import java.time.format.DateTimeParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zerock.test.dto.CustomUserDetails;
import com.zerock.test.dto.ProductDTO;
import com.zerock.test.dto.ShopDTO;
import com.zerock.test.dto.UserDTO;
import com.zerock.test.service.ProductService;
import com.zerock.test.service.SendMailService;

import com.zerock.test.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



@Controller
public class MainController {



    @Autowired
    private UserService userService;
    
    @Autowired
    private SendMailService sendMailService;
    
    @Autowired
    ProductService productService;
    

    @GetMapping("/hello")
    public ModelAndView hello() {
    	
        ModelAndView mav = new ModelAndView("view");
        int cnt = productService.AllProductsCnt();
        mav.addObject("cnt", cnt);
        return mav;
    }

    
    @ModelAttribute("userid")
    public String getUserID() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if(auth != null && auth.isAuthenticated() && auth.getPrincipal() instanceof CustomUserDetails) {
        	CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
            return userDetails.getUserDTO().getId();  
        }else {
        	return null;
        }
//        return (auth != null && auth.isAuthenticated()) ? auth.getName() : null;
    }
    
    @GetMapping("/login")
    public String Login(HttpSession session) {
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	
    	if(authentication != null && authentication.isAuthenticated() && authentication.getPrincipal() instanceof UserDetails) {
    		session.removeAttribute("recentlyViewed");
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
                             @RequestParam String email,
                             @RequestParam String phone,
                             @RequestParam String roadAddress,
                             @RequestParam String detailAddress,
                             @RequestParam String gender,
                             @RequestParam String year,
                             @RequestParam String month,
                             @RequestParam String day,
                             @RequestParam String expJibunAddr,
                             Model model) {
    	
    	  
       
        try {
            
            ShopDTO shop_dto = new ShopDTO();
            shop_dto.setShop_owner(id);
            
            UserDTO dto = new UserDTO();
            dto.setId(id); 
            dto.setPwd(pwd); // 암호화된 비밀번호 저장
            dto.setName(name);
            dto.setEmail(email);
            dto.setPhone(phone);
            dto.setStreet_address(roadAddress);
            dto.setDetail_address(detailAddress);
            dto.setExpJibunAddr(expJibunAddr);
            dto.setGender(gender);
            dto.setBirthDate(year, month, day);
            
            userService.registUser(dto, shop_dto);
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
    	
    	return userService.findResetUser(id);
    	
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
    
    @GetMapping("/useredit")
    public String UserEdit(Model model, @ModelAttribute("userid") String id) {
    	
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        
        if (authentication == null || !authentication.isAuthenticated()) {
            return "redirect:/login"; // 로그인 페이지로 리다이렉트
        }
    	
	 	UserDTO dto = userService.GetUserInfo(id);
	 	if(dto != null) {
	 	model.addAttribute("user", dto);
	 	return "UserEdit";
	 	}else {
	 		return "/hello";
	 	}
	 	
    }
    
    @PostMapping("/useredit")
    public String handleEdit(
    						 @RequestParam String id,
    						 @RequestParam String name,
    						 @RequestParam String pwd,	
    						 @RequestParam String phone,
    						 @RequestParam String roadAddress,
    						 @RequestParam String detailAddress,
    						 @RequestParam String expJibunAddr,
    						 @RequestParam String gender,
    						 @RequestParam String year,
    						 @RequestParam String month,
    						 @RequestParam String day) {
    	
        try {
        	
           
            UserDTO dto = new UserDTO();
            dto.setId(id);
            dto.setName(name);
            dto.setPwd(pwd);
            dto.setPhone(phone);
            dto.setStreet_address(roadAddress);
            dto.setDetail_address(detailAddress);
            dto.setExpJibunAddr(expJibunAddr);
            dto.setGender(gender);
            dto.setBirthDate(year, month, day);
            
            userService.UpdateUser(dto);
        }
        catch (Exception e) {
			// TODO: handle exception
        	e.printStackTrace();
		}
        return "redirect:/logout";				
    }
    
    
}
