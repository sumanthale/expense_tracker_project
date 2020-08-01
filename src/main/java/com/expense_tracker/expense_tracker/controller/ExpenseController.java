package com.expense_tracker.expense_tracker.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.expense_tracker.expense_tracker.model.Expense;
import com.expense_tracker.expense_tracker.model.User;
import com.expense_tracker.expense_tracker.repository.ExpenseRepository;
import com.expense_tracker.expense_tracker.repository.UserRepository;

@Controller
@SessionAttributes("user")
public class ExpenseController {

	@Autowired
	UserRepository userrepo;
	@Autowired
	ExpenseRepository expenserepo;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		StringTrimmerEditor trim = new StringTrimmerEditor(true);
		binder.registerCustomEditor(String.class, trim);
	}

	@InitBinder
	public void InitBinder(WebDataBinder binder) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");

		binder.registerCustomEditor(Date.class, new CustomDateEditor(simpleDateFormat, false));

	}

	@GetMapping("/addExpense")
	public String showAddExpensePage(ModelMap map) {

		map.put("newExpense", new Expense());

		return "addExpense_page";

	}

	@PostMapping("/verifyExpense")
	public String save(@ModelAttribute("newExpense") @Valid Expense expense, BindingResult result, ModelMap model) {
		User user = (User) model.getAttribute("user");
		System.out.println(user);
		System.out.println(expense);
		System.out.println(expense.getUser());
		expense.setUser(user);
		System.out.println(expense.getUser());
		if (result.hasErrors()) {
			return "addExpense_page";
		}

		expenserepo.save(expense);

		return "redirect:/landingPage";
	}

	@GetMapping("/landingPage")
	public String check(ModelMap model) {
		User user = (User) model.getAttribute("user");
		List<Expense> findExpensesOfUser = expenserepo.findExpensesOfUser(user.getId());

		model.put("expenseList", findExpensesOfUser);
		return "landing_page";
	}

}
