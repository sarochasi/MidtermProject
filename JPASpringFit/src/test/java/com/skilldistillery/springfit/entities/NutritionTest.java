package com.skilldistillery.springfit.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class NutritionTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Nutrition nutrition;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPASpringFit");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em=emf.createEntityManager();
		nutrition = em.find(Nutrition.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		nutrition = null;
	}

	@Test
	void test_Nutrition_entity_mapping() {
		assertNotNull(nutrition);
		assertEquals("Meal 1", nutrition.getName());

	}
	

		
	
	
	@Test
	void test_Workout_User_Many_To_One_mapping() {
		assertNotNull(nutrition.getUser());
		assertEquals("na", nutrition.getUser().getFirstName());
	}
	

	


}
