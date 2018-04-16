package com.dao;

import java.util.List;

import com.model.Charge;

public interface ChargeMapper {
    int deleteByPrimaryKey(Integer chargeId);

    int insertSelective(Charge record);

    Charge selectByPrimaryKey(Integer chargeId);

    int updateByPrimaryKeySelective(Charge record);

	List<Charge> findChargeAll();
}