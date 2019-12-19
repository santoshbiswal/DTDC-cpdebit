package com.dtdc.ajax;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.dtdc.bo.ShipmentStatusBo;
import com.dtdc.service.ShipmentBookingService;

@RestController
public class ShipmentBookingAjax {

	@Autowired
	private ShipmentBookingService service;

	@PostMapping("/api/get-shipment-booking-details")
	public ResponseEntity<List<ShipmentStatusBo>> getShipmentDeliverDetails(
			@RequestBody ShipmentSearchCriteria criteria) {

		System.out.println(criteria);
//		ShipmentDisplayResponse body=demoShipmentDisplayResponse();

		String shipmentNumber = criteria.getShipNumber();
		String dateRange = criteria.getDaterange();
		String source = criteria.getSource();
		String destination = criteria.getDestination();

		String status = criteria.getStatus();

		List<ShipmentStatusBo> body = null;

		if (!shipmentNumber.isEmpty()) {
			body = service.getShipmentAndStatusByShipmentNumber(shipmentNumber);

			System.out.println("From Shipment condition");
		}

		if (!dateRange.isEmpty()) {
			System.out.println("From dateRange condition");

			String[] dateArray=dateRange.split("-");//convertDateFromString(dateRange);
			
			String fromDate = dateArray[0].trim();
			String toDate = dateArray[1].trim();

			body = service.getShipmentAndStatusBydateRangeAndStatus(fromDate, toDate, status);
		}

		if (!source.isEmpty() && !destination.isEmpty()) {

			System.out.println("From source condition");
			body = null;
		}
		return ResponseEntity.ok(body);

	}

	public String[] convertDateFromString(String dateRange) {


		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yy");

		String[] inputDateArr=dateRange.split("-");
		
		
		String[] actualDateArray=new String[2];
	
		
		/* try { */
			
			System.out.println("Going to Convert");
			//String fromDate = sdf.format(sdf.parse(requiredDate));
			
			
			/*
			 * System.out.println("requiredDate "+requiredDate);
			 * System.out.println("fromDate : "+fromDate);
			 * 
			 * String toDate =
			 * sdf.format(sdf.parse(inputFormat.format(inputDateArr[1].trim())));
			 * 
			 * System.out.println(fromDate+"=="+toDate); actualDateArray[0]=fromDate;
			 * actualDateArray[1]=toDate;
			 */
		/*
		 * } catch (ParseException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 */
		
		return actualDateArray;
	}

	private ShipmentDisplayResponse demoShipmentDisplayResponse() {
		ShipmentDisplayResponse response = new ShipmentDisplayResponse();

		response.setDestination("BBB");
		response.setSource("vvvv");
		response.setDob("wwww");
		response.setShipmentNumber("ssss111");
		response.setStatus("ssssS");

		return response;

	}
}
