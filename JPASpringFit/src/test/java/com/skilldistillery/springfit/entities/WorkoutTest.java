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

class WorkoutTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Workout workout;

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
		workout = em.find(Workout.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		workout = null;
	}

	@Test
	void test_Workout_entity_mapping() {
		assertNotNull(workout);
		assertEquals("Chest Workout", workout.getName());

	}
	
	@Test
	void test_Workout_User_Many_To_Many_mapping() {
		assertNotNull(workout.getUsers());
		assertTrue(workout.getUsers().size() > 0);
		
	}
	
	@Test
	void test_Workout_User_Many_To_One_mapping() {
		assertNotNull(workout.getUser());
		assertEquals("na", workout.getUser().getFirstName());
	}
	
	@Test
	void test_Workout_WorkoutComment_mapping() {
		assertNotNull(workout.getWorkoutComments());
		assertTrue(workout.getWorkoutComments().size() > 0);
		
	}

}
