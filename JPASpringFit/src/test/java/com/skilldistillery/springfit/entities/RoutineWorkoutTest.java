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

class RoutineWorkoutTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private RoutineWorkout routineWorkout;

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
		routineWorkout = em.find(RoutineWorkout.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		routineWorkout = null;
	}

	@Test
	void test_RoutineWorkout_entity_mapping() {
		assertNotNull(routineWorkout);
		assertEquals(1, routineWorkout.getDayNumber());

	}
	
	@Test
	void test_RoutineWorkout_Routine_mapping() {
		assertNotNull(routineWorkout.getRoutine());
		
		assertEquals("Muscle Gaining Routine", routineWorkout.getRoutine().getName());
		
	}

}
