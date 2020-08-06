package com.expense_tracker.expense_tracker;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;

import com.expense_tracker.expense_tracker.dao.UserDao;

@SpringBootTest
class ExpenseTrackerApplicationTests {

	@Autowired
	UserDao userdao;
	@Autowired
	JdbcTemplate template;
	@Test
	void contextLoads() {

//		userdao.insertExpense();
		userdao.getuserexp(1);
		
		
	}

}
