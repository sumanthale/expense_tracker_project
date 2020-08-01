package com.expense_tracker.expense_tracker.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

@Entity
public class Expense {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@NotNull(message = "don't leave empty")
	private String name;
	@Min(value = 1, message = " should be positive")
	private int cost;
	private String description;
	private Date date=new Date();
	@ManyToOne(fetch = FetchType.LAZY)
	private User user;
	@Enumerated(EnumType.STRING)
	private Category category;

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Expense() {
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getDate() {
		return date;
	}



	@Override
	public String toString() {
		return "Expense [id=" + id + ", name=" + name + ", cost=" + cost + ", description=" + description + ", date="
				+ date + ", category=" + category + "]";
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Expense(String name, int cost, String description, Date date, Category category) {
		super();
		this.name = name;
		this.cost = cost;
		this.description = description;
		this.date = date;
		this.category = category;
	}

}
