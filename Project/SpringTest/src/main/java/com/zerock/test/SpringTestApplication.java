package com.zerock.test;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
@MapperScan("com.zerock.test.mapper")
public class SpringTestApplication extends SpringBootServletInitializer  {
	
	@Override
	   protected SpringApplicationBuilder configure(SpringApplicationBuilder application)
	   {
	      return application.sources(SpringTestApplication.class);
	   }
	
	
	public static void main(String[] args) {
		
		
		SpringApplication.run(SpringTestApplication.class, args);
		
		
	}

}
