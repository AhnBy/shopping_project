package com.shopping.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shopping.entity.Product;
import com.shopping.entity.ProductPaging;
import com.shopping.mapper.ProductPagingMapper;

@Repository
public class ProductPagingDaoMybatisMapper implements ProductPagingDao {
	
	public final ProductPagingMapper productPagingMapper;
	
	@Autowired
	public ProductPagingDaoMybatisMapper(ProductPagingMapper productPagingMapper) {
		this.productPagingMapper = productPagingMapper;
	}
	
	@Override
	public int countProduct() {
		return productPagingMapper.countProduct();
	}

	@Override
	public List<Product> productPaging(ProductPaging pp) {
		return productPagingMapper.productPaging(pp);
	}

	@Override
	public int countArticle(String keyword, String searchOption) {
		return productPagingMapper.countArticle(keyword, searchOption);
	}

	@Override
	public List<Product> listAll(ProductPaging pp) {
		return productPagingMapper.listAll(pp);
	}

	@Override
	public List<Product> adminProductPaging(ProductPaging pp) {
		return productPagingMapper.adminProductPaging(pp);
	}

	@Override
	public int countProductDist(String productDist) {
		return productPagingMapper.countProductDist(productDist);
	}
}
