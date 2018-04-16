package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.Account;
import com.model.Transfer;
import com.service.AccountService;
import com.service.TransferService;

@Controller
@RequestMapping("/transfer")
public class TransferController {

	@Autowired
	private TransferService transferService;
	
	@Autowired
	private AccountService accountService;
	
	@RequestMapping("/findTransferAll")
	//转账日志
	public String findTransferAll(@RequestParam(value="transferType",required=true,defaultValue="1")String transferType,HttpServletRequest request) {
		List<Transfer> transferList = transferService.findTransferAll(transferType);
		request.setAttribute("transferList", transferList);
		request.setAttribute("transferType", transferType);
		return "/transfer_list";
	}

	@RequestMapping("/beforeAddOrUpdateTransfer")
	public String beforeAddOrUpdateTransfer(Integer transferId, HttpServletRequest request) {
		Transfer transfer = new Transfer();
		if (transferId != null && !transferId.equals("")) {
			transfer = transferService.findSingleTransfer(transferId);
		}
		request.setAttribute("transfer", transfer);
		return "/transfer_addOrEdit";
	}

	@RequestMapping("/addOrUpdateTransfer")
	public String addOrUpdateTransfer(Transfer transfer) {
		if(transfer.getTransferId()==null){
			transferService.addTransfer(transfer);
		}else{
			transferService.updateTransfer(transfer);
		}
		return "redirect:/transfer/findTransferAll";
	}
	
	@RequestMapping("/addTransfer")
	public String addTransfer(Transfer transfer,HttpServletRequest request) {
		//核对用户信息
		if("1".equals(transfer.getTransferType())){
			Account account = accountService.findSingleAccount(transfer.getAccountId());
			Double balance =  account.getBalance()!=null?account.getBalance():0;
			account.setBalance(balance+transfer.getTransferAmount());
			
			//计算积分
			int ii = (int)Math.rint(transfer.getTransferAmount()*0.1);
			
			Integer integralNum = account.getIntegralNum()!=null?account.getIntegralNum():0;
			//累计积分
			account.setIntegralNum(integralNum+ii);
			accountService.updateAccount(account);
			
			transfer.setAccountBalance(account.getBalance());
			transfer.setLocation("现场");
			transfer.setActualAmount(transfer.getTransferAmount());
			transferService.addTransfer(transfer);
			
			request.setAttribute("msg", "存款成功！！！");
			return "/transfer1";	
		}else if("2".equals(transfer.getTransferType())){
			
			Account account = accountService.findSingleAccount(transfer.getAccountId());
			Double balance =  account.getBalance()!=null?account.getBalance():0;
			account.setBalance(balance-transfer.getTransferAmount());
			
			int ii = (int)Math.rint(transfer.getTransferAmount()*0.1);
			Integer integralNum = account.getIntegralNum()!=null?account.getIntegralNum():0;
			account.setIntegralNum(integralNum+ii);
			accountService.updateAccount(account);
			
			transfer.setAccountBalance(account.getBalance());
			transfer.setLocation("现场");
			transfer.setActualAmount(transfer.getTransferAmount());
			transferService.addTransfer(transfer);
			
			request.setAttribute("msg", "取款成功！！！");
			return "/transfer2";
		}else if("3".equals(transfer.getTransferType())){
			
			// 更新汇款人信息
			Account account = accountService.findSingleAccount(transfer.getAccountId());
			Double balance =  account.getBalance()!=null?account.getBalance():0;
			account.setBalance(balance-transfer.getTransferAmount()-transfer.getChargePrice());
			
			int ii = (int)Math.rint(transfer.getTransferAmount()*0.1);
			Integer integralNum = account.getIntegralNum()!=null?account.getIntegralNum():0;
			account.setIntegralNum(integralNum+ii);
			accountService.updateAccount(account);
			
			// 更新汇款人信息
			Account payeeAccount = accountService.findSingleAccount(transfer.getPayeeAccountId());
			Double payeeBalance =  payeeAccount.getBalance()!=null?payeeAccount.getBalance():0;
			payeeAccount.setBalance(payeeBalance+transfer.getTransferAmount());
			accountService.updateAccount(payeeAccount);
			
			// 增加汇款记录
			transfer.setAccountBalance(account.getBalance());
			transfer.setPayeeAccountBalance(payeeAccount.getBalance());
			transfer.setLocation("现场");
			transfer.setActualAmount(transfer.getTransferAmount());
			transferService.addTransfer(transfer);
			
			request.setAttribute("msg", "行内汇款成功！！！");
			return "/transfer3";
		}else if("4".equals(transfer.getTransferType())){
			// 更新汇款人信息
			Account account = accountService.findSingleAccount(transfer.getAccountId());
			Double balance =  account.getBalance()!=null?account.getBalance():0;
			account.setBalance(balance-transfer.getTransferAmount()-transfer.getChargePrice());
			//手续费	
			int ii = (int)Math.rint(transfer.getTransferAmount()*0.1);
			Integer integralNum = account.getIntegralNum()!=null?account.getIntegralNum():0;
			account.setIntegralNum(integralNum+ii);
			accountService.updateAccount(account);
					
			// 更新汇款人信息
			Account payeeAccount = accountService.findSingleAccount(transfer.getPayeeAccountId());
			Double payeeBalance =  payeeAccount.getBalance()!=null?payeeAccount.getBalance():0;
			payeeAccount.setBalance(payeeBalance+transfer.getTransferAmount());
			accountService.updateAccount(payeeAccount);
						
			// 增加汇款记录
			transfer.setAccountBalance(account.getBalance());
			transfer.setPayeeAccountBalance(payeeAccount.getBalance());
			transfer.setLocation("现场");
			transfer.setActualAmount(transfer.getTransferAmount());
			transferService.addTransfer(transfer);
						
			request.setAttribute("msg", "跨行汇款成功！！！");
			return "/transfer4";
		}else{
			// 更新汇款人信息
			Account account = accountService.findSingleAccount(transfer.getAccountId());
			Double balance =  account.getBalance()!=null?account.getBalance():0;
			//汇率
			account.setBalance(balance-transfer.getTransferAmount()/0.023-transfer.getChargePrice());
								
			int ii = (int)Math.rint(transfer.getTransferAmount()*0.1);
			Integer integralNum = account.getIntegralNum()!=null?account.getIntegralNum():0;
			account.setIntegralNum(integralNum+ii);
			accountService.updateAccount(account);
							
			// 更新汇款人信息
			Account payeeAccount = accountService.findSingleAccount(transfer.getPayeeAccountId());
			Double payeeBalance =  payeeAccount.getBalance()!=null?payeeAccount.getBalance():0;
			payeeAccount.setBalance(payeeBalance+transfer.getTransferAmount()/0.023);
			accountService.updateAccount(payeeAccount);
									
			// 增加汇款记录
			transfer.setAccountBalance(account.getBalance());
			transfer.setPayeeAccountBalance(payeeAccount.getBalance());
			transfer.setLocation("现场");
			transfer.setActualAmount(transfer.getTransferAmount()/0.023);
			transferService.addTransfer(transfer);
						
			request.setAttribute("msg", "多币种汇款成功！！！");
			return "/transfer5";
		}
	}

	@RequestMapping("/deleteTransfer")
	public String deleteTransfer(Integer transferId) {
		transferService.deleteTransfer(transferId);
		//页面重定向
		return "redirect:/transfer/findTransferAll";
	}
}
