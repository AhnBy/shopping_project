package com.shopping.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shopping.entity.Member;
import com.shopping.entity.Product;
import com.shopping.entity.ProductPaging;
import com.shopping.service.MemberService;
import com.shopping.service.ProductService;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ProductService productService;
	
	@GetMapping("main")
	public String main(String userid, Model model) {
		Member result = memberService.readById(userid);
		model.addAttribute("result", result);
		
		List<Product> list = productService.selectPic();
		model.addAttribute("productList", list);
		return "/admin/main";
	}

	@GetMapping("memberList")
	public String memberList(String userid, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		List<Member> list = memberService.selectAll();
		model.addAttribute("list", list);
		return "/admin/memberList";
	}
	
	
	
	@GetMapping("productList")
	public String listForm(ProductPaging pp, String nowPage, String cntPerPage, String productDist, String userid, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		
		Product product = new Product();
		product.setProductDist(productDist);
		
		int total = productService.countProduct();
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		}else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		pp = new ProductPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pp);
		model.addAttribute("productList", productService.productPaging(pp));
		
		return "/admin/productList";
	}
	
	@GetMapping("read")
	public String productRead(String userid, String productId, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		
		Product list = productService.read(productId);
		model.addAttribute("productInfo", list);
		return "/product/read";
	}
}










