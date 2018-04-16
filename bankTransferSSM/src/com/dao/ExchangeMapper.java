package com.dao;

import java.util.List;

import com.model.Exchange;

public interface ExchangeMapper {
    int deleteByPrimaryKey(Integer exchangeId);

    int insertSelective(Exchange record);

    Exchange selectByPrimaryKey(Integer exchangeId);

    int updateByPrimaryKeySelective(Exchange record);

	List<Exchange> findExchangeAll();
}