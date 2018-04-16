package com.service;

import java.util.List;

import com.model.Admin;

public interface AdminService {

	List<Admin> findAdminAll();

	Admin findSingleAdmin(Integer id);

	int addAdmin(Admin obj);

	int updateAdmin(Admin obj);

	int deleteAdmin(Integer id);

	Admin findAdminByUnameAndPwd(String uname, String pwd);
}
