package com.shopping.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shopping.entity.Product;
import com.shopping.entity.ProductPaging;
import com.shopping.mapper.ProductMapper;

@Repository
public class ProductDaoMybatisMapper implements ProductDao {
	
	public final ProductMapper productMapper;
	
	@Autowired
	public ProductDaoMybatisMapper(ProductMapper productMapper) {
		this.productMapper = productMapper;
	}

	@Override
	public List<Product> productList() {
		return productMapper.productList();
	}

	@Override
	public Product read(String productId) {
		return productMapper.read(productId);
	}


	@Override
	public int update(Product product) {
		return productMapper.update(product);
	}


	@Override
	public int insert(Product product) {
		return productMapper.insert(product);
	}

	@Override
	public int updateFile(Map<String, Object> map) {
		return productMapper.updateFile(map);
	}

	@Override
	public int delete(Product product) {
		return productMapper.delete(product);
	}

	@Override
	public String selectImg(String productId) {
		return productMapper.selectImg(productId);
	}

	@Override
	public int updateFilename(Product product) {
		return productMapper.updateFilename(product);
	}

	@Override
	public List<Product> selectDist(String productDist) {
		return productMapper.selectDist(productDist);
	}

	@Override
	public List<Product> selectPic() {
		return productMapper.selectPic();
	}

	

		
}
