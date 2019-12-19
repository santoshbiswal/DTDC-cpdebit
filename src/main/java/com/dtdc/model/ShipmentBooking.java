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
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Table(name = "SHIPMENT_BOOKING")
public class ShipmentBooking {

	@Id
	 @GeneratedValue(strategy = GenerationType.SEQUENCE,   generator = "shipment_seq")
    @GenericGenerator(
        name = "shipment_seq", 
        strategy = "com.dtdc.model.ShipmentNumberCustomeKeyGenerator", 
        parameters = {
            @Parameter(name = ShipmentNumberCustomeKeyGenerator.INCREMENT_PARAM, value = "1"),
            @Parameter(name = ShipmentNumberCustomeKeyGenerator.VALUE_PREFIX_PARAMETER, value = "I"),
            @Parameter(name = ShipmentNumberCustomeKeyGenerator.NUMBER_FORMAT_PARAMETER, value = "%05d"),
            @Parameter(name = "sequence_name", value = "shipment_sequence"),
            @Parameter(name = "initial_value", value = "1"),
        })
	@Column(name = "CONSIGNMENT_NUMBER")
	private String consignmentNumber;
	
	@Column(name="VAS_PROD_COD")
	private String vasProdCod;
	
	@Column(name = "BOOKING_PRICE")
	private int bookingPrice;
	
	@Column(name="ITEM_WEIGHT")
	private float itemWeight;
	private String source;
	private String destination;
	
	@Column(name = "BOOKING_DATE_TIME")
	private Date bookingDateTime;
	
	@Column(name= "BOOKING_PARCEL_TYPE")
	private String bookingParcelType;
	private int quantity;
	
	@ManyToOne(cascade =CascadeType.ALL)
	@JoinColumn(name="CHANNEL_PARTNER_ID")
	private User user;

	@ManyToOne(cascade =CascadeType.ALL)
	@JoinColumn(name="CUSTOMER_ID")
	private DtdcCustomer dtdcCustomer;
	
	public DtdcCustomer getDtdcCustomer() {
		return dtdcCustomer;
	}

	public void setDtdcCustomer(DtdcCustomer dtdcCustomer) {
		this.dtdcCustomer = dtdcCustomer;
	}

	public String getConsignmentNumber() {
		return consignmentNumber;
	}

	public void setConsignmentNumber(String consignmentNumber) {
		this.consignmentNumber = consignmentNumber;
	}

	public String getVasProdCod() {
		return vasProdCod;
	}

	public void setVasProdCod(String vasProdCod) {
		this.vasProdCod = vasProdCod;
	}

	public int getBookingPrice() {
		return bookingPrice;
	}

	public void setBookingPrice(int bookingPrice) {
		this.bookingPrice = bookingPrice;
	}

	public float getItemWeight() {
		return itemWeight;
	}

	public void setItemWeight(float itemWeight) {
		this.itemWeight = itemWeight;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public Date getBookingDateTime() {
		return bookingDateTime;
	}

	public void setBookingDateTime(Date bookingDateTime) {
		this.bookingDateTime = bookingDateTime;
	}

	public String getBookingParcelType() {
		return bookingParcelType;
	}

	public void setBookingParcelType(String bookingParcelType) {
		this.bookingParcelType = bookingParcelType;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "ShipmentBooking [consignmentNumber=" + consignmentNumber + ", vasProdCod=" + vasProdCod
				+ ", bookingPrice=" + bookingPrice + ", itemWeight=" + itemWeight + ", source=" + source
				+ ", destination=" + destination + ", bookingDateTime=" + bookingDateTime + ", bookingParcelType="
				+ bookingParcelType + ", quantity=" + quantity + ", user=" + user + ", dtdcCustomer=" + dtdcCustomer +"]";
	}
	
	
	
	
}
