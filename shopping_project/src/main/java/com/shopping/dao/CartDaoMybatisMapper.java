package com.shopping.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shopping.entity.Cart;
import com.shopping.entity.Product;
import com.shopping.mapper.CartMapper;

@Repository
public class CartDaoMybatisMapper implements CartDao {
	
	public final CartMapper cartMapper;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	public CartDaoMybatisMapper(CartMapper cartMapper) {
		this.cartMapper = cartMapper;
	}

	@Override
	public int addCart(Cart cart) {
		return cartMapper.addCart(cart);
	}

	@Override
	public boolean findCartGoods(Cart cart) {
		String result = sqlSession.selectOne("com.shopping.mapper.CartMapper.findCartGoods", cart);
		return Boolean.parseBoolean(result);
	}

	@Override
	public int deleteCart(String productId) {
		return cartMapper.deleteCart(productId);
	}

	@Override
	public int updateCart(Cart cart) {
		return cartMapper.updateCart(cart);
	}

	@Override
	public Cart checkCart(Cart cart) {
		return cartMapper.checkCart(cart);
	}

	@Override
	public int cartidQty(String userid) {
		return cartMapper.cartidQty(userid);
	}

	@Override
	public Map<String, List> getMyCart(String userid) {
		
		Map<String, List> cartMap = new HashMap<String, List>();
		
		List<Cart> cartList = cartMapper.getMyCartProductId(userid);
		if(cartList.size() == 0) {
			return null;
		}
		
		List<Product> productList = cartMapper.getMyCartList(cartList);
		
		cartMap.put("cartList", cartList);
		cartMap.put("productList", productList);
		
		return cartMap;
	}

	@Override
	public List<Product> getMyCartList(List<Cart> cartlist) {
		return cartMapper.getMyCartList(cartlist);
	}

	@Override
	public List<Cart> getMyCartProductId(String userid) {
		return cartMapper.getMyCartProductId(userid);
	}
}
