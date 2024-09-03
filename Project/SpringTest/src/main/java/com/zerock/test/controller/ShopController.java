package com.zerock.test.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.zerock.test.dto.CustomUserDetails;
import com.zerock.test.dto.ProductDTO;
import com.zerock.test.dto.ReviewDTO;
import com.zerock.test.dto.ShopDTO;
import com.zerock.test.service.ProductService;
import com.zerock.test.service.ReviewsService;
import com.zerock.test.service.ShopService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ShopController {

	@Autowired
	ShopService service;

	@Autowired
	ProductService productService;

	@Autowired
	ReviewsService reviewsService;

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
	public String mypage(@ModelAttribute("userid") String userid, @RequestParam(required = false) String otherUserid) {

		String targetUserId = (otherUserid != null) ? otherUserid : userid;

		if (targetUserId != null) {
			Integer shopId = service.findNum(targetUserId);
			if (shopId != null) {
				return "redirect:/shop/" + shopId + "/products";
			}
		}

		return "redirect:/hello";
	}

	@GetMapping("/shop/{shop_id}")
	public String myPage(@PathVariable Integer shop_id) {
		return "redirect:/shop/" + shop_id + "/products";
	}

	@GetMapping("/shop/{shop_id}/{type}")
	@ResponseBody
	public ModelAndView myPageByShopId(@PathVariable Integer shop_id, @PathVariable String type,
			@RequestParam(value = "sort", required = false) String sort,
			@RequestParam(value = "size", required = false, defaultValue = "30") int size,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "load", required = false) String btn) {

		ShopDTO dto = service.viewShop(shop_id);
		Double shopRating = reviewsService.ShopRating(shop_id);

		if (shopRating == null) {
			shopRating = 0.0;
		}
		ModelAndView mav = new ModelAndView("shop"); // 기본 뷰는 'shop'
		if (dto != null) {
			mav.addObject("shopId", dto.getShop_id());
			mav.addObject("shopName", dto.getShop_name());
			mav.addObject("shopOwner", dto.getShop_owner());
			mav.addObject("shopImg", dto.getShop_img());
			mav.addObject("shopStar", dto.getShop_star());
			mav.addObject("shopInfo", dto.getShop_info());
			mav.addObject("rating", shopRating);
			mav.addObject("type", type);
			mav.addObject("status", status);
		} else {
			return new ModelAndView("view"); // ShopDTO가 null인 경우 오류 페이지로 리다이렉트
		}

		if (type.equals("products")) {
			// 조건에 따라 모델을 설정하고 뷰를 반환합니다.
			List<ProductDTO> pdto = null;
			pdto = productService.selectProduct(shop_id, size);
			int cnt = productService.countProductsByShopId(shop_id);

			if (sort != null && status == null) {
				switch (sort) {

				case "price-asc":
					mav.setViewName("shop_products");
					pdto = productService.selectLowPrice(shop_id, size);
					cnt = productService.countProductsByShopId(shop_id);

					break;
				case "price-desc":
					mav.setViewName("shop_products");
					pdto = productService.selectHighPrice(shop_id, size);
					cnt = productService.countProductsByShopId(shop_id);
					System.out.println("desc 호출");
					break;
				case "newest":
					mav.setViewName("shop_products");
					pdto = productService.selectNewst(shop_id, size);
					cnt = productService.countProductsByShopId(shop_id);
					break;
				case "popularity":
					mav.setViewName("shop_products");
					pdto = productService.selectpopularity(shop_id, size);
					cnt = productService.countProductsByShopId(shop_id);
					break;
				}

			}

			if (sort == null && status != null) {

				switch (status) {
				case "all":
					mav.setViewName("shop_products");
					System.out.println("all 호출");
					pdto = productService.selectProduct(shop_id, size);
					cnt = productService.countProductsByShopId(shop_id);
					break;
				case "for-sale":
					mav.setViewName("shop_products");
					pdto = productService.statusProducts(shop_id, size, status);
					cnt = productService.saleCnt(shop_id);
					break;
				case "in-progress":
					mav.setViewName("shop_products");
					pdto = productService.statusProducts(shop_id, size, status);
					cnt = productService.progressCnt(shop_id);

					break;
				case "completed":
					mav.setViewName("shop_products");
					pdto = productService.statusProducts(shop_id, size, status);
					cnt = productService.completedcnt(shop_id);
					break;
				}
			}
			if (sort != null && status != null) {
				mav.setViewName("shop_products");

				if ("price-asc".equals(sort)) {
					pdto = productService.selectAllPriceAsc(shop_id, size);
					cnt = productService.countProductsByShopId(shop_id);
					if ("all".equals(status)) {
						pdto = productService.selectAllPriceAsc(shop_id, size);
						cnt = productService.countProductsByShopId(shop_id);
					} else if ("completed".equals(status)) {
						pdto = productService.selectCompletedPriceAsc(shop_id, size);
						cnt = productService.completedcnt(shop_id);
					} else if ("for-sale".equals(status)) {
						pdto = productService.selectSalePriceAsc(shop_id, size);
						cnt = productService.saleCnt(shop_id);
					} else if ("in-progress".equals(status)) {
						pdto = productService.selectProgressPriceAsc(shop_id, size);
						cnt = productService.progressCnt(shop_id);
					}
				}
				if ("price-desc".equals(sort)) {
					pdto = productService.selectdescAllProducts(shop_id, size);
					cnt = productService.countProductsByShopId(shop_id);
					if ("all".equals(status)) {
						pdto = productService.selectdescAllProducts(shop_id, size);
						cnt = productService.countProductsByShopId(shop_id);
					} else if ("completed".equals(status)) {
						pdto = productService.selectdescProducts(shop_id, size, status);
						cnt = productService.sortCnt(shop_id, status);
					} else if ("for-sale".equals(status)) {
						pdto = productService.selectdescProducts(shop_id, size, status);
						cnt = productService.sortCnt(shop_id, status);
					} else if ("in-progress".equals(status)) {
						pdto = productService.selectdescProducts(shop_id, size, status);
						cnt = productService.sortCnt(shop_id, status);
					}
				}

				if ("newest".equals(sort)) {
					pdto = productService.selectNewst(shop_id, size);
					cnt = productService.countProductsByShopId(shop_id);
					if ("all".equals(status)) {
						pdto = productService.selectNewst(shop_id, size);
						cnt = productService.countProductsByShopId(shop_id);
					} else if ("completed".equals(status)) {
						pdto = productService.selectnewestProducts(shop_id, size, status);
						cnt = productService.sortCnt(shop_id, status);
					} else if ("for-sale".equals(status)) {
						pdto = productService.selectnewestProducts(shop_id, size, status);
						cnt = productService.sortCnt(shop_id, status);
					} else if ("in-progress".equals(status)) {
						pdto = productService.selectnewestProducts(shop_id, size, status);
						cnt = productService.sortCnt(shop_id, status);
					}
				}

				if ("popularity".equals(sort)) {
					pdto = productService.selectpopularity(shop_id, size);
					cnt = productService.countProductsByShopId(shop_id);
					if ("all".equals(status)) {
						pdto = productService.selectpopularity(shop_id, size);
						cnt = productService.countProductsByShopId(shop_id);
					} else if ("completed".equals(status)) {
						pdto = productService.selectpopularityProducts(shop_id, size, status);
						cnt = productService.sortCnt(shop_id, status);
					} else if ("for-sale".equals(status)) {
						pdto = productService.selectpopularityProducts(shop_id, size, status);
						cnt = productService.sortCnt(shop_id, status);
					} else if ("in-progress".equals(status)) {
						pdto = productService.selectpopularityProducts(shop_id, size, status);
						cnt = productService.sortCnt(shop_id, status);
					}
				}

			}

			mav.addObject("products", pdto);
			mav.addObject("cnt", cnt); // 상품 수
			mav.addObject("size", size);

		}
		if (type.equals("reviews")) {
			if (size == 0 || btn == null) {
				size = 5;
			}

			List<ReviewDTO> Rdto = null;
			int Rcnt = reviewsService.ReviewsCnt(shop_id);
			Rdto = reviewsService.selectReview(shop_id, size);
			for (int i = 0; i < Rdto.size(); i++) {
				ReviewDTO review = Rdto.get(i);
				Integer otherShopId = review.getOther_shopid();

				String ShopImg1 = reviewsService.getImg(otherShopId);

				mav.addObject("shopImg1_" + i, ShopImg1);
			}

			if (btn != null && "load".equals(btn)) {
				mav.setViewName("shop_reviews");
				System.out.println("size : " + size);
				for (int i = 0; i < Rdto.size(); i++) {
					ReviewDTO review = Rdto.get(i);
					Integer otherShopId = review.getOther_shopid();
					System.out.println(otherShopId);
					String ShopImg1 = reviewsService.getImg(otherShopId);
					System.out.println(ShopImg1);
					mav.addObject("shopImg1_" + i, ShopImg1);
				}
				Rcnt = reviewsService.ReviewsCnt(shop_id);
				Rdto = reviewsService.selectReview(shop_id, size);
			}

			mav.addObject("cnt", Rcnt);
			mav.addObject("reviews", Rdto);
			mav.addObject("size", size);
		}

		return mav;
	}

	@PostMapping("/insert-comment")
	public String insertComment(@ModelAttribute("userid") String userid, @RequestParam("shop_id") Integer shop_id,
			@RequestParam("rating") double rating, @RequestParam("content") String content, Integer other_shopid,
			String other_shopImg) {

		ReviewDTO review = new ReviewDTO();
		review.setId(userid);
		review.setShopId(shop_id);
		review.setRating(rating);
		review.setContent(content);
		review.setReviewDate(new Date());
		other_shopid = service.findNum(userid);
		other_shopImg = reviewsService.getImg(other_shopid);
		System.out.println(other_shopImg);
		review.setOther_shopid(other_shopid);
		

		reviewsService.insertReview(review);

		return "redirect:/shop/" + shop_id + "/reviews";
	}
	
	@PostMapping("/edit-comment")
	public String EditComment(@RequestParam("shop_id") Integer shop_id, @RequestParam("idx") int idx, @RequestParam("content") String content, @RequestParam("editrating") double rating) {
		ReviewDTO review = new ReviewDTO();
		
		review.setIdx(idx);
		review.setContent(content);
		review.setRating(rating);
		
		reviewsService.UpdateReview(review);
		return "redirect:/shop/" + shop_id + "/reviews";
	}
	
	@PostMapping("/del-comment")
	public String DelComment(@RequestParam("idx") int idx, @RequestParam("shop_id") Integer shop_id) {
		reviewsService.deleteReview(idx);
		return "redirect:/shop/" + shop_id + "/reviews";
	}

	@PostMapping("/update-name")
	public String updateShopName(@RequestParam("shop_name") String shop_name, @RequestParam("shop_id") Integer shop_id,
			@RequestParam("shop_owner") String userid) {

		Map<String, Object> params = new HashMap<>();
		params.put("shop_name", shop_name);
		params.put("shop_id", shop_id);
		params.put("shop_owner", userid);

		boolean success = service.updateShopName(params);

		if (success) {
			return "redirect:/shop/" + shop_id;
		} else {
			System.out.println(shop_name);
			System.out.println(shop_id);
			System.out.println(userid);
			return "error";
		}
	}

	@PostMapping("/update-info")
	public String updateShopInfo(@RequestParam("shop_id") Integer shop_id,
			@RequestParam("shop_info") String shop_info) {

		Map<String, Object> params = new HashMap<>();
		params.put("shop_id", shop_id);
		params.put("shop_info", shop_info);

		boolean success = service.updateShopInfo(params);

		if (success) {
			return "redirect:/shop/" + shop_id;
		} else {
			System.out.println(shop_info);
			System.out.println(shop_id);
			return "error";
		}
	}

	@PostMapping("/file-spring")
	@ResponseBody
	public String file_spring(@RequestParam Integer shop_id, @RequestParam MultipartFile file) {
		String fileName = file.getOriginalFilename();
		String fileDir = "/home/ubuntu/tomcat/apache-tomcat-10.0.27/webapps/ROOT/WEB-INF/classes/static/img/profile/";
		String relativePath = "/profile/" + fileName;
		// home/ubuntu/tomcat/apache-tomcat-10.0.27/webapps/ROOT/WEB-INF/classes/static/img#

		// Path directoryPath = Paths.get("src", "main", "resources","static", "img",
		// "upload");

		try {
			file.transferTo(new File(fileDir + file.getOriginalFilename()));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Map<String, Object> params = new HashMap<>();
		params.put("shop_id", shop_id);
		params.put("shop_img", relativePath);

		service.updateShopImg(params);

		return "redirect:/shop/" + shop_id;
	}

}
