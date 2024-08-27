package com.skilldistillery.springfit.data;

import java.util.List;

import com.skilldistillery.springfit.entities.Exercise;
import com.skilldistillery.springfit.entities.Workout;
import com.skilldistillery.springfit.entities.WorkoutExercise;

public interface WorkoutDAO {

	public Workout getWorkoutById(int id);
	public Workout updateNewWorkout(int id, List<WorkoutExercise> exerciseList);
	public boolean deleteWorkout(int id, List<WorkoutExercise> exerciseList);
	
	// Initialize workout 
	public Workout createNewWorkoutInitialize(Workout workout, int userId);
	
	public Workout createNewWorkout(String workoutName, List<WorkoutExercise> exerciseList);
	
	public Workout addExerciseToWorkout(int workoutId, WorkoutExercise workoutExercise);
	
	
}
