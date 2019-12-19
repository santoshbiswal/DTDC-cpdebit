package com.dtdc.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "DTDC_CUSTOMER")
public class DtdcCustomer  {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "customer_sequence")
	@SequenceGenerator(name = "customer_sequence", sequenceName = "CUSTOMER_SEQUENCE", allocationSize = 1)
	@Column(name = "CUSTOME_ID")
	private int customeId;
	
	private String name;
	
	private long phone;
	
	private String email;
	
	@OneToMany(mappedBy = "dtdcCustomer")
	private Set<ShipingAddress> shipingAddress;
	
	@OneToOne(mappedBy = "dtdcCustomer")
	private ShipmentBooking shipmentBooking;

	
	
	
	public int getCustomeId() {
		return customeId;
	}

	public void setCustomeId(int customeId) {
		this.customeId = customeId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Set<ShipingAddress> getShipingAddress() {
		return shipingAddress;
	}

	public void setShipingAddress(Set<ShipingAddress> shipingAddress) {
		this.shipingAddress = shipingAddress;
	}

	public ShipmentBooking getShipmentBooking() {
		return shipmentBooking;
	}

	public void setShipmentBooking(ShipmentBooking shipmentBooking) {
		this.shipmentBooking = shipmentBooking;
	}
	
	
	
}
