package com.service;

import java.util.List;

import com.model.Account;

public interface AccountService {

	List<Account> findAccountAll();

	Account findSingleAccount(Integer id);

	int addAccount(Account obj);

	int updateAccount(Account obj);

	int deleteAccount(Integer id);

	Account findAccountByUnameAndPwd(String uname, String pwd);

	Account findAccountByInfo(String accountName, String accountCode, Integer uid);

	int findMaxAccountId();
}
