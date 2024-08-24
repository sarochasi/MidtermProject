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

class UnitTypeTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private UnitType unitType;

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
		unitType = em.find(UnitType.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		unitType = null;
	}

	@Test
	void test_BodyWeight_entity_mapping() {
		assertNotNull(unitType);
		assertEquals("Repetition", unitType.getName());

	}
	
	@Test
	void test_UnitType_Exercise_One_To_many_mapping() {
		assertNotNull(unitType.getExercises());
		assertTrue(unitType.getExercises().size() > 0);
		
	}
	

}
