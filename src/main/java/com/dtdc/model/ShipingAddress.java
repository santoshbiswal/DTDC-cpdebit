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
import javax.persistence.Table;

@Entity
@Table(name = "SHIPING_ADDRESS")
public class ShipingAddress {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator ="shiping_address_sequence" )
	@SequenceGenerator(name = "shiping_address_sequence", sequenceName = "SEQ_SHIPING_ADDRESS", allocationSize = 1)
	@Column(name = "SHIP_ADD_ID")
	private int shipingAddressId;
	@Column(name = "ADDRESS_LINE1")
	private String addressLine1;
	@Column(name = "ADDRESS_LINE2")
	private String addressLine2 ;
	private String city ;
	private String  state;
	private String  country;
	private int  zip;
	@Column(name = "ADDRESS_TYPE")
	private String addressType;
	
	@ManyToOne(cascade =  CascadeType.ALL)
	@JoinColumn(name = "SHIPING_CUSTOMER_ID")
	private DtdcCustomer dtdcCustomer;

	public int getShipingAddressId() {
		return shipingAddressId;
	}

	public void setShipingAddressId(int shipingAddressId) {
		this.shipingAddressId = shipingAddressId;
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

	public int getZip() {
		return zip;
	}

	public void setZip(int zip) {
		this.zip = zip;
	}

	public String getAddressType() {
		return addressType;
	}

	public void setAddressType(String addressType) {
		this.addressType = addressType;
	}

	public DtdcCustomer getDtdcCustomer() {
		return dtdcCustomer;
	}

	public void setDtdcCustomer(DtdcCustomer dtdcCustomer) {
		this.dtdcCustomer = dtdcCustomer;
	}
	
	
	
	
	
}
