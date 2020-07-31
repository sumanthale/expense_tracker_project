package com.expense_tracker.expense_tracker.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String email;
	private String password;
	private int income;
	@OneToMany(mappedBy = "user")
	private List<Expense> expenses = new ArrayList<Expense>();

	public User() {
	}

	public User(String name, String email, String password, int income) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.income = income;
	}

	public String getName() {
		return name;
	}

	public void addExpense(Expense expense) {
		expenses.add(expense);
	}

	public void removeExpense(Expense expense) {
		expenses.remove(expense);
	}

	public List<Expense> getExpenses() {
		return expenses;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getIncome() {
		return income;
	}

	public void setIncome(int income) {
		this.income = income;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", income="
				+ income + "]";
	}

}
