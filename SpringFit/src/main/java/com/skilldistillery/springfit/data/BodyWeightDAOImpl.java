package com.skilldistillery.springfit.data;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Transactional
@Repository
public class BodyWeightDAOImpl implements BodyWeightDAO{
	
	@PersistenceContext
	private EntityManager em;

}
