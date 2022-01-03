package com.shopping.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.shopping.entity.Product;
import com.shopping.entity.ProductPaging;

@Mapper
public interface ProductMapper {
	
	public List<Product> productList();
	
	public Product read(String productId);
	
	public int update(Product product);
	
	public int insert(Product product);
	
	public int updateFile(Map<String, Object> map);
	
	public int delete(Product product);
	
	public String selectImg(String productId);
	
	public int updateFilename(Product product);
	
	public List<Product> selectDist(String productDist);
	
	public List<Product> selectPic();
	
	public int countProduct();
	
	public List<Product> productPaging(ProductPaging pp);
	
}
