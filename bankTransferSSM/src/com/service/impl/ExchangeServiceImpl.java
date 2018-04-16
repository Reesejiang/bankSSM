package com.service.impl;

import com.dao.ExchangeMapper;
import com.model.Exchange;
import com.service.ExchangeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ExchangeServiceImpl implements ExchangeService {

    @Resource
    private ExchangeMapper exchangeMapper;

    @Override
    public List<Exchange> findExchangeAll() {
        return exchangeMapper.findExchangeAll();
    }

    @Override
    public Exchange findSingleExchange(Integer id) {
        return exchangeMapper.selectByPrimaryKey(id);
    }

    @Override
    public int addExchange(Exchange obj) {
        return exchangeMapper.insertSelective(obj);
    }

    @Override
    public int updateExchange(Exchange obj) {
        return exchangeMapper.updateByPrimaryKeySelective(obj);
    }

    @Override
    public int deleteExchange(Integer id) {
        return exchangeMapper.deleteByPrimaryKey(id);
    }
}
