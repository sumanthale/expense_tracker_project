package com.expense_tracker.expense_tracker.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.expense_tracker.expense_tracker.model.Expense;

public interface ExpenseRepository extends JpaRepository<Expense, Integer>{

}
