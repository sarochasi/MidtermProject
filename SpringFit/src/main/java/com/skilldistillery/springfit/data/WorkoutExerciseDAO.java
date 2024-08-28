package com.skilldistillery.springfit.data;

import com.skilldistillery.springfit.entities.Exercise;
import com.skilldistillery.springfit.entities.WorkoutExercise;

public interface WorkoutExerciseDAO {
	public WorkoutExercise getWorkoutExerciseById(int id);

	public WorkoutExercise createWorkoutExercise(int exerciseId, int workoutId, WorkoutExercise workoutExercise);

	
	public boolean deleteExerciseByWorkoutId(int id);
	
	public WorkoutExercise updateWorkoutExercise(int id,WorkoutExercise workoutExercise);
	
	public boolean deleteWorkoutExercise(int id);
	

}
