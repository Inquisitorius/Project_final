package com.zerock.test.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zerock.test.dto.AdminTestDTO;
import com.zerock.test.dto.ServerInfoDTO;
import com.zerock.test.dto.UserDTO;
import com.zerock.test.service.AdminService;

@Controller
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
	public String adminTest()
	{
		return "admin/adminTestPage";
	}
	
	@GetMapping("/adminResult")
	public String adminResult()
	{
		return "admin/adminTestPage2";
	}
	
	@PostMapping("/getImgNameList")
	@ResponseBody
	public List<String> getImgNameList()
	{
		
		System.out.println("contorller");
		
		
		List<String> aa = this.service.getImgNameList();
		for(int i = 0; i < aa.size(); ++i)
			System.out.println(aa.get(i));
		
		return aa;
	}
	
	
	@PostMapping("/userManagementDetail")
	public String userManagementDetail_go(@ModelAttribute UserDTO dto, 
			Model model)
	{
		
		System.out.println("bth: " + dto.getBrithString());
		System.out.println("street: " + dto.getStreet_address());
		
		model.addAttribute("id", dto.getId());
		
		model.addAttribute("email", dto.getEmail());
		model.addAttribute("birthDate", dto.getBrithString() );
		model.addAttribute("expJibunAddr", dto.getExpJibunAddr());
		model.addAttribute("street_address", dto.getStreet_address());
		model.addAttribute("detail_address", dto.getDetail_address());
		model.addAttribute("gender", dto.getGender());
		model.addAttribute("name", dto.getName());
		
		model.addAttribute("is_admin", dto.isIs_admin());
		model.addAttribute("password_reset", dto.getPassword_reset());
		
		return "admin/userManagement_Detail";
	}
	
	@PostMapping("/file-spring_12")
	@ResponseBody
	public int file_spring(@RequestParam MultipartFile[] files)
	{
		
		String fileDir = "/home/ubuntu/tomcat/apache-tomcat-10.0.27/webapps/ROOT/WEB-INF/classes/static/img/upload/";
		String fileDir_local = "/img/upload/";
		//home/ubuntu/tomcat/apache-tomcat-10.0.27/webapps/ROOT/WEB-INF/classes/static/img# 
		  
		  //Path directoryPath = Paths.get("src", "main", "resources","static", "img", "upload");
		 
		
		for (MultipartFile file : files)
		{
			//쉽게 하기 위해 비효율적인 방법을 채택
	        int cnt = this.service.get_imgseqCurr();
	        
			String originalFileName = file.getOriginalFilename();	
			
			String filePath = fileDir + cnt + "_" + originalFileName;			
			String db_filePath = fileDir_local + cnt + "_" + originalFileName;
			
			System.out.println(db_filePath);
            try
            {
            	//server 에 사진 파일 저장
            	file.transferTo(new File(filePath));
            	
            	this.service.saveImgName(db_filePath);
            	
	   	    } catch (IllegalStateException e) {
	   	         // TODO Auto-generated catch block
	   	         e.printStackTrace();
	   	      } catch (IOException e) {
	   	         // TODO Auto-generated catch block
	   	         e.printStackTrace();
	   	      }	
		}
		
		
		
		//1. 사진이름 명명규칙 필요
		//2. db 에 해당 사진의 이름 저장
		//3. 저장된 db 이름을 통해 해당 게시물의 사진 가져오기
		
		// 2-1 프로덕트 db 에 해당 사진 이름이 올라가야한다.
		
		
		// 현재 필요한 기술 
		//- 멀티 사진 업로드 작동 여부
		//- db에 올릴 이름 명명 user_id+시퀸스 느낌으로 작성하면 될듯
		//- 테스트는 db 에 올라가는지
		//- 마지막으로 해당 부분 로드 되는지 확인되면 일단 모듈 테스트 끝
		    
		return 0;
	}

	@PostMapping("/getServerInfo")
	@ResponseBody
	public List<ServerInfoDTO> Get_ServerInfo(@RequestParam("date") String date, 
								@RequestParam("time") String time,
								@RequestParam("cnt") int cnt
								)
	{
		
		List<ServerInfoDTO> list =  this.service.Get_ServerInfo(cnt);
		List<ServerInfoDTO> result = new ArrayList<ServerInfoDTO>();
		
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		for(int i  = 0; i < cnt; ++i)
		{
			Date nowDate = new Date();
			
			 Calendar cal = Calendar.getInstance();
			 cal.setTime(nowDate);
			 cal.add(Calendar.MINUTE, -(i+1));
			 nowDate = cal.getTime();
			 boolean roofResult = false;
			 
			 for(int j = 0; j < list.size(); ++j)
			 {
				 ServerInfoDTO dto = list.get(j);
				 String dateTimeString = dto.getServer_date() + " " + dto.getServer_time();
				 Date dateFromString = new Date();
				 
				 try 
			     {
					dateFromString = dateFormat.parse(dateTimeString);		
					String nowString = dateFormat.format(nowDate);
					nowDate = dateFormat.parse(nowString);
			     } 
			     catch (ParseException e) 
			     {
					// TODO Auto-generated catch block
					e.printStackTrace();
			     }
				 
				 if(nowDate.equals(dateFromString))
				 {
					 dto.setHitDate(true);					 
					 result.add(dto);
					 
					 roofResult = true;					 
					 break;
				 }
			 }	
			 
			 if(roofResult == false)
			 {//해당 시간의 로그가 없다면
				 ServerInfoDTO temp = new ServerInfoDTO();
				 result.add(temp);
			 }
		}
		
		return result;
	}
	
	@GetMapping("/adminHome")
	public String adminHome(Model model)
	{
		System.out.println("Admin function Enter");
		
		return "admin/adminHome";
	}
	
	@GetMapping("/userManagementPage")
	public String userManagementPage(Model model)
	{
		return "admin/userManagementPage";
	}
	
	@ResponseBody
	@GetMapping("/admin_GetUserList")
	public List<UserDTO> GetUserList(Model model)
	{
		List<UserDTO> list = this.service.GetUserList();	
		
		return list;
	}	
	
	@ResponseBody
	@PostMapping("/DeleteUserInfo_Admin")
	public int DeleteUserInfo_Admin(@ModelAttribute UserDTO dto)
	{
		return this.service.DeleteUserInfo_Admin(dto);
	}
	
	@ResponseBody
	@PostMapping("/UpdateUserInfo_Admin")
	public int UpdateUserInfo_Admin(@ModelAttribute UserDTO dto)
	{
		return this.service.UpdateUserInfo_Admin(dto);
	}
	
	@Scheduled(cron = "59 */1 * * * *")
	public void cron_serverLogFunc()
	{
		System.out.println("cron unable state...");
		//Update_ServerLog();
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
					
					//System.out.println(fileValues.size());
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
