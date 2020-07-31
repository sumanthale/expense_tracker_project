package com.expense_tracker.expense_tracker.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.expense_tracker.expense_tracker.model.User;
import com.expense_tracker.expense_tracker.repository.UserRepository;
import com.expense_tracker.expense_tracker.service.LoginService;

@Controller
public class UserController {

	@Autowired
	UserRepository userrepo;
	@Autowired
	LoginService loginservice;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		StringTrimmerEditor trim = new StringTrimmerEditor(true);
		binder.registerCustomEditor(String.class, trim);
	}

	@GetMapping("/")
	public String showLogin() {
		return "login_page";

	}

	@PostMapping("/verifyLogin")
	public String save(@RequestParam String email, @RequestParam String password, ModelMap model) {

		int logged_in_user_id = loginservice.checkUser(userrepo.findAll(), email, password);
		if (logged_in_user_id == 0) {
			model.put("error", "(*) Email  and password doesn't Match");
			return "login_page";

		}
		User user = userrepo.findById(logged_in_user_id).orElse(new User());

		model.put("user", user);
		return "landing_page";
	}

	@GetMapping("/signUpForm")
	public String showSignupPage(ModelMap model) {
		model.put("newUser", new User());
		return "signup_page";
	}

	@PostMapping("/verifySignup")
	public String verifySignUp(@ModelAttribute("newUser") @Valid User user, BindingResult result) {
		System.out.println(result);
		if (result.hasErrors()) {
			return "signup_page";
		}
		userrepo.save(user);
		return "redirect:/";
	}

	@GetMapping("/check")
	public String check() {
		return "dummy";
	}
}
