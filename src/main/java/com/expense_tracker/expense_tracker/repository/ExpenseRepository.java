package com.expense_tracker.expense_tracker.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.expense_tracker.expense_tracker.model.Expense;

public interface ExpenseRepository extends JpaRepository<Expense, Integer> {

	List<Expense> findByUser(int id);

	@Query(value = "SELECT * FROM expense WHERE user_id = :id  order by date desc , id desc", nativeQuery = true)
	List<Expense> findExpensesOfUser(@Param("id") int user_id);

	@Query(value = "SELECT sum(cost) FROM expense where user_id = :id ", nativeQuery = true)
	int getSumOfExp(@Param("id") int user_id);

	@Query(value = "SELECT COALESCE(SUM(cost), 0)FROM expense WHERE category = :category and user_id = :id", nativeQuery = true)
	int findTotalcost(@Param("category") String category, @Param("id") int user_id);

	@Query(value = "SELECT * FROM expense WHERE category = :category and user_id = :id", nativeQuery = true)
	List<Expense> findByCategory(@Param("category") String category, @Param("id") int user_id);

	@Query(value = "SELECT * FROM expense WHERE  date =:date and user_id = :id order by date desc , id desc", nativeQuery = true)
	List<Expense> findByDate(@Param("date") Date date, @Param("id") int user_id);

	@Query(value = "SELECT COALESCE(SUM(cost), 0)FROM expense WHERE date BETWEEN   :start  and :end and user_id = :id", nativeQuery = true)
	int findByMonth(@Param("start") String start, @Param("end") String end, @Param("id") int user_id);

}
