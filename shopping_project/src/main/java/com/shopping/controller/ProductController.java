package com.shopping.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.shopping.entity.Member;
import com.shopping.entity.Product;
import com.shopping.service.MemberService;
import com.shopping.service.ProductService;

@Controller
@RequestMapping("product")
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ProductService productService;
	
	@GetMapping("updateForm")
	public String updateForm(String userid, String productId, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		
		Product pd = productService.read(productId);
		model.addAttribute("productInfo", pd);
		return "/product/update";
	}
	
	@PostMapping("update")
	public String update(String userid, Product product, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		
		product.setUpdateDate(LocalDateTime.now());
		int cnt = productService.update(product);
		//model.addAttribute("cnt", cnt);
		
		List<Product> list = productService.findAll();
		model.addAttribute("productList", list);
		
		return "/admin/productList";
	}
	
	@GetMapping("insert")
	public String insertForm(String userid, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		
		return "/product/insert";
	}
	
	
	
	
	@PostMapping("insert")
	public String insert(MultipartFile filenameMF1, String userid,String productId1,String productName1,int price1,int stock1,String productDist1,String productInfo1, Model model) throws IOException {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		Product product = new Product();
		product.setProductId(productId1);
		product.setProductName(productName1);
		product.setPrice(price1);
		product.setStock(stock1);
		product.setProductDist(productDist1);
		product.setProductInfo(productInfo1);
		product.setFilenameMF(filenameMF1);
		
		String filename = "";
		if(!product.getFilenameMF().isEmpty()) {
			filename = product.getFilenameMF().getOriginalFilename();
			product.setFilename(filename);
			String path = "C:\\Users\\ABC\\Desktop\\web\\eclipse\\sprigA-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\shopping_project\\resources\\img\\";
			
			try {
				new File(path).mkdirs();
				product.getFilenameMF().transferTo(new File(path+filename));
			}catch(Exception e) {
				e.printStackTrace();
			}
			int cnt = productService.insert(product);
			model.addAttribute("cnt", cnt);
			List<Product> list = productService.findAll();
			model.addAttribute("productList", list);
		}else {
			product.setFilename("default.jpg");
			List<Product> list = productService.findAll();
			model.addAttribute("productList", list);
		}
		return "/admin/productList";
	}
	
	@GetMapping("delete")
	public String delete(Product product, String userid, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		String path = "C:\\Users\\ABC\\Desktop\\web\\eclipse\\sprigA-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\shopping_project\\resources\\img\\";
		String filename = productService.selectImg(product.getProductId());
		
		if(filename != "default.jpg") {
			File file = new File(path+filename);
			if(file.exists()) {
				file.delete();
			}
		}
		
		productService.delete(product);
		
		List<Product> list = productService.findAll();
		model.addAttribute("productList", list);
		
		return "/admin/productList";
	}
	
	@GetMapping("updateFileForm")
	public String updateFileForm(String userid, String productId, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		
		Product pd = productService.read(productId);
		model.addAttribute("productInfo", pd);
		
		return "/product/updateFile";
	}
	
	@PostMapping("updateFile")
	public String updateFile(String productId1, String filename1, MultipartFile filenameMF2, String userid, Product product, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		
		product.setFilenameMF(filenameMF2);
		String filename = "";
		if(!product.getFilenameMF().isEmpty()) {
			filename = product.getFilenameMF().getOriginalFilename();
			String path = "C:\\Users\\ABC\\Desktop\\web\\eclipse\\sprigA-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\shopping_project\\resources\\img\\";
			
			try {
				new File(path).mkdirs();
				product.getFilenameMF().transferTo(new File(path+filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			product.setProductId(productId1);
			product.setFilename(filename);
			productService.updateFilename(product);
			List<Product> list = productService.findAll();
			model.addAttribute("productList", list);
			
			if(filename1 != "default.jpg") {
				File file1 = new File(path+filename1);
				if(file1.exists()) {
					file1.delete();
				}
			}
		} else {
			product.setProductId(productId1);
			product.setFilename("default.jpg");
			productService.updateFilename(product);
			List<Product> list = productService.findAll();
			model.addAttribute("productList", list);
		}
		
		return "/admin/productList";
	}
	
	@GetMapping("detail")
	public String detailForm(String productId, String userid, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		
		Product pd = productService.read(productId);
		model.addAttribute("productInfo", pd);
		
		return "/product/detail";
	}
	
	@GetMapping("list")
	public String listForm(String productDist, String userid, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		
		Product product = new Product();
		product.setProductDist(productDist);
		
		List<Product> list = productService.selectDist(product.getProductDist());
		model.addAttribute("productList", list);
		
		return "/product/list";
	}
	
	@GetMapping("buydetail")
	public String buydetailForm(Product product, String userid, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		
		Product pd = productService.read(product.getProductId());
		model.addAttribute("productInfo", pd);
		
		return "/product/buydetail";
	}
	
}






















