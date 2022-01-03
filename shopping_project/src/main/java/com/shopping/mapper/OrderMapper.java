package com.shopping.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shopping.entity.Order;

@Mapper
public interface OrderMapper {
	
	public List<Order> myOrderList(String userid);
	
	public int insert(Order order);
	
	public int delete(int orderId);
	
	public int update(Order order);
	
	public Order selectById(int orderId);
}
