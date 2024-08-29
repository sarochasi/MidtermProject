package com.skilldistillery.springfit.entities;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String username;

	private String password;

	private Boolean enabled;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	private String email;

	@Column(name = "height_in_inches")
	private Integer height;

	private String gender;

	@Column(name = "date_of_birth")
	private LocalDate dateOfBirth;

	@ManyToMany(mappedBy = "users")
	private List<Workout> likedWorkout;

	@OneToMany(mappedBy = "user")
	private List<Workout> workouts;

	@OneToMany(mappedBy = "user")
	private List<Nutrition> nutritions;

	@OneToMany(mappedBy = "user")
	private List<Routine> routines;

	public User() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getHeight() {
		return height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public LocalDate getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(LocalDate dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public List<Workout> getLikedWorkout() {
		return likedWorkout;
	}

	public void setLikedWorkout(List<Workout> likedWorkout) {
		this.likedWorkout = likedWorkout;
	}

	public List<Workout> getWorkouts() {
		return workouts;
	}

	public void setWorkouts(List<Workout> workout) {
		this.workouts = workout;
	}

	public List<Nutrition> getNutritions() {
		return nutritions;
	}

	public void setNutritions(List<Nutrition> nutrition) {
		this.nutritions = nutrition;
	}

	public List<Routine> getRoutines() {
		return routines;
	}

	public void setRoutines(List<Routine> routines) {
		this.routines = routines;
	}

	// ADD & REMOVE
	public void addLikedWorkout(Workout workout) {
		if (likedWorkout == null) {
			likedWorkout = new ArrayList<>();
		}
		if (!likedWorkout.contains(workout)) {
			likedWorkout.add(workout);
			workout.addLikeByUser(this);
		}
	}

	public void removeLikedWorkout(Workout workout) {
		if (likedWorkout != null && likedWorkout.contains(workout)) {
			likedWorkout.remove(workout);
			workout.removeLikeByUser(this);
		}
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
		User other = (User) obj;
		return id == other.id;
	}

	// Generally keep MANY-MANY relationships out of toString
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", enabled=" + enabled
				+ ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", height=" + height
				+ ", gender=" + gender + ", dateOfBirth=" + dateOfBirth + "]";
	}

}
