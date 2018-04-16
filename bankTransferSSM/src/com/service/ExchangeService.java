package com.service;

import java.util.List;

import com.model.Exchange;

public interface ExchangeService {

	List<Exchange> findExchangeAll();

	Exchange findSingleExchange(Integer id);

	int addExchange(Exchange obj);

	int updateExchange(Exchange obj);

	int deleteExchange(Integer id);
}
