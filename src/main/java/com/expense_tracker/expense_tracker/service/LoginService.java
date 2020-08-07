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

	public String getMonth() {
		Date date = new Date();
		int i = date.getMonth() + 1;
		String str = String.valueOf(i);
		return str;
	}

	public String getMonthName() {
		switch (getMonth()) {
		case "1":

			return "January";
		case "2":

			return "Febuary";
		case "3":

			return "March";
		case "4":

			return "April";
		case "5":

			return "May";
		case "6":

			return "June";
		case "7":

			return "July";
		case "8":

			return "August";
		case "9":

			return "September";
		case "10":

			return "October";
		case "11":

			return "November";
		case "12":

			return "December";

		default:
			return "Null";
		}

	}
}
