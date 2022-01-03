package com.shopping.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.dao.ProductDao;
import com.shopping.entity.Product;
import com.shopping.entity.ProductPaging;

@Service
public class ProductService {
	
	@Autowired
	ProductDao productDao;
	
	public List<Product> findAll(){
		return productDao.productList();
	}
	
	public Product read(String productId) {
		return productDao.read(productId);
	}
	
	
	public int insert(Product product) {
		product.setRegDate(LocalDateTime.now());
		product.setUpdateDate(LocalDateTime.now());
		return productDao.insert(product);
	}
	
	public int updateFile(Map<String, Object> map) {
		return productDao.updateFile(map);
	}
	
	public int update(Product product) {
		return productDao.update(product);
	}
	
	public int delete(Product product) {
		return productDao.delete(product);
	}
	
	public String selectImg(String productId) {
		return productDao.selectImg(productId);
	}
	
	public int updateFilename(Product product) {
		return productDao.updateFilename(product);
	}
	
	public List<Product> selectDist(String productDist) {
		return productDao.selectDist(productDist);
	}
	
	public List<Product> selectPic(){
		return productDao.selectPic();
	}
	
	
	
}









