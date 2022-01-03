package com.shopping.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shopping.entity.Member;
import com.shopping.entity.Product;
import com.shopping.entity.ProductPaging;
import com.shopping.service.MemberService;
import com.shopping.service.ProductPagingService;
import com.shopping.service.ProductService;

@Controller
public class ProductPagingController {
	
	@Autowired
	ProductPagingService productPagingService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ProductService productService;
	
	@GetMapping("/admin/productList")
	public String productForm(ProductPaging pp,@RequestParam(value="nowPage", required=false)String nowPage,@RequestParam(value="cntPerPage", required=false)String cntPerPage, String productDist, String userid, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		
		Product product = new Product();
		product.setProductDist(productDist);
		
		int total = productPagingService.countProduct();
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		}else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		pp = new ProductPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<Product> productList = productPagingService.adminProductPaging(pp);
		model.addAttribute("paging", pp);
		model.addAttribute("productList", productList);
		
		return "/admin/productList";
	}
	
	@PostMapping("/admin/productList")
	public String searchForm(ProductPaging pp,@RequestParam(value="nowPage", required=false)String nowPage,@RequestParam(value="cntPerPage", required=false)String cntPerPage, String keyword, String searchOption, String productDist, String userid, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		
		Product product = new Product();
		product.setProductDist(productDist);
		
		int total = productPagingService.countArticle(keyword, searchOption);
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		}else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		pp = new ProductPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), keyword, searchOption);
		List<Product> productList = productPagingService.listAll(pp);
		model.addAttribute("paging", pp);
		model.addAttribute("productList", productList);
		model.addAttribute("searchOption",searchOption);
		model.addAttribute("keyword",keyword);
		
		return "/admin/productList";
	}
	
	@GetMapping("/product/list")
	public String listForm(ProductPaging pp,@RequestParam(value="nowPage", required=false)String nowPage,@RequestParam(value="cntPerPage", required=false)String cntPerPage, String productDist, String userid, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		
		Product product = new Product();
		product.setProductDist(productDist);
		
		int total = productPagingService.countProductDist(productDist);
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "8";
		}else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "8";
		}
		pp = new ProductPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), productDist);
		List<Product> productList = productPagingService.productPaging(pp);
		model.addAttribute("paging", pp);
		model.addAttribute("productList", productList);
		model.addAttribute("productDist", productDist);
		
		return "/product/list";
	}
	
	
}
