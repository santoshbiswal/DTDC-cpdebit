package com.dtdc.bo;

import java.util.Date;

public class ShipmentStatusBo {

	private String consignmentNumber;
	private String source;
	private String destiation;
	private Date dob;
	private String deliveryStatus;
	private String remarks;
	public String getConsignmentNumber() {
		return consignmentNumber;
	}
	public void setConsignmentNumber(String consignmentNumber) {
		this.consignmentNumber = consignmentNumber;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getDestiation() {
		return destiation;
	}
	public void setDestiation(String destiation) {
		this.destiation = destiation;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getDeliveryStatus() {
		return deliveryStatus;
	}
	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	@Override
	public String toString() {
		return "ShipmentStatusBo [consignmentNumber=" + consignmentNumber + ", source=" + source + ", destiation="
				+ destiation + ", dob=" + dob + ", deliveryStatus=" + deliveryStatus + ", remarks=" + remarks + "]";
	}
	
	
	
	
	
}
