package com.expense_tracker.expense_tracker.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.expense_tracker.expense_tracker.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	Optional<User>  findByEmail(String email);

	@Query(value = "UPDATE user SET  name = :name , email = :email , password = :password , income = :income   WHERE id  = :id", nativeQuery = true)
	void updateUser(@Param("name") String name, @Param("email") String email,@Param("password") String password, @Param("income") int income,@Param("id") int id);

}
