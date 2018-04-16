package com.service;

import java.util.List;

import com.model.Transfer;

public interface TransferService {

	List<Transfer> findTransferAll(String transferType);

	Transfer findSingleTransfer(Integer id);

	int addTransfer(Transfer obj);

	int updateTransfer(Transfer obj);

	int deleteTransfer(Integer id);
}
