package com.skilldistillery.springfit.data;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.springfit.entities.Routine;
import com.skilldistillery.springfit.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceContext;

@Transactional
@Repository
public class RoutineDAOImpl implements RoutineDAO {
	
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPASpringFit");
	
	@PersistenceContext
	private EntityManager em;
	

	@Override
	public Routine createNewRoutine(Routine routine, int userId) {
		User user = (User)em.find(User.class, userId);
		routine.setUser(user);
		em.persist(routine);
		return routine;
	}


	@Override
	public Routine getRoutineById(int routineId) {
		return em.find(Routine.class,routineId );

	}


	@Override
	public boolean deleteRoutineById(int routineId) {
		boolean deleted = false;
		Routine routine = em.find(Routine.class, routineId);
		
		if(routine != null) {
//			em.remove(routine);
			
			deleted = true;
		}
		
		return deleted;
	}


	@Override
	public boolean deleteRoutineByIdSqlStmt(int routineId) {
		boolean deleted = false;

			String jpql = "DELETE FROM RoutineWorkout rw WHERE rw.routine.id = :routineId";
			int result = em.createQuery(jpql, Routine.class).setParameter("routineId", jpql).executeUpdate();
			
			if(result > 0) {
				deleted = true;			
		}
		
		return deleted;
	}

}
