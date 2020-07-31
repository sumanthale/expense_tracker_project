package com.expense_tracker.expense_tracker;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.expense_tracker.expense_tracker.dao.UserDao;

@SpringBootTest
class ExpenseTrackerApplicationTests {

	@Autowired
	UserDao userdao;

	@Test
	void contextLoads() {

		userdao.insertExpense();
	}

}
