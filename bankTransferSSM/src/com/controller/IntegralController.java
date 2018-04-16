package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Account;
import com.model.Integral;
import com.model.Product;
import com.service.AccountService;
import com.service.IntegralService;
import com.service.ProductService;

@Controller
@RequestMapping("/integral")
public class IntegralController {

	@Autowired
	private IntegralService integralService;
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/findIntegralAll")
	public String findIntegralAll(HttpServletRequest request) {
		String role = (String)request.getSession().getAttribute("roler");
		List<Integral> integralList =null;
		if("0".equals(role)){
			integralList = integralService.findIntegralAll();	
		}else{
			Integer uid = (Integer)request.getSession().getAttribute("uid");
			integralList = integralService.findIntegralAllByUid(uid);
		}
		request.setAttribute("integralList", integralList);
		return "/integral_list";
	}

	@RequestMapping("/beforeAddOrUpdateIntegral")
	public String beforeAddOrUpdateIntegral(Integer integralId, HttpServletRequest request) {
		Integral integral = new Integral();
		if (integralId != null && !integralId.equals("")) {
			integral = integralService.findSingleIntegral(integralId);
		}
		request.setAttribute("integral", integral);
		return "/integral_addOrEdit";
	}

	@RequestMapping("/addOrUpdateIntegral")
	public String addOrUpdateIntegral(Integral integral) {
		if(integral.getIntegralId()==null){
			integralService.addIntegral(integral);
		}else{
			integralService.updateIntegral(integral);
		}
		return "redirect:/integral/findIntegralAll";
	}
	
	@RequestMapping("/addIntegral")
	public String addIntegral(Integer productId,HttpServletRequest request) {
		Integer uid = (Integer)request.getSession().getAttribute("uid");
		Account account = accountService.findSingleAccount(uid);
		Product product = productService.findSingleProduct(productId);
		
		if(account.getIntegralNum().intValue()>=product.getIntegralNum().intValue()){
			Integral integral = new Integral();
			integral.setAccountId(uid);
			integral.setProductId(productId);
			integral.setIntegralNum(product.getIntegralNum());
			integralService.addIntegral(integral);
			
			account.setIntegralNum(account.getIntegralNum()-product.getIntegralNum());
			accountService.updateAccount(account);
			
			return "redirect:/integral/findIntegralAll";
		}else{
			
			return "redirect:/product/findProductAll?m=3";
		}
	}

	@RequestMapping("/deleteIntegral")
	public String deleteIntegral(Integer integralId) {
		integralService.deleteIntegral(integralId);
		return "redirect:/integral/findIntegralAll";
	}
}
