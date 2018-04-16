package com.service.impl;

import com.dao.ChargeMapper;
import com.model.Charge;
import com.service.ChargeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ChargeServiceImpl implements ChargeService {

    @Resource
    private ChargeMapper chargeMapper;

    @Override
    public List<Charge> findChargeAll() {
        return chargeMapper.findChargeAll();
    }

    @Override
    public Charge findSingleCharge(Integer id) {
        return chargeMapper.selectByPrimaryKey(id);
    }

    @Override
    public int addCharge(Charge obj) {
        return chargeMapper.insertSelective(obj);
    }

    @Override
    public int updateCharge(Charge obj) {
        return chargeMapper.updateByPrimaryKeySelective(obj);
    }

    @Override
    public int deleteCharge(Integer id) {
        return chargeMapper.deleteByPrimaryKey(id);
    }
}
