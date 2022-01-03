package com.shopping.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shopping.entity.Order;
import com.shopping.mapper.OrderMapper;

@Repository
public class OrderDaoMybatisMapper implements OrderDao {
	
	public final OrderMapper orderMapper;
	
	@Autowired
	public OrderDaoMybatisMapper(OrderMapper orderMapper) {
		this.orderMapper = orderMapper;
	}

	@Override
	public List<Order> myOrderList(String userid) {
		List<Order> myOrderList = orderMapper.myOrderList(userid);
		if(myOrderList.size() == 0) {
			return null;
		}else {
			
			return myOrderList;
		}
	}

	@Override
	public int insert(Order order) {
		return orderMapper.insert(order);
	}

	@Override
	public int delete(int orderId) {
		return orderMapper.delete(orderId);
	}

	@Override
	public int update(Order order) {
		return orderMapper.update(order);
	}

	@Override
	public Order selectById(int orderId) {
		return orderMapper.selectById(orderId);
	}
}
