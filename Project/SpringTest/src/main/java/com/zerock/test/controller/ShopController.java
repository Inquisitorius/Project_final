package com.zerock.test.controller;


import java.util.HashMap;
import java.util.Map;



import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.zerock.test.dto.CustomUserDetails;
import com.zerock.test.dto.ShopDTO;
import com.zerock.test.service.ShopService;



@Controller
@MapperScan("com.zerock.test.mapper")
public class ShopController {
	
	@Autowired ShopService service;
	
	@ModelAttribute("userid")
    public String getUserID() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && auth.isAuthenticated() && auth.getPrincipal() instanceof CustomUserDetails) {
            CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
            return userDetails.getUserDTO().getId();
        } else {
            return null;
        }
    }

    @GetMapping("/shop")
    public String mypage(@ModelAttribute("userid") String userid, @RequestParam(required = false) String otherUserid ) {
    	
    	String targetUserId = (otherUserid != null) ? otherUserid : userid;

    	if (targetUserId != null) {
            Integer shopId = service.findNum(targetUserId);
            if (shopId != null) {
                return "redirect:/shop/" + shopId;
            }
        }
    	
        return "redirect:/hello";
    }
    
    
	@GetMapping("/shop/{shop_id}")
	public ModelAndView myPageByShopId(@PathVariable Integer shop_id) {
	   
	    ShopDTO dto = service.viewShop(shop_id); 

	    if (dto != null) {
	       
	        ModelAndView mav = new ModelAndView("shop"); 
	        mav.addObject("shopId", dto.getShop_id());
	        mav.addObject("shopName", dto.getShop_name());
	        mav.addObject("shopOwner", dto.getShop_owner());
	        mav.addObject("shopImg", dto.getShop_img());
	        mav.addObject("shopStar", dto.getShop_star());
	        mav.addObject("shopInfo", dto.getShop_info());
	      
	        return mav;
	    }

	   
	    return new ModelAndView("view");
	}
	
	@PostMapping("/update-name")
	public String updateShopName(@RequestParam("shop_name") String shop_name, @RequestParam("shop_id") Integer shop_id, @RequestParam("shop_owner") String userid) {
	
	    Map<String, Object> params = new HashMap<>();
	    params.put("shop_name", shop_name);
	    params.put("shop_id", shop_id);
	    params.put("shop_owner", userid);
		
		boolean success = service.updateShopName(params);
		
		if(success) {
			return "redirect:/shop/" + shop_id;
		}else {
			System.out.println(shop_name);
			System.out.println(shop_id);
			System.out.println(userid);
			return "error";
		}
	}
	
	@PostMapping("/update-info")
	public String updateShopInfo(@RequestParam("shop_id") Integer shop_id, @RequestParam("shop_info") String shop_info) {
		
		
		Map<String, Object> params = new HashMap<>();
		params.put("shop_id", shop_id);
		params.put("shop_info", shop_info);
		
		boolean success = service.updateShopInfo(params);
		
		if(success) {
			return "redirect:/shop/" + shop_id;
		}else {
			System.out.println(shop_info);
			System.out.println(shop_id);
			return "error";
		}
	}
	
}

