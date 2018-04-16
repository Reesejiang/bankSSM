package com.service.impl;

import com.dao.TransferMapper;
import com.model.Transfer;
import com.service.TransferService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TransferServiceImpl implements TransferService {

    @Resource
    private TransferMapper transferMapper;

    @Override
    public List<Transfer> findTransferAll(String transferType) {
        return transferMapper.findTransferAll(transferType);
    }

    @Override
    public Transfer findSingleTransfer(Integer id) {
        return transferMapper.selectByPrimaryKey(id);
    }

    @Override
    public int addTransfer(Transfer obj) {
        return transferMapper.insertSelective(obj);
    }

    @Override
    public int updateTransfer(Transfer obj) {
        return transferMapper.updateByPrimaryKeySelective(obj);
    }

    @Override
    public int deleteTransfer(Integer id) {
        return transferMapper.deleteByPrimaryKey(id);
    }
}
