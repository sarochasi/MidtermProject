package com.skilldistillery.springfit.data;

import java.util.List;

import com.skilldistillery.springfit.entities.BodyWeight;
import com.skilldistillery.springfit.entities.User;

public interface BodyWeightDAO {
	
	public BodyWeight createNewBodyWeight(BodyWeight bodyWeight, int userId);
	

	public List<BodyWeight> showAllBodyWeightsForUser(User user);
	
	
	
}
