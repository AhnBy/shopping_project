package com.shopping.entity;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Order {
	private String productId;
	private String productName;
	private int price;
	private String productDist;
	private String productInfo;
	private String fullname;
	
	private String userid;
	private String name;
	private String email;
	private String tel;
	private String address1;
	private String address2;
	private String zipcode;
	
	private String selectedOpt;
	private int orderQty;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime orderDate;
	private int orderId;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime billingDate;
	private String deliverMsg;
	private int deliverSitu;
	private int totalAmount;
	private String cal_info;
	public Order() {
		super();
	}
	public Order(String productId, String productName, int price, String productDist, String productInfo,
			String fullname, String userid, String name, String email, String tel, String address1, String address2,
			String zipcode, String selectedOpt, int orderQty, LocalDateTime orderDate, int orderId,
			LocalDateTime billingDate, String deliverMsg, int deliverSitu, int totalAmount, String cal_info) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.price = price;
		this.productDist = productDist;
		this.productInfo = productInfo;
		this.fullname = fullname;
		this.userid = userid;
		this.name = name;
		this.email = email;
		this.tel = tel;
		this.address1 = address1;
		this.address2 = address2;
		this.zipcode = zipcode;
		this.selectedOpt = selectedOpt;
		this.orderQty = orderQty;
		this.orderDate = orderDate;
		this.orderId = orderId;
		this.billingDate = billingDate;
		this.deliverMsg = deliverMsg;
		this.deliverSitu = deliverSitu;
		this.totalAmount = totalAmount;
		this.cal_info = cal_info;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProductDist() {
		return productDist;
	}
	public void setProductDist(String productDist) {
		this.productDist = productDist;
	}
	public String getProductInfo() {
		return productInfo;
	}
	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getSelectedOpt() {
		return selectedOpt;
	}
	public void setSelectedOpt(String selectedOpt) {
		this.selectedOpt = selectedOpt;
	}
	public int getOrderQty() {
		return orderQty;
	}
	public void setOrderQty(int orderQty) {
		this.orderQty = orderQty;
	}
	public LocalDateTime getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(LocalDateTime orderDate) {
		this.orderDate = orderDate;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	
	public LocalDateTime getBillingDate() {
		return billingDate;
	}
	public void setBillingDate(LocalDateTime billingDate) {
		this.billingDate = billingDate;
	}
	public String getDeliverMsg() {
		return deliverMsg;
	}
	public void setDeliverMsg(String deliverMsg) {
		this.deliverMsg = deliverMsg;
	}
	public int getDeliverSitu() {
		return deliverSitu;
	}
	public void setDeliverSitu(int deliverSitu) {
		this.deliverSitu = deliverSitu;
	}
	public int getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getCal_info() {
		return cal_info;
	}
	public void setCal_info(String cal_info) {
		this.cal_info = cal_info;
	}
	
	
}
