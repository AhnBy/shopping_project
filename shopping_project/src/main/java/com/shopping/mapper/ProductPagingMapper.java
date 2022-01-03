package com.shopping.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.shopping.entity.Product;
import com.shopping.entity.ProductPaging;

@Mapper
public interface ProductPagingMapper {
	
	public int countProduct();
	
	public int countProductDist(String productDist);
	
	public List<Product> productPaging(ProductPaging pp);
	
	public List<Product> adminProductPaging(ProductPaging pp);
	
	public int countArticle(@Param("keyword")String keyword,@Param("searchOption")String searchOption);
	
	public List<Product> listAll(ProductPaging pp);
}
