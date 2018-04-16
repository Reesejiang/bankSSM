package com.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.model.Account;
import com.service.AccountService;

@Controller
@RequestMapping("/account")
public class AccountController {

	@Autowired
	private AccountService accountService;
	
	@RequestMapping("/findAccountAll")
	public String findAccountAll(HttpServletRequest request) {
		List<Account> accountList = accountService.findAccountAll();
		request.setAttribute("accountList", accountList);
		return "/account_list";
	}

	@RequestMapping("/beforeAddOrUpdateAccount")
	public String beforeAddOrUpdateAccount(Integer accountId, HttpServletRequest request) {
		Account account = new Account();
		if (accountId != null && !accountId.equals("")) {
			account = accountService.findSingleAccount(accountId);
		}
		request.setAttribute("account", account);
		
		int max = accountService.findMaxAccountId();
		String accountCode = String.format("%05d", max+1);
		request.setAttribute("accountCode", accountCode);
		
		return "/account_addOrEdit";
	}

	@RequestMapping("/addOrUpdateAccount")
	public String addOrUpdateAccount(Account account) {
		if(account.getAccountId()==null){
			accountService.addAccount(account);
		}else{
			accountService.updateAccount(account);
		}
		return "redirect:/account/findAccountAll";
	}
	
	@RequestMapping("/findAccountInfo")
	public String findAccountInfo(HttpServletRequest request) {
		Integer uid = (Integer)request.getSession().getAttribute("uid");
		Account account = accountService.findSingleAccount(uid);
		request.setAttribute("account", account);
		return "/account_info";
	}


	@RequestMapping("/deleteAccount")
	public String deleteAccount(Integer accountId) {
		accountService.deleteAccount(accountId);
		return "redirect:/account/findAccountAll";
	}
	
	@RequestMapping("/updateStatus")
	public String updateStatus(Integer accountId,String status) {
		Account account = accountService.findSingleAccount(accountId);
		account.setStatus(status);
		accountService.updateAccount(account);
		return "redirect:/account/findAccountAll";
	}
	
	@RequestMapping("checkAccount")
	public void checkAccount(String accountName,String accountCode,String accountPwd,String accountType, HttpServletRequest request,HttpServletResponse response){
		String role = (String)request.getSession().getAttribute("roler");
		Account account = null;
		if("0".equals(role)){
			account = accountService.findAccountByInfo(accountName,accountCode,null);
		}else{
			Integer uid = (Integer)request.getSession().getAttribute("uid");	
			account = accountService.findAccountByInfo(accountName,accountCode,uid);
		}
		
		JSONObject jsonObject = new JSONObject();
		if(account==null){
			jsonObject.put("code", "1");
			jsonObject.put("message", "账户不存在");
		}else{
			if(!account.getAccountPwd().equals(accountPwd)){
				jsonObject.put("code", "1");
				jsonObject.put("message", "账户密码错误");
			}else{
				if("Y".equals(accountType)&&!"2".equals(account.getAccountType())){
					jsonObject.put("code", "1");
					jsonObject.put("message", "当前账户不是多币种账户");
				}else{
					jsonObject.put("code", "0");
					jsonObject.put("message", "成功");
					jsonObject.put("data", account);	
				}
			}
		}
		
		response.setCharacterEncoding("utf-8");
		PrintWriter out = null;
		try{
			out = response.getWriter();
			out.write(jsonObject.toJSONString());
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			out.flush();
			out.close();
		}
	}
	
	@RequestMapping("checkPayeeAccount")
	public void checkPayeeAccount(Integer accountId,String payeeAccountName,String payeeAccountCode,String isBank,String accountType, HttpServletRequest request,HttpServletResponse response){
		
		Account account = accountService.findSingleAccount(accountId);
		
		Account payeeAccount = accountService.findAccountByInfo(payeeAccountName,payeeAccountCode,null);
		
		JSONObject jsonObject = new JSONObject();
		if(payeeAccount==null){
			jsonObject.put("code", "1");
			jsonObject.put("message", "账户不存在");
		}else{
			if("Y".equals(isBank)){
				if(account.getBankName().equals(payeeAccount.getBankName())){
					jsonObject.put("code", "1");
					jsonObject.put("message", "账户不存在");
				}else{
					if("Y".equals(accountType)&&!"2".equals(payeeAccount.getAccountType())){
						jsonObject.put("code", "1");
						jsonObject.put("message", "当前账户不是多币种账户");
					}else{
						jsonObject.put("code", "0");
						jsonObject.put("message", "成功");
						jsonObject.put("data", payeeAccount);
					}
				}
			}else{
				if(account.getBankName().equals(payeeAccount.getBankName())){
					if("Y".equals(accountType)&&!"2".equals(payeeAccount.getAccountType())){
						jsonObject.put("code", "1");
						jsonObject.put("message", "当前账户不是多币种账户");
					}else{
						jsonObject.put("code", "0");
						jsonObject.put("message", "成功");
						jsonObject.put("data", payeeAccount);
					}
				}else{
					jsonObject.put("code", "1");
					jsonObject.put("message", "账户不存在");
				}
			}
		}
		
		response.setCharacterEncoding("utf-8");
		PrintWriter out = null;
		try{
			out = response.getWriter();
			out.write(jsonObject.toJSONString());
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			out.flush();
			out.close();
		}
	}
}
