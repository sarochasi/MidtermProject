package com.skilldistillery.springfit.data;

import com.skilldistillery.springfit.entities.Nutrition;

public interface NutritionDAO {
	
	public Nutrition addNutrition(Nutrition nutrition);
	
	public Nutrition findByNutritionId(int id);

}
