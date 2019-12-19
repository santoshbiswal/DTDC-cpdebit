package com.dtdc.command;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class BookingCommand {

	private String name;
	private long phone;
	private String email;
	private String fromAddressLine1;
	private String fromAddressLine2;
	private String fromCity;
	private String fromState;
	private String fromCountry;
	private int fromZip;
	private String toAddressLine1;
	private String toAddressLine2;
	private String toCity;
	private String toState;
	private String toCountry;
	private int toZip;
	private String vasProdCod;
	private String source;
	private String destination;
	private int price;
	private float weight;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date  dob;
	private String  bookingParcelType;
	private int  quantity;
	
	private int userId;
	
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
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
	public String getFromAddressLine1() {
		return fromAddressLine1;
	}
	public void setFromAddressLine1(String fromAddressLine1) {
		this.fromAddressLine1 = fromAddressLine1;
	}
	public String getFromAddressLine2() {
		return fromAddressLine2;
	}
	public void setFromAddressLine2(String fromAddressLine2) {
		this.fromAddressLine2 = fromAddressLine2;
	}
	public String getFromCity() {
		return fromCity;
	}
	public void setFromCity(String fromCity) {
		this.fromCity = fromCity;
	}
	public String getFromState() {
		return fromState;
	}
	public void setFromState(String fromState) {
		this.fromState = fromState;
	}
	public String getFromCountry() {
		return fromCountry;
	}
	public void setFromCountry(String fromCountry) {
		this.fromCountry = fromCountry;
	}
	public int getFromZip() {
		return fromZip;
	}
	public void setFromZip(int fromZip) {
		this.fromZip = fromZip;
	}
	public String getToAddressLine1() {
		return toAddressLine1;
	}
	public void setToAddressLine1(String toAddressLine1) {
		this.toAddressLine1 = toAddressLine1;
	}
	public String getToAddressLine2() {
		return toAddressLine2;
	}
	public void setToAddressLine2(String toAddressLine2) {
		this.toAddressLine2 = toAddressLine2;
	}
	public String getToCity() {
		return toCity;
	}
	public void setToCity(String toCity) {
		this.toCity = toCity;
	}
	public String getToState() {
		return toState;
	}
	public void setToState(String toState) {
		this.toState = toState;
	}
	public String getToCountry() {
		return toCountry;
	}
	public void setToCountry(String toCountry) {
		this.toCountry = toCountry;
	}
	public int getToZip() {
		return toZip;
	}
	public void setToZip(int toZip) {
		this.toZip = toZip;
	}
	public String getVasProdCod() {
		return vasProdCod;
	}
	public void setVasProdCod(String vasProdCod) {
		this.vasProdCod = vasProdCod;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public float getWeight() {
		return weight;
	}
	public void setWeight(float weight) {
		this.weight = weight;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
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
	@Override
	public String toString() {
		return "BookingCommand [name=" + name + ", phone=" + phone + ", email=" + email + ", fromAddressLine1="
				+ fromAddressLine1 + ", fromAddressLine2=" + fromAddressLine2 + ", fromCity=" + fromCity
				+ ", fromState=" + fromState + ", fromCountry=" + fromCountry + ", fromZip=" + fromZip
				+ ", toAddressLine1=" + toAddressLine1 + ", toAddressLine2=" + toAddressLine2 + ", toCity=" + toCity
				+ ", toState=" + toState + ", toCountry=" + toCountry + ", toZip=" + toZip + ", vasProdCod="
				+ vasProdCod + ", source=" + source + ", destination=" + destination + ", price=" + price + ", weight="
				+ weight + ", dob=" + dob + ", bookingParcelType=" + bookingParcelType + ", quantity=" + quantity
				+ ", userId=" + userId + "]";
	}
	
	
	
	
	
	
}
