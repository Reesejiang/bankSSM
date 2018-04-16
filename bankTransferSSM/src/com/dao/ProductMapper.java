package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.model.Product;

public interface ProductMapper {
    int deleteByPrimaryKey(Integer productId);

    int insertSelective(Product record);

    Product selectByPrimaryKey(Integer productId);

    int updateByPrimaryKeySelective(Product record);

	List<Product> findProductAll(@Param("productName")String productName);
}