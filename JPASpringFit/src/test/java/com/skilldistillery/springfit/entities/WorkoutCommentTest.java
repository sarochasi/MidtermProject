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

class WorkoutCommentTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private WorkoutComment workoutComment;

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
		workoutComment = em.find(WorkoutComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		workoutComment = null;
	}

	@Test
	void test_WorkoutComment_entity_mapping() {
		assertNotNull(workoutComment);
		assertEquals("comment stuff", workoutComment.getContent());

	}
	
	@Test
	void test_WorkoutComment_User_mapping() {
		assertNotNull(workoutComment.getUser());
		
		assertEquals("admin", workoutComment.getUser().getUsername());
		assertEquals("na", workoutComment.getUser().getFirstName());
		
	}

}
