package com.shopping.dao;

import java.util.List;
import java.util.Map;

import com.shopping.entity.Cart;
import com.shopping.entity.Product;

public interface CartDao {
	
	public int addCart(Cart cart);
	
	public int cartidQty(String userid);
	
	public int deleteCart(String productId);
	
	public int updateCart(Cart cart);
	
	public Map<String, List> getMyCart(String userid);
	
	public List<Product> getMyCartList(List<Cart> cartlist);
	
	public List<Cart> getMyCartProductId(String userid);
	
	public Cart checkCart(Cart cart);
	
	public boolean findCartGoods(Cart cart); 
}
