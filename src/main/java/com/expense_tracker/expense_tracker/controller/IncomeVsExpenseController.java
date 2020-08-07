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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.expense_tracker.expense_tracker.model.Expense;
import com.expense_tracker.expense_tracker.model.User;
import com.expense_tracker.expense_tracker.repository.ExpenseRepository;
import com.expense_tracker.expense_tracker.repository.UserRepository;
import com.expense_tracker.expense_tracker.service.LoginService;

@Controller

@SessionAttributes("user")
public class IncomeVsExpenseController {

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
		// Security for the project

		if (user == null || user.getId() == 0) {
			return "redirect:/";
		}
		// end
		List<Expense> findAll = expenserepo.findExpensesOfUser(user.getId());
		System.out.println(findAll);
		if (findAll.size() < 1 || findAll == null) {
			model.put("noExpFound", "Add at least one Expense");
			return "landing_page";
		}
		LoginService service = new LoginService();

		String year = service.getYear();
		String month = service.getMonth();
		System.out.println(year + " vs" + month);
		int thismonth = expenserepo.findByMonth(year + "-" + month + "-01", year + "-" + month + "-31", user.getId());
		// int sumOfExp = expenserepo.getSumOfExp(user.getId());
		String monthName = service.getMonthName();
		model.put("curMon", monthName);
		model.put("exp", thismonth);
		model.put("inc", user.getIncome());
		return "userVsExp_page";

	}

	@GetMapping("/category")
	public String singleCato(@RequestParam("name") String category, ModelMap map) {
		User user = (User) map.getAttribute("user");
		// Security for the project

		if (user == null || user.getId() == 0) {
			return "redirect:/";
		}
		// end

		map.put("expenseCategory", category.substring(0, 1) + category.substring(1).toLowerCase());
		List<Expense> findByCategory = expenserepo.findByCategory(category, user.getId());

		map.put("expenseCategoryList", findByCategory);
		System.out.println(findByCategory);

		return "single_expense";

	}

	@GetMapping(value = "/deleteCategoryExpense")
	public String deleteExpense(@RequestParam int id, ModelMap model) {
		// security
		User user = (User) model.getAttribute("user");
		if (user == null || user.getId() == 0) {
			return "redirect:/";
		}
//end
		Expense expense = expenserepo.findById(id).orElse(new Expense());

		expenserepo.deleteById(id);

		return "redirect:/category?name=" + expense.getCategory();
	}

	@GetMapping(value = "/updateCategoryExpense")
	public String updateTodoPage(@RequestParam int id, ModelMap model) {
		// security
		User user = (User) model.getAttribute("user");
		if (user == null || user.getId() == 0) {
			return "redirect:/";
		}
//end

		Expense expense = expenserepo.findById(id).orElse(new Expense());
		model.put("newExpense", expense);
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

	@GetMapping("/allYearExpense")
	public String year(ModelMap model) {
		User user = (User) model.getAttribute("user");
		// security
		if (user == null || user.getId() == 0) {
			return "redirect:/";
		}
//end
		String str = new LoginService().getYear();
		model.put("year", str);
		int january = expenserepo.findByMonth(str + "-01-01", str + "-01-31", user.getId());
		int feburary = expenserepo.findByMonth(str + "-02-01", str + "-02-29", user.getId());

		int march = expenserepo.findByMonth(str + "-03-01", str + "-03-31", user.getId());
		int april = expenserepo.findByMonth(str + "-04-01", str + "-04-30", user.getId());
		int may = expenserepo.findByMonth(str + "-05-01", str + "-05-31", user.getId());
		int june = expenserepo.findByMonth(str + "-06-01", str + "-06-30", user.getId());
		int july = expenserepo.findByMonth(str + "-07-01", str + "-07-31", user.getId());
		int august = expenserepo.findByMonth(str + "-08-01", str + "-08-31", user.getId());
		int september = expenserepo.findByMonth(str + "-09-01", str + "-09-30", user.getId());
		int october = expenserepo.findByMonth(str + "-10-01", str + "-10-31", user.getId());
		int november = expenserepo.findByMonth(str + "-11-01", str + "-11-30", user.getId());
		int december = expenserepo.findByMonth(str + "-12-01", str + "-12-31", user.getId());

		model.put("january", january);
		model.put("feburary", feburary);
		model.put("march", march);
		model.put("april", april);
		model.put("may", may);
		model.put("june", june);
		model.put("july", july);
		model.put("august", august);
		model.put("september", september);
		model.put("october", october);
		model.put("november", november);
		model.put("december", december);

		return "across_year";

	}

}
