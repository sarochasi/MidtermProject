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

class RoutineTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Routine routine;

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
		routine = em.find(Routine.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		routine = null;
	}

	@Test
	void test_Routine_entity_mapping() {
		assertNotNull(routine);
		assertEquals("Muscle Gaining Routine", routine.getName());

	}
	
	@Test
	void test_Routine_RoutineWorkout_mapping() {
		assertNotNull(routine.getRoutineWorkout());
		
//		assertEquals("admin", routine.getRoutineWorkout());
		
	}

}
