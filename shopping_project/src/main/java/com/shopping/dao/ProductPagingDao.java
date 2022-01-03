package com.shopping.dao;

import java.util.List;

import com.shopping.entity.Product;
import com.shopping.entity.ProductPaging;

public interface ProductPagingDao {
	
	public int countProduct();
	
	public int countProductDist(String productDist);
	
	public List<Product> productPaging(ProductPaging pp);
	
	public List<Product> adminProductPaging(ProductPaging pp);
	
	public int countArticle(String keyword, String searchOption);
	
	public List<Product> listAll(ProductPaging pp);

}
