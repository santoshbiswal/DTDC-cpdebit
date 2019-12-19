package com.dtdc.deligate;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dtdc.model.ShipmentBooking;
import com.dtdc.model.ShipmentDelivery;
import com.dtdc.service.ShipmentBookingService;
import com.dtdc.service.ShipmentDeliveryService;

@Component
public class PopulatePendingShipmentDeligate {

	@Autowired
	private ShipmentBookingService bookingService;

	@Autowired
	private ShipmentDeliveryService deliveryService;

	public void doPopulateIntoDelivery(Date now, Date tomorrow) {

		List<ShipmentBooking> shipmentBookingList = bookingService.getShipmentBookingByDate(now, tomorrow);

		populateIntoDelivery(shipmentBookingList);
		System.out.println(shipmentBookingList);
	}

	
	public void populateIntoDelivery(List<ShipmentBooking> array) {

		for (ShipmentBooking booking : array) {

			ShipmentDelivery delivery = new ShipmentDelivery();

			delivery.setDeliveryConsignmentNumber(booking.getConsignmentNumber());//ConsignmentNumber
			delivery.setDeliveryStatus("pending");//pending,delivered,in-process,failure
			
			ShipmentDelivery shipmentDelivery = deliveryService.save(delivery);
			System.out.println("Delivery id : " + shipmentDelivery.getDeliveryId());
		}
	}
}
