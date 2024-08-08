package com.zerock.test.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.regex.Pattern;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.zerock.test.dto.AdminTestDTO;
import com.zerock.test.dto.ServerInfoDTO;
import com.zerock.test.service.AdminService;

@Controller
@MapperScan("com.zerock.test.mapper")
public class AdminController {
	
	private final AdminService service;	
	
	@Autowired
    private ResourceLoader resourceLoader;
	
	public AdminController(AdminService service)
	{
		this.service = service;
	}
	
	@GetMapping("/index")
	public String index(Model model)
	{		
		return "admin/index";
	}
	
	@GetMapping("/adminTest")
	public String adminHome(Model model)
	{
		//List<AdminTestDTO> list = this.service.getAllTables();
		//System.out.println("adminHome Test list cnt : " + list.size());
		
		//model.addAttribute("list",list);
		
		System.out.println("Admin function Enter");
		Update_ServerLog();
		return "admin/adminHome";
	}
	
	@Scheduled(cron = "59 */1 * * * *")
	public void cron_serverLogFunc()
	{
		Update_ServerLog();
	}
	
	public void Update_ServerLog()
	{
		String path = "./src/main/resources/static/logFile/vmstat.log";
		List<String[]> fileValues = getDataFromTargetFile(path);
		
		List<ServerInfoDTO> dtoList = new ArrayList<ServerInfoDTO>();
		//19
		for (String[] strings : fileValues) 
		{
			ServerInfoDTO temp = new ServerInfoDTO(strings[0], strings[1],
					Integer.parseInt(strings[2]),
					Integer.parseInt(strings[3]),   
					Integer.parseInt(strings[4]),   
					Integer.parseInt(strings[5]),   
					Integer.parseInt(strings[6]),   
					Integer.parseInt(strings[7]),   
					Integer.parseInt(strings[8]),   
					Integer.parseInt(strings[9]),   
					Integer.parseInt(strings[10]),   
					Integer.parseInt(strings[11]),   
					Integer.parseInt(strings[12]),   
					Integer.parseInt(strings[13]),   
					Integer.parseInt(strings[14]),   
					Integer.parseInt(strings[15]),   
					Integer.parseInt(strings[16]),   
					Integer.parseInt(strings[17]),   
					Integer.parseInt(strings[18])				
					);		
			
			dtoList.add(temp);		
		}
		
		//server 연결		
		this.service.ServerLogUpdate(dtoList);
		
	}
	
	public List<String[]> getDataFromTargetFile(String filePath)
	{
		Resource resource = resourceLoader.getResource("classpath:static/logFile/vmstat.log");
		
		//File f = new File(filePath);
		File f = null;
		
		try {
			f = resource.getFile();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<String[]> fileValues = new ArrayList<>();
		
		if(f.isFile())
		{
			System.out.println("is file..." + f.getName());
			
			try(BufferedReader br = Files.newBufferedReader(Paths.get(f.getAbsolutePath()),
					Charset.forName("UTF-8")))
			{
				String line = "";
				 
				while ((line = br.readLine()) != null) 
				{
					if (Pattern.compile("[0-9:\\-\s]+").matcher(line).matches()) 
					{
						fileValues.add(line.trim().split("\s+"));
					} 
					
					System.out.println(fileValues.size());
				}			
			} catch (IOException  e) 
			{
				// TODO: handle exception
			}
			
		}
		else
		{
			System.out.println("not file..." + f.getAbsolutePath());
		}
		
		return fileValues;
	}
	
	
}
