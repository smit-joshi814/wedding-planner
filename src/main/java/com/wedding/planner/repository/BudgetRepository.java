package com.wedding.planner.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wedding.planner.entity.Budget;
import com.wedding.planner.entity.Users;

import java.util.List;


public interface BudgetRepository extends JpaRepository<Budget, Long>{

	List<Budget> findByUser(Users user);
}
