package com.shopping.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.shopping.entity.Member;
import com.shopping.entity.Product;
import com.shopping.service.MemberService;
import com.shopping.service.ProductService;


@Controller
public class TestController {
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ProductService productService;
	
	@GetMapping("main")
	public String indexView(String userid, Model model) {
		Member result = memberService.readById(userid);
		model.addAttribute("result", result);
		
		List<Product> list = productService.selectPic();
		model.addAttribute("productList", list);
		return "/main";
	}
	
	
}
