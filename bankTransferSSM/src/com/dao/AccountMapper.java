package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.model.Account;

public interface AccountMapper {
    int deleteByPrimaryKey(Integer accountId);

    int insertSelective(Account record);

    Account selectByPrimaryKey(Integer accountId);

    int updateByPrimaryKeySelective(Account record);

	List<Account> findAccountAll();

	Account findAccountByUnameAndPwd(@Param("uname")String uname, @Param("pwd")String pwd);

	Account findAccountByInfo(@Param("accountName")String accountName, @Param("accountCode")String accountCode, @Param("uid")Integer uid);

	int findMaxAccountId();
	
}