package com.service;

import java.util.List;

import com.model.Integral;

public interface IntegralService {

	List<Integral> findIntegralAll();

	Integral findSingleIntegral(Integer id);

	int addIntegral(Integral obj);

	int updateIntegral(Integral obj);

	int deleteIntegral(Integer id);

	List<Integral> findIntegralAllByUid(Integer uid);
}
