package com.shopping.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shopping.entity.Member;
import com.shopping.entity.Order;
import com.shopping.entity.Product;
import com.shopping.service.CartService;
import com.shopping.service.MemberService;
import com.shopping.service.OrderService;
import com.shopping.service.ProductService;

@Controller
@RequestMapping("order")
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CartService cartService;
	
	@PostMapping("orderForm")
	public String orderForm(String userid, String productId, String selected_Opt, String order_Qty, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		
		Product pd = productService.read(productId);
		
		model.addAttribute("productInfo", pd);
		model.addAttribute("order_Qty", order_Qty);
		model.addAttribute("selected_Opt", selected_Opt);
		return "/order/orderForm";
	}
	
	@GetMapping("orderForm")
	public String cartorder(String userid, String productId, String selected_Opt, String order_Qty, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		
		Product pd = productService.read(productId);
		
		model.addAttribute("productInfo", pd);
		model.addAttribute("order_Qty", order_Qty);
		model.addAttribute("selected_Opt", selected_Opt);
		return "/order/orderForm";
	}
	
	@PostMapping("insert")
	public String insert(Order order, String userid, String productId, String selectedOpt, String filename, String orderQty, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		
		Product pd = productService.read(productId);
		model.addAttribute("productInfo", pd);
		model.addAttribute("orderQty", orderQty);
		model.addAttribute("selectedOpt", selectedOpt);
		
		order.setFullname(filename);
		
		cartService.deleteCart(productId);
		
		orderService.insert(order);
		model.addAttribute("orderDTO", order);

		return "order/orderResult";
	}
	
	@GetMapping("delete")
	public String delete(String userid, String productId, int orderId, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		
		int cnt = orderService.delete(orderId);
		
		List<Order> orderList = orderService.myOrderList(userid);
		model.addAttribute("orderList", orderList);
		
		return "/member/joinResult";
	}
	
	@GetMapping("updateForm")
	public String updateForm(String userid, String productId, int orderId, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		
		Product pd = productService.read(productId);
		
		model.addAttribute("productInfo", pd);
		
		Order order = orderService.selectById(orderId);
		model.addAttribute("orderList", order);
		
		return "/order/orderUpdateForm";
	}
	
	
	
	@PostMapping("update")
	public String update(String userid, String productId, Order order, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		
		Product pd = productService.read(productId);
		model.addAttribute("productInfo", pd);

		
		orderService.update(order);
		model.addAttribute("orderDTO", order);
		
		List<Order> orderList = orderService.myOrderList(userid);
		model.addAttribute("orderList", orderList);
		
		
		return "/member/joinResult";
	}
	
	
	
	
}
