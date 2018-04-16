package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.model.Integral;

public interface IntegralMapper {
    int deleteByPrimaryKey(Integer integralId);

    int insertSelective(Integral record);

    Integral selectByPrimaryKey(Integer integralId);

    int updateByPrimaryKeySelective(Integral record);

	List<Integral> findIntegralAll();

	List<Integral> findIntegralAllByUid(@Param("uid")Integer uid);
}