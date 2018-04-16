package com.service.impl;

import com.dao.AdminMapper;
import com.model.Admin;
import com.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Resource
    private AdminMapper adminMapper;

    @Override
    public List<Admin> findAdminAll() {
        return adminMapper.findAdminAll();
    }

    @Override
    public Admin findSingleAdmin(Integer id) {
        return adminMapper.selectByPrimaryKey(id);
    }

    @Override
    public int addAdmin(Admin obj) {
        return adminMapper.insertSelective(obj);
    }

    @Override
    public int updateAdmin(Admin obj) {
        return adminMapper.updateByPrimaryKeySelective(obj);
    }

    @Override
    public int deleteAdmin(Integer id) {
        return adminMapper.deleteByPrimaryKey(id);
    }

	@Override
	public Admin findAdminByUnameAndPwd(String uname, String pwd) {
		return adminMapper.findAdminByUnameAndPwd(uname,pwd);
	}
}
