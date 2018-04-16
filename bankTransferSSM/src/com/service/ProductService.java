package com.service;

import java.util.List;

import com.model.Product;

public interface ProductService {

	List<Product> findProductAll(String productname);

	Product findSingleProduct(Integer id);

	int addProduct(Product obj);

	int updateProduct(Product obj);

	int deleteProduct(Integer id);
}
