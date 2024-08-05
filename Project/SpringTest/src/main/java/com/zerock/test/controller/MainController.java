package com.zerock.test.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zerock.test.dto.TestDTO;
import com.zerock.test.dto.UserDTO;
import com.zerock.test.service.TestService;
import com.zerock.test.service.UserService;

@Controller
@MapperScan("com.zerock.test.mapper")
public class MainController {

    private final TestService testService;

    @Autowired
    private UserService userService;

    public MainController(TestService testService) {
        this.testService = testService;
      
    }
    
    @GetMapping("/main")
    public String main() {
    		return "main";
    	}
    
    
    @GetMapping("/hello")
    public String hello() {
        return "view";
    }

    @GetMapping("/list")
    public String list(Model model) {
        List<TestDTO> allList = testService.getAllTables();
        model.addAttribute("allList", allList);
        return "list";
    }
    
    
    @GetMapping("/login")
    public String Login() {
    	return "LoginPage";
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
            dto.setPwd(pwd);
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
            
            model.addAttribute("error", "생년월일 형식이 잘못되었습니다.");
            e.printStackTrace();
            
        } catch (Exception e) {
           
            model.addAttribute("error", "가입 처리 중 오류가 발생했습니다.");
            e.printStackTrace();
            
        }

        return "view"; 
    }
}
