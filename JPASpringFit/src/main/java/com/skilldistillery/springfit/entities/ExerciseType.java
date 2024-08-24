package com.skilldistillery.springfit.entities;

import java.util.List;
import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="exercise_type")
public class ExerciseType {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@OneToMany(mappedBy = "exerciseType")
	private List<Exercise> excercises;

	public ExerciseType() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	

	public List<Exercise> getExcercises() {
		return excercises;
	}

	public void setExcercises(List<Exercise> excercises) {
		this.excercises = excercises;
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
		ExerciseType other = (ExerciseType) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "ExerciseType [id=" + id + ", name=" + name + ", excercises=" + excercises + "]";
	}
	
	
}
