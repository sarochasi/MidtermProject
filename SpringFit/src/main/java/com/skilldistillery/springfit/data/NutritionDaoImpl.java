package com.skilldistillery.springfit.data;

import org.springframework.stereotype.Repository;

import com.skilldistillery.springfit.entities.Nutrition;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Transactional
@Repository
public class NutritionDaoImpl implements NutritionDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Nutrition findByNutritionId(int id) {
		return em.find(Nutrition.class, id);
	}
	
	// SELECT * FROM nutrition WHERE user_id = 1;
	// String jpql = "SELECT n FROM Nutrition n WHERE n.user.id = :userId";

	
	
	@Override
	public Nutrition addNutrition(Nutrition nutrition) {
		em.persist(nutrition);
		return nutrition;
	}

	
	

}


