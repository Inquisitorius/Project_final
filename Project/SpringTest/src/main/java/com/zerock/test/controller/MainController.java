package com.zerock.test.controller;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.zerock.test.dto.TestDTO;
import com.zerock.test.service.TestService;

@Controller
@MapperScan("com.zerock.test.mapper")
public class MainController {

    private final TestService testService;


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

}
