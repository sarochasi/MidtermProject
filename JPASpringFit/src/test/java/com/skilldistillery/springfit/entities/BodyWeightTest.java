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

class BodyWeightTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private BodyWeight bodyWeight;

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
		bodyWeight = em.find(BodyWeight.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		bodyWeight = null;
	}

	@Test
	void test_BodyWeight_entity_mapping() {
		assertNotNull(bodyWeight);
		assertEquals(180, bodyWeight.getWeight());

	}
	
	@Test
	void test_BodyWeight_User_mapping() {
		assertNotNull(bodyWeight.getUser());
		
		assertEquals("admin", bodyWeight.getUser().getUsername());
		assertEquals("na", bodyWeight.getUser().getFirstName());
		
	}

}
