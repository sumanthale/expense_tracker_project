package com.expense_tracker.expense_tracker.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
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

	@ModelAttribute("categoryList")
	public Map<String, String> buildState() {

		Map<String, String> map = new HashMap<String, String>();
		map.put("UTILITIES", "UTILITIES");
		map.put("SAVINGS", "SAVINGS");
		map.put("TRANSPORTATION", "TRANSPORTATION");
		map.put("FOOD", "FOOD");
		map.put("DEBT", "DEBT");
		map.put("INSURANCE", "INSURANCE");
		map.put("PERSONAL_CARE", "PERSONAL_CARE");
		map.put("ENTERTAINMENT", "ENTERTAINMENT");
		map.put("SHOPPING", "SHOPPING");
		map.put("EDUCATION", "EDUCATION");
		map.put("MISCELLANEOUS", "MISCELLANEOUS");
		map.put("KIDS", "KIDS");
		map.put("OTHERS", "OTHERS");
		return map;

	}

	@GetMapping("/addExpense")
	public String showAddExpensePage(ModelMap map) {
		
		User user = (User) map.getAttribute("user");
		// Security for the project

		if (user == null || user.getId() == 0) {
			return "redirect:/";
		}
		// end

		map.put("newExpense", new Expense());

		return "addExpense_page2";

	}

	@PostMapping("/verifyExpense")
	public String save(@ModelAttribute("newExpense") @Valid Expense expense, BindingResult result, ModelMap model) {
		User user = (User) model.getAttribute("user");

		expense.setUser(user);
		System.out.println(result);
		if (result.hasErrors()) {
			return "addExpense_page2";
		}

		expenserepo.save(expense);

		return "redirect:/landingPage";
	}

	@GetMapping("/landingPage")
	public String check(ModelMap model) {

		User user = (User) model.getAttribute("user");
		// Security for the project

		if (user == null || user.getId() == 0) {
			return "redirect:/";
		}
		// end

		List<Expense> findExpensesOfUser = expenserepo.findExpensesOfUser(user.getId());
		int FOOD = expenserepo.findTotalcost("FOOD", user.getId());
		int ENTERTAINMENT = expenserepo.findTotalcost("ENTERTAINMENT", user.getId());

		int UTILITIES = expenserepo.findTotalcost("UTILITIES", user.getId());
		int SAVINGS = expenserepo.findTotalcost("SAVINGS", user.getId());
		int DEBT = expenserepo.findTotalcost("DEBT", user.getId());
		int INSURANCE = expenserepo.findTotalcost("INSURANCE", user.getId());
		int PERSONAL_CARE = expenserepo.findTotalcost("PERSONAL_CARE", user.getId());
		int EDUCATION = expenserepo.findTotalcost("EDUCATION", user.getId());
		int SHOPPING = expenserepo.findTotalcost("SHOPPING", user.getId());
		int MISCELLANEOUS = expenserepo.findTotalcost("MISCELLANEOUS", user.getId());
		int KIDS = expenserepo.findTotalcost("KIDS", user.getId());
		int TRANSPORTATION = expenserepo.findTotalcost("TRANSPORTATION", user.getId());
		int OTHERS = expenserepo.findTotalcost("OTHERS", user.getId());

		model.put("FOOD", FOOD);
		model.put("UTILITIES", UTILITIES);
		model.put("SAVINGS", SAVINGS);
		model.put("DEBT", DEBT);
		model.put("INSURANCE", INSURANCE);
		model.put("PERSONAL_CARE", PERSONAL_CARE);
		model.put("ENTERTAINMENT", ENTERTAINMENT);
		model.put("SHOPPING", SHOPPING);
		model.put("EDUCATION", EDUCATION);
		model.put("MISCELLANEOUS", MISCELLANEOUS);
		model.put("KIDS", KIDS);
		model.put("TRANSPORTATION", TRANSPORTATION);
		model.put("OTHERS", OTHERS);

		model.put("expenseList", findExpensesOfUser);
		return "landing_page";
	}

	@GetMapping(value = "/deleteExpense")
	public String deleteExpense(@RequestParam int id, ModelMap model) {
		// Security for the project

		User user = (User) model.getAttribute("user");
		if (user == null || user.getId() == 0) {
			System.out.println("Null user");
			return "redirect:/";
		}
		// end

		expenserepo.deleteById(id);

		return "redirect:/landingPage";
	}

	@GetMapping(value = "/updateExpense")
	public String updateExpense(@RequestParam int id, ModelMap modelMap) {

		User user = (User) modelMap.getAttribute("user");
		// Security for the project
		if (user == null || user.getId() == 0) {
			System.out.println("Null user");
			return "redirect:/";
		}
		// end
		Expense expense = expenserepo.findById(id).orElse(new Expense());
		modelMap.put("newExpense", expense);
		expenserepo.deleteById(id);
		return "addExpense_page2";
	}

	@GetMapping("/expenseByDate")
	public String expenseBYDate(ModelMap map) {
		// Security for the project

		User user = (User) map.getAttribute("user");
		if (user == null || user.getId() == 0) {
			System.out.println("Null user");
			return "redirect:/";
		}
		// end
		
		map.put("addedDate", new Expense());

		return "expenses_by_date";
	}

	@PostMapping("/getExpenseByDate")
	public String expenseBYDate2(@ModelAttribute("addedDate") @Valid Expense expense, BindingResult result,
			ModelMap map) {

		System.out.println(expense.getDate());

		User user = (User) map.getAttribute("user");
		//security
		if (user == null || user.getId() == 0) {
			System.out.println("Null user");
			return "redirect:/";
		}
		// end

		List<Expense> findByDate = expenserepo.findByDate(expense.getDate(), user.getId());

		System.out.println(findByDate);
		map.put("added_date", expense.getDate());
		map.put("dateList", findByDate);
		System.out.println(findByDate.size());
		if (findByDate.size() == 0) {
			map.put("NoExpenseOnDate", "No expense Found on this date");
		}

		return "expenses_by_date";
	}


}
