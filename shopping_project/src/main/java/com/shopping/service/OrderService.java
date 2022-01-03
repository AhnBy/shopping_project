package com.shopping.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.dao.OrderDao;
import com.shopping.entity.Order;

@Service
public class OrderService {
	
	@Autowired
	OrderDao orderDao;
	
	public List<Order> myOrderList(String userid){
		return orderDao.myOrderList(userid);
	}
	
	public int insert(Order order) {
		order.setOrderDate(LocalDateTime.now());
		order.setBillingDate(LocalDateTime.now());
		return orderDao.insert(order);
	}
	
	public int delete(int orderId) {
		return orderDao.delete(orderId);
	}
	
	public int update(Order order) {
		return orderDao.update(order);
	}
	
	public Order selectById(int orderId) {
		return orderDao.selectById(orderId);
	}
}
