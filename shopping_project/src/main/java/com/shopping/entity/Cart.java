package com.shopping.entity;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Cart {
	private String userid;
	private String productId;
	private int cartId;
	private int cartQty;
	private String cartOpt;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private LocalDateTime regDate;
	public Cart() {
		super();
	}
	public Cart(String userId, String productId, int cartId, int cartQty, String cartOpt, LocalDateTime regDate) {
		super();
		this.userid = userId;
		this.productId = productId;
		this.cartId = cartId;
		this.cartQty = cartQty;
		this.cartOpt = cartOpt;
		this.regDate = regDate;
	}
	
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getCartOpt() {
		return cartOpt;
	}
	public void setCartOpt(String cartOpt) {
		this.cartOpt = cartOpt;
	}
	public String getUserId() {
		return userid;
	}
	public void setUserId(String userId) {
		this.userid = userId;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getCartQty() {
		return cartQty;
	}
	public void setCartQty(int cartQty) {
		this.cartQty = cartQty;
	}
	public LocalDateTime getRegDate() {
		return regDate;
	}
	public void setRegDate(LocalDateTime regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "Cart [userId=" + userid + ", productId=" + productId + ", cartId=" + cartId + ", cartQty=" + cartQty
				+ ", regDate=" + regDate + "]";
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cart other = (Cart) obj;
		if (cartId != other.cartId)
			return false;
		return true;
	}


}
