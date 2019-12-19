package com.dtdc.ajax;

public class ShipmentSearchCriteria {

	private String shipNumber;
	private String daterange;
	private String source;
	private String destination;
	private String status;
	public String getShipNumber() {
		return shipNumber;
	}
	public void setShipNumber(String shipNumber) {
		this.shipNumber = shipNumber;
	}
	public String getDaterange() {
		return daterange;
	}
	public void setDaterange(String daterange) {
		this.daterange = daterange;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "ShipmentSearchCriteria [shipNumber=" + shipNumber + ", daterange=" + daterange + ", source=" + source
				+ ", destination=" + destination + ", status=" + status + "]";
	}
	
	
	
}
