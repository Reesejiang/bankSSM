package com.service.impl;

import com.dao.ProductMapper;
import com.model.Product;
import com.service.ProductService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Resource
    private ProductMapper productMapper;

    @Override
    public List<Product> findProductAll(String productname) {
        return productMapper.findProductAll(productname);
    }

    @Override
    public Product findSingleProduct(Integer id) {
        return productMapper.selectByPrimaryKey(id);
    }

    @Override
    public int addProduct(Product obj) {
        return productMapper.insertSelective(obj);
    }

    @Override
    public int updateProduct(Product obj) {
        return productMapper.updateByPrimaryKeySelective(obj);
    }

    @Override
    public int deleteProduct(Integer id) {
        return productMapper.deleteByPrimaryKey(id);
    }
}
