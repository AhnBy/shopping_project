package com.shopping.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.dao.CartDao;
import com.shopping.entity.Cart;

@Service
public class CartService {
	
	@Autowired
	CartDao cartDao;
	
	public int addCart(Cart cart) {
		cart.setRegDate(LocalDateTime.now());
		return cartDao.addCart(cart);
	}
	
	public int deleteCart(String productId) {
		return cartDao.deleteCart(productId);
	}
	
	public int modifyCart(Cart cart) {
		return cartDao.updateCart(cart);
	}
	
	public Cart checkCart(Cart cart) {
		return cartDao.checkCart(cart);
	}
	
	public boolean findCartGoods(Cart cart) {
		return cartDao.findCartGoods(cart);
	}
	
	public int cartidQty(String userid) {
		return cartDao.cartidQty(userid);
	}
	
	public Map<String, List> getMyCart(String userid){
		return cartDao.getMyCart(userid);
	}
}








