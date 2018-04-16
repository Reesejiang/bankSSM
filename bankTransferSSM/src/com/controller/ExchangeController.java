package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Exchange;
import com.service.ExchangeService;

@Controller
@RequestMapping("/exchange")
public class ExchangeController {

	@Autowired
	private ExchangeService exchangeService;
	
	@RequestMapping("/findExchangeAll")
	public String findExchangeAll(HttpServletRequest request) {
		List<Exchange> exchangeList = exchangeService.findExchangeAll();
		request.setAttribute("exchangeList", exchangeList);
		return "/exchange_list";
	}

	@RequestMapping("/beforeAddOrUpdateExchange")
	public String beforeAddOrUpdateExchange(Integer exchangeId, HttpServletRequest request) {
		Exchange exchange = new Exchange();
		if (exchangeId != null && !exchangeId.equals("")) {
			exchange = exchangeService.findSingleExchange(exchangeId);
		}
		request.setAttribute("exchange", exchange);
		return "/exchange_addOrEdit";
	}

	@RequestMapping("/addOrUpdateExchange")
	public String addOrUpdateExchange(Exchange exchange) {
		if(exchange.getExchangeId()==null){
			exchangeService.addExchange(exchange);
		}else{
			exchangeService.updateExchange(exchange);
		}
		return "redirect:/exchange/findExchangeAll";
	}

	@RequestMapping("/deleteExchange")
	public String deleteExchange(Integer exchangeId) {
		exchangeService.deleteExchange(exchangeId);
		return "redirect:/exchange/findExchangeAll";
	}
}
