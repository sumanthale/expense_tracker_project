package com.expense_tracker.expense_tracker.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.expense_tracker.expense_tracker.model.User;
import com.expense_tracker.expense_tracker.repository.ExpenseRepository;
import com.expense_tracker.expense_tracker.repository.UserRepository;

@Controller

@SessionAttributes("user")
public class UserVsExpenseController {

	@Autowired
	UserRepository userrepo;
	@Autowired
	ExpenseRepository expenserepo;

	@GetMapping("/userVsExp")
	public String userVsExp(ModelMap model) {
		User user = (User) model.getAttribute("user");
		
		int sumOfExp = expenserepo.getSumOfExp(user.getId());
		model.put("sum", sumOfExp);
		return "userVsExp_page";

	}
	@GetMapping("/dummy")
	public String userVsExp() {
	
		return "dummy";

	}
	
	
	
	

}
