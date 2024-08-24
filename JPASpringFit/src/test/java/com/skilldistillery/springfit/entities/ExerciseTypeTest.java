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

class ExerciseTypeTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private ExerciseType exerciseType;

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
		exerciseType = em.find(ExerciseType.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		exerciseType = null;
	}

	@Test
	void test_BodyWeight_entity_mapping() {
		assertNotNull(exerciseType);
		assertEquals("legs", exerciseType.getName());

	}
	

}
