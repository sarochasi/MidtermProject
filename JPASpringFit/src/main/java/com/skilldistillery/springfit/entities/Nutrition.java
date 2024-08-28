package com.skilldistillery.springfit.entities;

import java.time.LocalDate;
import java.util.Objects;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Nutrition {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@CreationTimestamp
	@Column(name = "date_eaten")
	LocalDate dateEaten;
	
	
	@Column(name = "grams_carbohydrates")
	Integer gramsCarbohydrates;
	
	@Column(name = "grams_fat")
	Integer gramsFat;
	
	@Column(name = "grams_protien")
	Integer gramsProtein;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	///--------------------------Constructor---------------------------------------------------------------------

	public Nutrition() {
		super();
	}
	
	
	///--------------------------Getters and Setters----------------------------------------------------------------------

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

	public LocalDate getDateEaten() {
		return dateEaten;
	}

	public void setDateEaten(LocalDate dateEaten) {
		this.dateEaten = dateEaten;
	}

	public Integer getGramsCarbohydrates() {
		return gramsCarbohydrates;
	}

	public void setGramsCarbohydrates(Integer gramsCarbohydrates) {
		this.gramsCarbohydrates = gramsCarbohydrates;
	}

	public Integer getGramsFat() {
		return gramsFat;
	}

	public void setGramsFat(Integer gramsFat) {
		this.gramsFat = gramsFat;
	}

	public Integer getGramsProtein() {
		return gramsProtein;
	}

	public void setGramsProtein(Integer gramsProtein) {
		this.gramsProtein = gramsProtein;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Nutrition [id=" + id + ", name=" + name + ", dateEaten=" + dateEaten + ", gramsCarbohydrates="
				+ gramsCarbohydrates + ", gramsFat=" + gramsFat + ", gramsProtein=" + gramsProtein + ", user=" + user
				+ "]";
	}

	
	///------------------------------------------------------------------------------------------------
	
	
	@Override
	public int hashCode() {
		return Objects.hash(dateEaten, gramsCarbohydrates, gramsFat, gramsProtein, id, name, user);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Nutrition other = (Nutrition) obj;
		return Objects.equals(dateEaten, other.dateEaten)
				&& Objects.equals(gramsCarbohydrates, other.gramsCarbohydrates)
				&& Objects.equals(gramsFat, other.gramsFat) && Objects.equals(gramsProtein, other.gramsProtein)
				&& id == other.id && Objects.equals(name, other.name) && Objects.equals(user, other.user);
	}
	
	

	
}
