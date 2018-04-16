package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.model.Admin;

public interface AdminMapper {
    int deleteByPrimaryKey(Integer id);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Admin record);

	List<Admin> findAdminAll();

	Admin findAdminByUnameAndPwd(@Param("uname")String uname,@Param("pwd") String pwd);
}