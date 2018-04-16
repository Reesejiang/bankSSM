package com.service;

import java.util.List;

import com.model.Charge;

public interface ChargeService {

	List<Charge> findChargeAll();

	Charge findSingleCharge(Integer id);

	int addCharge(Charge obj);

	int updateCharge(Charge obj);

	int deleteCharge(Integer id);
}
