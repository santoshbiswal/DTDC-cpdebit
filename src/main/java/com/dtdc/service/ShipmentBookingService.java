package com.dtdc.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dtdc.bo.ShipmentStatusBo;
import com.dtdc.model.ShipmentBooking;
import com.dtdc.repository.ShipmentBookingRepository;

@Service
public class ShipmentBookingService {

	@Autowired
	private ShipmentBookingRepository repository;
	
	public ShipmentBooking doBookingShipment(ShipmentBooking sb) {
		
		ShipmentBooking shipmentBooking=repository.save(sb);
		
		
		return shipmentBooking;
		
	}
	
	public ShipmentBooking findById(String id) {
		
		Optional<ShipmentBooking> optional= repository.findById(id);
		ShipmentBooking ob=null;
		if(optional.isPresent()) {
			ob=optional.get();
		}
		
		return ob;
	}
	
	public Integer getPriceBySourceAndDestination(String source,String destination) {
		
		return repository.findPrice(source, destination);
		
	}
	
	public List<ShipmentBooking> getShipmentBookingByDate(Date now,Date tomorrow){
		
		return repository.findShipmentBookingByDate(now, tomorrow);
	}
	
	
	public List<ShipmentStatusBo> getShipmentAndStatusByShipmentNumber(String shipmentNumber){
		
		List<Object[]> resultData=repository.getShipmentAndStatusByShipmentNumber(shipmentNumber);
		
		List<ShipmentStatusBo> shipmentStatusBoList=converObjectarrayListToShipmentStatusBoList(resultData);
		
		
				
		System.out.println(shipmentStatusBoList);
		return shipmentStatusBoList;
	}
	

	public List<ShipmentStatusBo> getShipmentAndStatusBydateRangeAndStatus(String fromDate,String toDate,String status){
		
		List<Object[]> resultData=null;
	
		if(!status.equals("all")) {
			resultData=repository.getShipmentAndStatusBydateRangeAndStatus(fromDate, toDate, status);
			
		}else {
			
			resultData=repository.getShipmentAndStatusBydateRange(fromDate, toDate);
			
		}
		
		List<ShipmentStatusBo> shipmentStatusBoList=converObjectarrayListToShipmentStatusBoList(resultData);
		
		
				
		System.out.println(shipmentStatusBoList);
		return shipmentStatusBoList;
	}

	private List<ShipmentStatusBo> converObjectarrayListToShipmentStatusBoList(List<Object[]> shipmentResultList){
		
		
//		s.CONSIGNMENT_NUMBER,s.SOURCE,s.DESTINATION,s.BOOKING_DATE_TIME,d.DELIVERY_STATUS,d.REM
		List<ShipmentStatusBo> shipmentStatusBoList=new ArrayList<ShipmentStatusBo>();
		for(Object[] arr:shipmentResultList) {
			
			ShipmentStatusBo bo=new ShipmentStatusBo();
			
			bo.setConsignmentNumber(String.valueOf(arr[0]));
			bo.setSource(String.valueOf(arr[1]));
			bo.setDestiation(String.valueOf(arr[2]));
			
			Date date=converObjectToDate(arr[3]);
			
			bo.setDob(date);
			
			bo.setDeliveryStatus(String.valueOf(arr[4]));
			
			bo.setRemarks(String.valueOf(arr[5]));
			
			shipmentStatusBoList.add(bo);
		}
		
		return shipmentStatusBoList;
	}
	private Date converObjectToDate(Object date){
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date convertedDate=null;;
		try {
			convertedDate = sdf.parse(String.valueOf(date));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return convertedDate;
	}
		
	
	
}
