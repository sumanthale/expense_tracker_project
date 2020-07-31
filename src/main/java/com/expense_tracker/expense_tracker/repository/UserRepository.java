package com.expense_tracker.expense_tracker.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.expense_tracker.expense_tracker.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {

}