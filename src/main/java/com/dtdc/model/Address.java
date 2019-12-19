package com.dtdc.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

@Entity
public class Address {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator ="address_sequence" )
	@SequenceGenerator(name = "address_sequence", sequenceName = "SEQ_ADDRESS", allocationSize = 1)
	@Column(name = "AID")
	private int addressId;
	
	@Column(name = "A_LINE1")
	private String addressLine1;
	
	@Column(name = "A_LINE2")
	private String addressLine2;
	private String city;
	private String state;
	private String country;
	private long zip;
	
	@ManyToOne(cascade =CascadeType.ALL)
	@JoinColumn(name="USER_ID")
	private User user;
	
	public int getAddressId() {
		return addressId;
	}
	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}
	public String getAddressLine1() {
		return addressLine1;
	}
	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}
	public String getAddressLine2() {
		return addressLine2;
	}
	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public long getZip() {
		return zip;
	}
	public void setZip(long zip) {
		this.zip = zip;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
}
