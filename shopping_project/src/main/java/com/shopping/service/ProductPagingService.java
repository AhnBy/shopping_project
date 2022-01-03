package com.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.dao.ProductPagingDao;
import com.shopping.entity.Product;
import com.shopping.entity.ProductPaging;

@Service
public class ProductPagingService {
	
	@Autowired
	ProductPagingDao productPagingDao;
	
	public int countProduct() {
		return productPagingDao.countProduct();
	}
	
	public List<Product> productPaging(ProductPaging pp){
		return productPagingDao.productPaging(pp);
	}
	
	public int countArticle(String keyword, String searchOption) {
		return productPagingDao.countArticle(keyword, searchOption);
	}
	
	public List<Product> listAll(ProductPaging pp){
		return productPagingDao.listAll(pp);
	}
	
	public List<Product> adminProductPaging(ProductPaging pp){
		return productPagingDao.adminProductPaging(pp);
	}
	
	public int countProductDist(String productDist) {
		return productPagingDao.countProductDist(productDist);
	}
}










