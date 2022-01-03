package com.shopping.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shopping.entity.Cart;
import com.shopping.entity.Member;
import com.shopping.entity.Product;
import com.shopping.service.CartService;
import com.shopping.service.MemberService;
import com.shopping.service.ProductService;

@Controller
@RequestMapping("cart")
public class CartController {
	
	@Autowired
	CartService cartService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ProductService productService;
	
	@GetMapping("add")
	public String addCart(String productId, String userid, String selected_Opt,int order_Qty, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		
		Cart cart = new Cart();
		cart.setProductId(productId);
		cart.setUserId(userid);
		cart.setCartQty(order_Qty);
		cart.setCartOpt(selected_Opt);
		
		model.addAttribute("selected_Opt", selected_Opt);
		model.addAttribute("order_Qty", order_Qty);
		if(cartService.cartidQty(userid) == 0) {
			cart.setCartId(1);
			int cnt = cartService.addCart(cart);
			model.addAttribute("cnt", cnt);
			
		}else {
			cart.setCartId(cartService.cartidQty(userid)+1);
			
			int cnt = cartService.addCart(cart);
			model.addAttribute("cnt", cnt);
		}
		Map<String, List> cartMap = cartService.getMyCart(userid);
		
		model.addAttribute("cartMap", cartMap);
		return "/cart/mycart";
	}
	
	@GetMapping("mycart")
	public String getCart(String userid, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		
		Map<String, List> cartMap = cartService.getMyCart(userid);
		
		model.addAttribute("cartMap", cartMap);
		
		
		return "/cart/mycart";
	}
	
	@GetMapping("updateForm")
	public String updateCart(String userid, Product product, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		
		Product pd = productService.read(product.getProductId());
		model.addAttribute("productInfo", pd);
		
		return "/cart/buydetail";
	}
	
	@GetMapping("update")
	public String update(int cartId, String productId, String userid, String selected_Opt,int order_Qty, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		
		Cart cart = new Cart();
		cart.setCartQty(order_Qty);
		model.addAttribute("selected_Opt", selected_Opt);
		model.addAttribute("order_Qty", order_Qty);
		
		int cnt = cartService.modifyCart(cart);
		
		Map<String, List> cartMap = cartService.getMyCart(userid);
		
		model.addAttribute("cartMap", cartMap);
		return "/cart/mycart";
	}
	
	
	@GetMapping("delete")
	public String deleteCart(String productId, String userid, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		
		int cnt = cartService.deleteCart(productId);
		
		Map<String, List> cartMap = cartService.getMyCart(userid);
		
		model.addAttribute("cartMap", cartMap);
		
		return "/cart/mycart";
	}
	
	
	
	
}











