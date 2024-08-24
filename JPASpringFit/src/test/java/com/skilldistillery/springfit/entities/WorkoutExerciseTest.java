package com.skilldistillery.springfit.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class WorkoutExerciseTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private WorkoutExercise workoutExercise;

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
		workoutExercise = em.find(WorkoutExercise.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		workoutExercise = null;
	}

	@Test
	void test_WorkoutExercise_entity_mapping() {
		assertNotNull(workoutExercise);
		assertEquals(10, workoutExercise.getUnits());

	}
	
	@Test
	void test_WorkoutExercise_Workout_mapping() {
		assertNotNull(workoutExercise.get);
		
		assertEquals("admin", workoutExercise.getUser().getUsername());
		assertEquals("na", workoutExercise.getUser().getFirstName());
		
	}

}
