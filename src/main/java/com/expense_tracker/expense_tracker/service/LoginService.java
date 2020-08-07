package com.expense_tracker.expense_tracker.service;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.expense_tracker.expense_tracker.model.User;

@Service
public class LoginService {

	public int checkUser(List<User> list, String email, String password) {

		for (User user : list) {
			if (email.equalsIgnoreCase(user.getEmail()) && password.equalsIgnoreCase(user.getPassword())) {

				return user.getId();
			}
		}
		return 0;
	}

	public String getYear() {

		Date date = new Date();
		int i = date.getYear() + 1900;
		String str = String.valueOf(i);
		return str;

	}
}
