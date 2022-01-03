package com.shopping.dao;

import java.util.List;

import com.shopping.entity.Order;

public interface OrderDao {
	
	public List<Order> myOrderList(String userid);
	
	public int insert(Order order);
	
	public int delete(int orderId);
	
	public int update(Order order);
	
	public Order selectById(int orderId);
}
