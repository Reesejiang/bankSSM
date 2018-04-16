package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.model.Transfer;

public interface TransferMapper {
    int deleteByPrimaryKey(Integer transferId);

    int insertSelective(Transfer record);

    Transfer selectByPrimaryKey(Integer transferId);

    int updateByPrimaryKeySelective(Transfer record);

	List<Transfer> findTransferAll(@Param("transferType")String transferType);
}