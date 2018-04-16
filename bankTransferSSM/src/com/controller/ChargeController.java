package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Charge;
import com.service.ChargeService;

@Controller
@RequestMapping("/charge")
public class ChargeController {

	@Autowired
	private ChargeService chargeService;
	
	@RequestMapping("/findChargeAll")
	public String findChargeAll(HttpServletRequest request) {
		List<Charge> chargeList = chargeService.findChargeAll();
		request.setAttribute("chargeList", chargeList);
		return "/charge_list";
	}

	@RequestMapping("/beforeAddOrUpdateCharge")
	public String beforeAddOrUpdateCharge(Integer chargeId, HttpServletRequest request) {
		Charge charge = new Charge();
		if (chargeId != null && !chargeId.equals("")) {
			charge = chargeService.findSingleCharge(chargeId);
		}
		request.setAttribute("charge", charge);
		return "/charge_addOrEdit";
	}

	@RequestMapping("/addOrUpdateCharge")
	public String addOrUpdateCharge(Charge charge) {
		if(charge.getChargeId()==null){
			chargeService.addCharge(charge);
		}else{
			chargeService.updateCharge(charge);
		}
		return "redirect:/charge/findChargeAll";
	}

	@RequestMapping("/deleteCharge")
	public String deleteCharge(Integer chargeId) {
		chargeService.deleteCharge(chargeId);
		return "redirect:/charge/findChargeAll";
	}
}
