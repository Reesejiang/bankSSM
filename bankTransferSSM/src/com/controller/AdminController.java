package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Account;
import com.model.Admin;
import com.service.AccountService;
import com.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private AccountService accountService;
	
	@RequestMapping("/login")
	public String login(String uname, String pwd, String role,HttpServletRequest request) {
		
		if("0".equals(role)){
			Admin admin = adminService.findAdminByUnameAndPwd(uname, pwd);
			if (admin == null) {
				request.setAttribute("msg", "该用户不存在，请重新登录！");
				return "/login";
			} else {
				request.getSession().setAttribute("uname", admin.getUname());
				request.getSession().setAttribute("uid", admin.getId());
				request.getSession().setAttribute("roler", role);

				request.setAttribute("msg", "");
				return "/index";
			}
		}else{
			/*验证用户名和密码*/
			Account account = accountService.findAccountByUnameAndPwd(uname, pwd);
			if (account == null) {
				request.setAttribute("msg", "该用户不存在，请重新登录！");
				return "/login";
			} else {
				request.getSession().setAttribute("uname", account.getAccountName());
				request.getSession().setAttribute("uid", account.getAccountId());
				request.getSession().setAttribute("roler", role);

				request.setAttribute("msg", "");
				return "/index";
			}
		}
	}
	
	@RequestMapping("/beforeRegist")
	public String beforeRegist(HttpServletRequest request){
		int max = accountService.findMaxAccountId();
		/*卡号--使用指定的格式字符串和参数返回一个格式化字符串*/
		String accountCode = String.format("%05d", max+1);
		request.setAttribute("accountCode", accountCode);
		return "/regist";
	}
	
	@RequestMapping("/regist")
	public String regist(Account account){
		account.setBalance(0.0);
		account.setIntegralNum(0);
		account.setStatus("0");
		accountService.addAccount(account);
		return "/login";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().setAttribute("uname", null);
		request.getSession().setAttribute("uid", null);
		request.getSession().setAttribute("roler", null);

		request.setAttribute("msg", null);
		return "/login";
	}
	
	@RequestMapping("/findAdminAll")
	public String findAdminAll(HttpServletRequest request) {
		List<Admin> adminList = adminService.findAdminAll();
		request.setAttribute("adminList", adminList);
		return "/admin_list";
	}

	@RequestMapping("/beforeAddOrUpdateAdmin")
	public String beforeAddOrUpdateAdmin(Integer adminId, HttpServletRequest request) {
		Admin admin = new Admin();
		if (adminId != null && !adminId.equals("")) {
			admin = adminService.findSingleAdmin(adminId);
		}
		request.setAttribute("admin", admin);
		return "/admin_addOrEdit";
	}

	@RequestMapping("/addOrUpdateAdmin")
	public String addOrUpdateAdmin(Admin admin) {
		if(admin.getId()==null){
			adminService.addAdmin(admin);
		}else{
			adminService.updateAdmin(admin);
		}
		return "redirect:/admin/findAdminAll";
	}

	@RequestMapping("/deleteAdmin")
	public String deleteAdmin(Integer adminId) {
		adminService.deleteAdmin(adminId);
		return "redirect:/admin/findAdminAll";
	}
}
