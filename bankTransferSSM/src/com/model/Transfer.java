package com.model;

import java.util.Date;

public class Transfer {
	private Integer transferId;

	private String transferName;

	private Integer accountId;

	private String accountName;

	private String accountCode;

	private Integer payeeAccountId;

	private String payeeAccountName;

	private String payeeAccountCode;

	private String currencyType;

	private Double actualAmount;

	private Double transferAmount;

	private Double exchangeRate;

	private Double chargePrice;

	private Date transferDate;

	private String transferType;

	private Double accountBalance;

	private Double payeeAccountBalance;

	private String isBank;

	private String location;

	public Integer getTransferId() {
		return transferId;
	}

	public void setTransferId(Integer transferId) {
		this.transferId = transferId;
	}

	public String getTransferName() {
		return transferName;
	}

	public void setTransferName(String transferName) {
		this.transferName = transferName == null ? null : transferName.trim();
	}

	public Integer getAccountId() {
		return accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	public Integer getPayeeAccountId() {
		return payeeAccountId;
	}

	public void setPayeeAccountId(Integer payeeAccountId) {
		this.payeeAccountId = payeeAccountId;
	}

	public String getCurrencyType() {
		return currencyType;
	}

	public void setCurrencyType(String currencyType) {
		this.currencyType = currencyType == null ? null : currencyType.trim();
	}

	public Double getActualAmount() {
		return actualAmount;
	}

	public void setActualAmount(Double actualAmount) {
		this.actualAmount = actualAmount;
	}

	public Double getTransferAmount() {
		return transferAmount;
	}

	public void setTransferAmount(Double transferAmount) {
		this.transferAmount = transferAmount;
	}

	public Double getExchangeRate() {
		return exchangeRate;
	}

	public void setExchangeRate(Double exchangeRate) {
		this.exchangeRate = exchangeRate;
	}

	public Double getChargePrice() {
		return chargePrice;
	}

	public void setChargePrice(Double chargePrice) {
		this.chargePrice = chargePrice;
	}

	public Date getTransferDate() {
		return transferDate;
	}

	public void setTransferDate(Date transferDate) {
		this.transferDate = transferDate;
	}

	public String getTransferType() {
		return transferType;
	}

	public void setTransferType(String transferType) {
		this.transferType = transferType == null ? null : transferType.trim();
	}

	public Double getAccountBalance() {
		return accountBalance;
	}

	public void setAccountBalance(Double accountBalance) {
		this.accountBalance = accountBalance;
	}

	public Double getPayeeAccountBalance() {
		return payeeAccountBalance;
	}

	public void setPayeeAccountBalance(Double payeeAccountBalance) {
		this.payeeAccountBalance = payeeAccountBalance;
	}

	public String getIsBank() {
		return isBank;
	}

	public void setIsBank(String isBank) {
		this.isBank = isBank == null ? null : isBank.trim();
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getAccountCode() {
		return accountCode;
	}

	public void setAccountCode(String accountCode) {
		this.accountCode = accountCode;
	}

	public String getPayeeAccountName() {
		return payeeAccountName;
	}

	public void setPayeeAccountName(String payeeAccountName) {
		this.payeeAccountName = payeeAccountName;
	}

	public String getPayeeAccountCode() {
		return payeeAccountCode;
	}

	public void setPayeeAccountCode(String payeeAccountCode) {
		this.payeeAccountCode = payeeAccountCode;
	}

}