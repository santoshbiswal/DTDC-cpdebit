package com.dtdc.model;

import java.util.Date;

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
@Table(name="SHIPMENT_DELIVERY")
public class ShipmentDelivery {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator ="shipment_delivery_sequence" )
	@SequenceGenerator(name = "shipment_delivery_sequence", sequenceName = "SHIPMENT_DELIVERY_SEQUENCE", allocationSize = 1)
	@Column(name = "DELIVERY_ID")
	private int deliveryId;
	
	
	//shipment number present in Booking table
	@Column(name = "DELIVERY_CONSIGNMENT_NUMBER")
	private String deliveryConsignmentNumber;
	
	@ManyToOne(cascade =CascadeType.ALL)
	@JoinColumn(name="DELIVERY_PARTNER_ID")
	private User deliveryUser;
	
	@Column(name = "DELIVERY_STATUS")
	private String deliveryStatus;
	
	private Date dod;
	
	private String remarks;

	public int getDeliveryId() {
		return deliveryId;
	}

	public void setDeliveryId(int deliveryId) {
		this.deliveryId = deliveryId;
	}

	public String getDeliveryConsignmentNumber() {
		return deliveryConsignmentNumber;
	}

	public void setDeliveryConsignmentNumber( String deliveryConsignmentNumber) {
		this.deliveryConsignmentNumber = deliveryConsignmentNumber;
	}

	public User getDeliveryUser() {
		return deliveryUser;
	}

	public void setDeliveryUser(User deliveryUser) {
		this.deliveryUser = deliveryUser;
	}

	public String getDeliveryStatus() {
		return deliveryStatus;
	}

	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}

	public Date getDod() {
		return dod;
	}

	public void setDod(Date dod) {
		this.dod = dod;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	
	
}




