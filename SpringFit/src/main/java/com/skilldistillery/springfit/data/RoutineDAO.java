package com.skilldistillery.springfit.data;

import com.skilldistillery.springfit.entities.Routine;
import com.skilldistillery.springfit.entities.Workout;

public interface RoutineDAO {
	
	public Routine createNewRoutine(Routine routine, int userId);
	
	public Routine getRoutineById(int routineId);
	
	public boolean deleteRoutineById(int routineId);
	public boolean deleteRoutineByIdSqlStmt(int routineId);
	
}
