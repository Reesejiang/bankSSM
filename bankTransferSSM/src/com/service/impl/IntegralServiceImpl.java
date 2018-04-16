package com.service.impl;

import com.dao.IntegralMapper;
import com.model.Integral;
import com.service.IntegralService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class IntegralServiceImpl implements IntegralService {

    @Resource
    private IntegralMapper integralMapper;

    @Override
    public List<Integral> findIntegralAll() {
        return integralMapper.findIntegralAll();
    }

    @Override
    public Integral findSingleIntegral(Integer id) {
        return integralMapper.selectByPrimaryKey(id);
    }

    @Override
    public int addIntegral(Integral obj) {
        return integralMapper.insertSelective(obj);
    }

    @Override
    public int updateIntegral(Integral obj) {
        return integralMapper.updateByPrimaryKeySelective(obj);
    }

    @Override
    public int deleteIntegral(Integer id) {
        return integralMapper.deleteByPrimaryKey(id);
    }

	@Override
	public List<Integral> findIntegralAllByUid(Integer uid) {
		return integralMapper.findIntegralAllByUid(uid);
	}
}
