package com.skilldistillery.springfit.data;

import java.util.List;

import com.skilldistillery.springfit.entities.Nutrition;

public interface NutritionDAO {
	
	public Nutrition addNutrition(Nutrition nutrition);
	
	public List<Nutrition> findAllByUser(int userId);

	public List<Nutrition> showAllNutrition();

}