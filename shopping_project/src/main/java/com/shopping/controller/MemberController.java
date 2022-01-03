package com.shopping.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shopping.entity.Member;
import com.shopping.entity.Order;
import com.shopping.entity.Product;
import com.shopping.service.MemberService;
import com.shopping.service.OrderService;
import com.shopping.service.ProductService;

@Controller
@RequestMapping("member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	MemberService memberService;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	ProductService productService;
	
	@GetMapping("join")
	public String joinForm() {
		return "/member/joinForm";
	}
	
	@GetMapping("myPage")
	public String myPage(String userid, Model model) {
		Member result = memberService.readById(userid);
		model.addAttribute("result", result);
		
		List<Order> orderList = orderService.myOrderList(userid);
		model.addAttribute("orderList", orderList);


		return "/member/joinResult";
	}
	
	
	@PostMapping("join")
	public String insert(Member member, Model model) {
		int cnt = memberService.join(member);
		if(cnt > 0) {
			Member result = memberService.readById(member.getUserid());
			model.addAttribute("result", result);
		}else {
			return "에러";
		}
		
		return "/member/joinResult";
	}
	
	@GetMapping("updateForm")
	public String MainupdateForm(String userid, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		return "/member/update";
	}
	
	@PostMapping("updateForm")
	public String updateForm(String userid, Model model) {
		Member user = memberService.readById(userid);
		model.addAttribute("result", user);
		return "/member/update";
	}
	
	@PostMapping("update")
	public String update(Member member, Model model) {
		int cnt = memberService.modify(member);
		if(cnt >0) {
			Member result = memberService.readById(member.getUserid());
			model.addAttribute("result", result);			
		}else {
			return"에러";
		}
		return "/member/joinResult";
	}
	
	@PostMapping("deleteForm")
	public String deleteForm(String userid, Model model) {
		Member result = memberService.readById(userid);
		model.addAttribute("result", result);
		return "/member/deleteForm";
	}
	
	@PostMapping("delete")
	public String delete(Member member, Model model) {
		int cnt = memberService.remove(member);
		model.addAttribute("cnt", cnt);
		
		List<Product> list = productService.selectPic();
		model.addAttribute("productList", list);
		return "/main";
	}
	
	@GetMapping("loginForm")
	public String loginForm() {
		return "/member/login";
	}
	
	@PostMapping("login")
	public String login(Member member,String userid, String userpw, Model model) {
		Member result = memberService.login(member);
		if(result != null) {
			if(userid.equals(result.getUserid()) && userpw.equals(result.getUserpw())) {
				model.addAttribute("result", result);
				
				List<Product> list = productService.selectPic();
				model.addAttribute("productList", list);
				
				return "/main";
			}
		}
		model.addAttribute("msg", "*아이디와 비밀번호를 확인해주세요.");
		return "/member/login";
		
	}
	
	@GetMapping("logout")
	public String logout(Model model) {
		
		List<Product> list = productService.selectPic();
		model.addAttribute("productList", list);
		return "/main";
	}
	
	@GetMapping("findIdForm")
	public String findIdForm() {
		return "/member/findIdForm";
	}
	
	@PostMapping("findId")
	public String findId(Member member, Model model) {
		Member result = memberService.findId(member);
		if(result == null) {
			model.addAttribute("check", 1);
		}else {
			model.addAttribute("check", 0);
			model.addAttribute("userid", result.getUserid());
		}
		return "/member/findIdForm";
	}
	
	@GetMapping("findPwForm")
	public String findPwForm() {
		return "/member/findPwForm";
	}
	
	@PostMapping("findPw")
	public String findPw(Member member, Model model) {
		Member result = memberService.findPw(member);
		if(result == null) {
			model.addAttribute("check", 1);
		}else {
			model.addAttribute("check", 0);
			model.addAttribute("userid", result.getUserid());
		}
		return "/member/findPwForm";
	}
	
	@PostMapping("updatePw")
	public String updatePw(Member member, Model model) {
		int cnt = memberService.updatePw(member);
		model.addAttribute("cnt", cnt);
		
		return "/member/login";
	}
	

	@GetMapping(value = "emailcheck", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, String> emailcheck(String email) {

		int cnt = memberService.duplicatedEmail(email);

		Map<String, String> map = new HashMap<String, String>();
		if (cnt > 0) {
			map.put("str", email + "는 중복되어서 사용할 수 없습니다.");

		} else {
			map.put("str", email + "는 중복아님, 사용가능 합니다.");
		}

		return map;

	}
	
	@GetMapping(value = "idcheck", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, String> idcheck(String userid) {

		int cnt = memberService.duplicatedId(userid);

		Map<String, String> map = new HashMap<String, String>();
		if (cnt > 0) {
			map.put("str", userid + "는 중복되어서 사용할 수 없습니다.");

		} else {
			map.put("str", userid + "는 중복아님, 사용가능 합니다.");
		}

		return map;

	}

	
	
}
