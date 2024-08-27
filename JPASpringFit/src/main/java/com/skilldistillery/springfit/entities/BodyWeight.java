package com.skilldistillery.springfit.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="body_weight")
public class BodyWeight {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="weight_lbs")
	private Integer weight;
	
	@CreationTimestamp
	@Column(name="date_weighed")
	private LocalDateTime dateWeighted;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	public BodyWeight() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}



	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public LocalDateTime getDateWeighted() {
		return dateWeighted;
	}

	public void setDateWeighted(LocalDateTime dateWeighted) {
		this.dateWeighted = dateWeighted;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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
		BodyWeight other = (BodyWeight) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "BodyWeight [id=" + id + ", weight=" + weight + ", dateWeighted=" + dateWeighted + ", user=" + user
				+ "]";
	}
	
	
}
