package com.expense_tracker.expense_tracker.dao;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.expense_tracker.expense_tracker.model.Category;
import com.expense_tracker.expense_tracker.model.Expense;
import com.expense_tracker.expense_tracker.model.User;
import com.expense_tracker.expense_tracker.repository.ExpenseRepository;
import com.expense_tracker.expense_tracker.repository.UserRepository;

@Repository
@Transactional
public class UserDao {

	@Autowired
	ExpenseRepository expenserepo;
	@Autowired
	UserRepository userrepo;
	@Autowired
	EntityManager em;

	public void insertExpense() {

		User user = userrepo.findById(5).orElse(new User());
		Expense expense = new Expense("water", 10, "start bucks water", new Date(), Category.FOOD);
		user.addExpense(expense);
		expense.setUser(user);
		expenserepo.save(expense);
	}

	public void getuserexp(int id) {

		User findById = userrepo.findById(id).orElse(new User());
		System.out.println(findById.getExpenses().toString());
	}

}
