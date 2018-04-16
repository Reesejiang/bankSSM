package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.Product;
import com.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping("/findProductAll")
	public String findProductAll(String m,@RequestParam(value="productname",required=false ,defaultValue="" )String productname,HttpServletRequest request) {
		List<Product> productList = productService.findProductAll(productname);
		request.setAttribute("productList", productList);
		request.setAttribute("m", m);
		return "/product_list";
	}

	@RequestMapping("/beforeAddOrUpdateProduct")
	public String beforeAddOrUpdateProduct(Integer productId, HttpServletRequest request) {
		Product product = new Product();
		if (productId != null && !productId.equals("")) {
			product = productService.findSingleProduct(productId);
		}
		request.setAttribute("product", product);
		return "/product_addOrEdit";
	}

	@RequestMapping("/addOrUpdateProduct")
	public String addOrUpdateProduct(Product product) {
		if(product.getProductId()==null){
			productService.addProduct(product);
		}else{
			productService.updateProduct(product);
		}
		return "redirect:/product/findProductAll?m=1";
	}

	@RequestMapping("/deleteProduct")
	public String deleteProduct(Integer productId) {
		productService.deleteProduct(productId);
		return "redirect:/product/findProductAll?m=1";
	}
}
