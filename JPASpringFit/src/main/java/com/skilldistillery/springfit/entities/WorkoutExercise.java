package com.skilldistillery.springfit.entities;

import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="workout_exercise")
public class WorkoutExercise {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private Integer units;
	
	private Integer sets;
	
	private String notes;
	
	@ManyToOne
	@JoinColumn(name="exercise_id")
	private Exercise exercise;
	
	@ManyToOne
	@JoinColumn(name="workout_id")
	private Workout workout;

	public WorkoutExercise() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getUnits() {
		return units;
	}

	public void setUnits(Integer units) {
		this.units = units;
	}

	public Integer getSets() {
		return sets;
	}

	public void setSets(Integer sets) {
		this.sets = sets;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public Exercise getExercise() {
		return exercise;
	}

	public void setExercise(Exercise exercise) {
		this.exercise = exercise;
	}

	public Workout getWorkout() {
		return workout;
	}

	public void setWorkout(Workout workout) {
		this.workout = workout;
	}
	

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		WorkoutExercise other = (WorkoutExercise) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "WorkoutExercise [id=" + id + ", units=" + units + ", sets=" + sets + ", notes=" + notes + ", exercise="
				+ exercise + ", workout=" + workout + "]";
	}
	
	
	
	

}
