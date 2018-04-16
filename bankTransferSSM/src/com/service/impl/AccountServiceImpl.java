package com.service.impl;

import com.dao.AccountMapper;
import com.model.Account;
import com.service.AccountService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AccountServiceImpl implements AccountService {

    @Resource
    private AccountMapper accountMapper;

    @Override
    public List<Account> findAccountAll() {
        return accountMapper.findAccountAll();
    }

    @Override
    public Account findSingleAccount(Integer id) {
        return accountMapper.selectByPrimaryKey(id);
    }

    @Override
    public int addAccount(Account obj) {
        return accountMapper.insertSelective(obj);
    }

    @Override
    public int updateAccount(Account obj) {
        return accountMapper.updateByPrimaryKeySelective(obj);
    }

    @Override
    public int deleteAccount(Integer id) {
        return accountMapper.deleteByPrimaryKey(id);
    }

	@Override
	public Account findAccountByUnameAndPwd(String uname, String pwd) {
		return accountMapper.findAccountByUnameAndPwd(uname,pwd);
	}

	@Override
	public Account findAccountByInfo(String accountName, String accountCode, Integer uid) {
		return accountMapper.findAccountByInfo(accountName, accountCode, uid);
	}

	@Override
	public int findMaxAccountId() {
		return accountMapper.findMaxAccountId();
	}
}
