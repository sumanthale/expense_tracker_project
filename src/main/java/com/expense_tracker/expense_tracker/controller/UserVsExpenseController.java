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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.expense_tracker.expense_tracker.model.Expense;
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

	@GetMapping("/userVsExp")
	public String userVsExp(ModelMap model) {
		User user = (User) model.getAttribute("user");
		 List<Expense> findAll = expenserepo.findExpensesOfUser(user.getId());
		//List<Expense> findAll = user.getExpenses();
		 System.out.println(findAll);
		if (findAll.size() < 1 || findAll == null) {
			model.put("noExpFound", "Add at least one Expense");
			return "landing_page";
		}
		int sumOfExp = expenserepo.getSumOfExp(user.getId());
		model.put("exp", sumOfExp);
		model.put("inc", user.getIncome());
		return "userVsExp_page";

	}

	@GetMapping("/dummy")
	public String userVsExp() {

		return "dummy";

	}

	@GetMapping("/category")
	public String singleCato(@RequestParam("name") String category, ModelMap map) {
		User user = (User) map.getAttribute("user");

		map.put("expenseCategory", category);
		List<Expense> findByCategory = expenserepo.findByCategory(category, user.getId());

		map.put("expenseCategoryList", findByCategory);
		System.out.println(findByCategory);

		return "single_expense";

	}

	@RequestMapping(value = "/deleteCategoryExpense", method = RequestMethod.GET)
	public String deleteExpense(@RequestParam int id) {

		Expense expense = expenserepo.findById(id).orElse(new Expense());

		expenserepo.deleteById(id);

		return "redirect:/category?name=" + expense.getCategory();
	}

	@RequestMapping(value = "/updateCategoryExpense", method = RequestMethod.GET)
	public String updateTodoPage(@RequestParam int id, ModelMap modelMap) {

		Expense expense = expenserepo.findById(id).orElse(new Expense());
		modelMap.put("newExpense", expense);
		expenserepo.deleteById(id);
		return "updateCategoryExp";
	}

	@PostMapping("/verifyCategoryExpense")
	public String save(@ModelAttribute("newExpense") @Valid Expense expense, BindingResult result, ModelMap model) {
		User user = (User) model.getAttribute("user");

		expense.setUser(user);
		System.out.println(result);
		if (result.hasErrors()) {
			return "updateCategoryExp";
		}

		expenserepo.save(expense);

		return "redirect:/category?name=" + expense.getCategory();
	}

}
