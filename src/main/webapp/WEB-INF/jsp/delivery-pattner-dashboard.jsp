<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CP Debit</title>
<link href="../resource/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="../resource/css/cd_custom.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" media="all"
	href="../resource/css/daterangepicker.css" />
<link href="../resource/css/datatables.min.css" rel="stylesheet"
	type="text/css" />
<link href="../resource/fonts/css/all.css" rel="stylesheet">
<script type="text/javascript" src="../resource/js/jquery-ui.js"></script>
<script type="text/javascript" src="../resource/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="../resource/js/moment.js"></script>
<script type="text/javascript" src="../resource/js/daterangepicker.js"></script>
<script type="text/javascript"
	src="../resource/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="../resource/js/dataTables.bootstrap.min.js"></script>
<script defer src="../resource/fonts/js/all.js"></script>
 
<c:url var="home" value="/" scope="request" />
<%-- <spring:url value="../resource/js/jquery.1.10.2.min.js"
	var="jqueryJs" />
<script src="${jqueryJs}"></script> 
<script type="text/javascript" src="webjars/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/dataTables.jqueryui.min.js"></script>
--%>

</head>
<body>

	<!----------------- Header Starts -------------------->
	<div class="header">
		<div class="dtdclogo">
			INTRANET<br /> <span>CP DEBIT DELIVERY</span>
		</div>
		<div class="FRPLUS"></div>
	</div>
	<!----------------- Header Ends -------------------->


	<!----------------- Search Criteria Starts --------------------action="/CP-Debit/cpdebitmisresult" -->
	<div class="panel-default container-fluid" >
		<div class="panel-body" id="resultbody">
			<form id="cpdebitForm">
				<div class="form-group col-lg-2">
					<label>Shipment Number</label> <input class="form-control"
						type="text" name="shipNumber" id="shipNumber" />
						
				</div>
				<div class="form-group col-lg-1" style="text-align: center;">
					<img src="../resource/images/or.png" alt="" />
				</div>
				<div class="form-group col-lg-2">
					<label>Select Booking  period</label> <input class="form-control"
						type="text" name="daterange" onclick="forDateInput()"  id="daterange" placeholder="Enter Block CDS period" />
				</div>
				<div class="form-group col-lg-1" style="text-align: center;">
					<img src="../resource/images/or.png" alt="" />
				</div>
				<div>
					<div  class="form-group col-lg-2">
						<label>source</label> <!-- <input class="form-control"
							type="text" name="source" id="source" /> -->
							<select name="source" id="source" class="form-control">
								<option value="">select</option>
								<option value="Banglore">Banglore</option>
								<option value="Hydrabad">Hydrabad</option>
								<option value="Chennai">Chennai</option>
								<option value="Bhubaneswar">Bhubaneswar</option>
							</select>
					</div>
					<div class="form-group col-lg-2">
						<label>Destination</label> <!-- <input class="form-control"
							type="text" name="destination" id="destination" /> -->
							<select name="destination" id="destination"  class="form-control" >
								<option value="">select</option>
								<option value="Banglore">Banglore</option>
								<option value="Hydrabad">Hydrabad</option>
								<option value="Chennai">Chennai</option>
								<option value="Bhubaneswar">Bhubaneswar</option>
							</select>
					</div>
				</div>
				<div class="col-lg-2">
					<label>Process Status</label> <select title="Select status"
						class="form-control" name="status" id="status">
						<option>all</option>
						<option>pending</option>
						<option>delivered</option>
						<option>failure</option>
					</select>
				</div>
				<div class="form-group col-lg-2" style="margin-top: 20px;">
					<button type="submit"  id="submitButton" class="btn btn-success" >
						<span class="fa fa-check"></span>&nbsp;Submit
					</button>
					<!-- <button type="button" onclick="downloadExcelFile()"  id="excelDownloadButton"
						style="background: none; padding: 0px; float: right; border: none;">
						<img src="./jsp/images/excl.jpg" alt="" />
					</button> -->
				</div>
			</form>
		</div>
	</div>
	
	<!----------------- Search Criteria Ends -------------------->


	<!----------------- Search Result Table Starts -------------------->
	<div  class="panel-default container-fluid">
		<div id="table-div" class="panel-body">
			<table id="example" class="table table-striped table-bordered"></table>
		</div>
		<div id="message-div" class="panel-body"></div>
 	</div>

	<!----------------- Search Result Table Ends -------------------->
</body>
<script type="text/javascript" >

$(function() {
	$('input[name="daterange"]').daterangepicker({
		autoUpdateInput : false,
		locale : {
			cancelLabel : 'Clear'
		}
	});
	$('input[name="daterange"]').on(
			'apply.daterangepicker',
			function(ev, picker) {
				$(this).val(
						picker.startDate.format('DD/MM/YY') + ' - '
								+ picker.endDate.format('DD/MM/YY'));
			});

	$('input[name="daterange"]').on('cancel.daterangepicker',
			function(ev, picker) {
				$(this).val('');
			});
});

 jQuery(document).ready(function($) {

	 $("#shipNumber").click(function(){
		// enableSearchButton(false);
		    $("#daterange").val("");
		    $("#source").val("");
		    $("#destination").val("");
		});
	
	$("#daterange").click(function(){
		//enableSearchButton(false);
		   $("#shipNumber").val("");
		   $("#source").val("");
		   $("#destination").val("");
	});

	$("#source").change(function(){
		//enableSearchButton(false);
		  $("#daterange").val("");
		  $("#shipNumber").val("");

		  var source=$("#source").val();

		  var destination=$("#destination").val();

		  if(source==destination){
			alert("source and destination  should not be same");
			$("#source").val(0);
			$("#destination").val(0) ;
			return;
		 }
	});

	$("#destination").change(function(){
		//enableSearchButton(false);
	  $("#daterange").val("");
	  $("#shipNumber").val("");

      var source=$("#source").val();

	  var destination=$("#destination").val();

	  if(source==destination){
		alert("From source and destination city should not be same");
		$("#source").val(0);
		$("#destination").val(0) ;
		return;
	 }
  });

	$("#cpdebitForm").submit(function(event){

		event.preventDefault();

		var search={};

		search["shipNumber"]=$("#shipNumber").val();
		search["daterange"]=$("#daterange").val();
		search["source"]=$("#source").val();
		search["destination"]=$("#destination").val();
		search["status"]=$("#status").val();


		getShipmentBookingDetails(search);
			
	});


	function getShipmentBookingDetails(searchCriteria){

		var data=JSON.stringify(searchCriteria);
		alert(data);

		 $.ajax({
	         type: "POST",
	         contentType: "application/json",
	         url: "/api/get-shipment-booking-details",
	         data: JSON.stringify(searchCriteria),
	         dataType: 'json',
	         cache: false,
	         timeout: 600000,
	         success: function (resultArray) {

	        	 alert("Success");
	        	 alert(resultArray);
		         var stingResult=JSON.stringify(resultArray);
		         console.log(stingResult);
		         displayTable(resultArray);
	         },
	         error: function (e) {

	        		alert("Failure");
	         }
	     });


	}

});

function displayTable(resultArr){


	if(resultArr.length==0){

	  $("#message-div").html("No data found");
	  $("#message-div").show();
	  $("#table-div").hide();
	
	  return;

    }

	$("#message-div").hide();
	 var isSecondHit=document.getElementById("secondHit").value;
	 if(isSecondHit != "Yes"){
		 
		 var tableHeaderRow="<thead><tr><th>SL No</th><th>Shipment Number</th><th>Date of booking</th><th>Source</th><th>Destination</th><th>Status</th><th>Remark</th></tr></thead>";
		 var tableDataRow="<tbody>";
	 	 for (var i = 0; i < resultArr.length; i++) {

	 		var remark=resultArr[i]["remarks"];
	 		if(remark === null){

	 			remark="";
		 	}
	 		tableDataRow=tableDataRow+"<tr><td>"+(i+1)+"</td><td><a href='/dtdc-registration.htm'>"+resultArr[i]["consignmentNumber"]+"</a></td><td>"+resultArr[i]["dob"]+"</td><td>"+resultArr[i]["source"]+"</td><td>"+resultArr[i]["destiation"]+"</td><td>"+resultArr[i]["deliveryStatus"]+"</td><td>"+remark+"</td></tr>"
	 	 }
	
	 	tableDataRow=tableDataRow+"</tbody>";
	
	 	var finalTable=tableHeaderRow+tableDataRow;
	
	 	 $("#example").html(finalTable);
	      $("#example").DataTable().search( '' ).columns().search( '' ).draw();
	     $("#table-div").show();
	     document.getElementById("secondHit").value="Yes";

	 }else{

		 var dataTable = $('#example').DataTable();
		 dataTable.clear();

		 for (var i = 0; i < resultArr.length; i++) {

			 
			  dataTable.row.add([ (i+1) ,
				  "<a href='/dtdc-registration.htm'>"+resultArr[i]["consignmentNumber"]+"</a>",
				  resultArr[i]["dob"] ,
				  resultArr[i]["source"],
				  resultArr[i]["destiation"], 
				  resultArr[i]["deliveryStatus"],
				  resultArr[i]["remarks"],
			]).search( '' ).columns().search( '' ).draw();
			$("#table-div").show();
		 }
	}

   
}
 
window.onload = function() {


	 $('<input>').attr({
		    type: 'hidden',
		    id: 'secondHit',
		    name: 'bar',
		    value: 'No'
		}).appendTo('form');

	 $("#message-div").hide();
}
/* 


window.onload = function() {
	//alert("Hionload");
	 $("#table-div").hide();
	 $("#message-div").hide();
	 //alert("Hiajax1");
	 $('<input>').attr({
		    type: 'hidden',
		    id: 'secondHit',
		    name: 'bar',
		    value: 'No'
		}).appendTo('form');
	 //enableSearchButton(true);
}

function downloadExcelFile() {
	//alert("Hidown1");
	if(isEmptyField()==true){
		//alert("Hidown2");
		$('<input>').attr({
		    type: 'hidden',
		    id: 'foo',
		    name: 'bar',
		    value: 'download'
		}).appendTo('form');

		var v=document.getElementById("foo").value;
		if(v!="download"){
			//alert("Hidown3");
			document.getElementById("foo").value="download";
		}
		//alert("Hidown4");
		searchViaAjax();
	  } 
} 
function isEmptyField() {
	var shipmentNum=document.getElementById("shipNumber").value;
	var toDateAndFromDate=document.getElementById("daterange").value;
	var sapDoc=document.getElementById("sapDocNumber").value;

	if(shipmentNum != "" || toDateAndFromDate != "" || sapDoc != ""){
		//alert("Hisearch1");
		return true;
	}else if(shipmentNum == "" && toDateAndFromDate == "" && sapDoc == ""){

		alert("Please fill any of field among Shipment Number OR Block CDS Period OR Sap Document Number");
		//alert("Hisearch2");
		return false;
	}
	 //$("#table-div").show();
	 return true;
}

function forDateInput(){

	   $("#shipNumber").val("");
	   $("#sapDocNumber").val("");
	   enableSearchButton(false);
}
	
jQuery(document).ready(function($) {

	 $("#shipNumber").change(function(){
		 enableSearchButton(false);
		    $("#daterange").val("");
		    $("#sapDocNumber").val("");
		});
	
	$("#sapDocNumber").change(function(){
		enableSearchButton(false);
		   $("#shipNumber").val("");
		   $("#daterange").val("");
	});
	
	$("#cpdebitForm").submit(function(event) {
		//alert("Hi0");
		$('<input>').attr({
		    type: 'hidden',
		    id: 'foo',
		    name: 'bar',
		    value: 'notdownload'
		}).appendTo('form');
		document.getElementById("foo").value="notdownload";
		//alert("Hi1");
		if(isEmptyField()==false){
			//alert("Hi88");
			$("#table-div").hide();
			return false;
		}else if(isEmptyField()==true){
			// Disble the search button
			//alert("Hi2");
			enableSearchButton(false);
			// Prevent the form from submitting via the browser.
			event.preventDefault();
			searchViaAjax();
		}
	});

});
function excelDownLoad(){
	var shipmentNum=document.getElementById("shipNumber").value;
	var toDateAndFromDate=document.getElementById("daterange").value;
	var sapDoc=document.getElementById("sapDocNumber").value;
	var proStatus=document.getElementById("proStatus").value;
	window.open("${home}/downloadexcel?shipNumber="+shipmentNum+"&daterange="+toDateAndFromDate+"&sapDocNumber="+sapDoc+"&proStatus="+proStatus);

}
function searchViaAjax() {
	//alert("Hi3");
	var search = {}
	search["shipNumber"] = $("#shipNumber").val();
	search["daterange"] = $("#daterange").val();
	search["sapDocNumber"] = $("#sapDocNumber").val();
	search["proStatus"] = $("#proStatus").val();
	$('#submitButton').attr('disabled', true);
	
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "${home}/search/api/cpdebitmisresultajax",
		data : JSON.stringify(search),
		dataType : 'json',
		timeout : 100000,
		success : function(data) {
			//alert("Hi3.1");
			console.log("SUCCESS: ", data);
			display(data);
			$('#submitButton').attr('disabled', false);
		},
		error : function(e) {
			//alert("Hi3.2");
			console.log("ERROR: ", e);
			noDataFound();
			//display(e);
		},
		done : function(e) {
			//alert("Hi3.3");
			console.log("DONE");
			enableSearchButton(true);
		}
	});

}

function enableSearchButton(flag) {
	$("#submitButton").prop("disabled", flag);
}


function noDataFound(){
	//$("#table-div").show();
	//var divContainer = document.getElementById("table-div");
    //divContainer.innerHTML = "No data found";
    document.getElementById("shipNumber").innerHTML="";
	document.getElementById("daterange").innerHTML="";
	document.getElementById("sapDocNumber").innerHTML="";
	//var divContainer = document.getElementById("table-div");
    //divContainer.innerHTML = "No data found";
}
function display(data) {

	//alert("Hi4");
	$("#table-div").hide();
	$('#submitButton').attr('disabled', false);
	var cpDebitMisResultArr=data["cpDebitMisResultList"];
	var isDataPresent=true;
	if (cpDebitMisResultArr == undefined || cpDebitMisResultArr == null || cpDebitMisResultArr.length == 0 || (cpDebitMisResultArr.length == 1 && cpDebitMisResultArr[0] == "")){

		//alert("Hi4.1");
		var divContainer = document.getElementById("message-div");
	    divContainer.innerHTML = "No data found";
	    $("#message-div").show();
	    message-div
	       
	    isDataPresent=false;
	    
	}
	//alert("Hi4.2");
	var v=document.getElementById("foo").value;
	if(v=="download" && isDataPresent==true){
		$("#table-div").show();
		//alert("Hi4.3");
		excelDownLoad();
	}else if(isDataPresent==true && v!="download"){
		$("#message-div").hide();
		//alert("Hi5");
		 var isSecondHit=document.getElementById("secondHit").value;
		 if(isSecondHit== null || isSecondHit== "" || isSecondHit != "Yes"){
				//alert("Hi6");
					 var finalData="<thead><tr><th>SL No</th><th>Shipment Number</th><th>Blocked On</th><th>Blocked By</th><th>Blocked Status</th><th>Blocked Success/Fail Remarks</th><th>CDS Generation Status</th><th>CDS Generation Success/Fail Remarks</th><th>CDS No</th><th>SAP Details uploaded On</th><th>SAP Details updated by</th><th>SAP Doc No</th><th>CDS Generation Date</th><th>CDS Closure Date</th><th>Branch Code</th></tr></thead><tbody>";
				 	 for (var i = 0; i < cpDebitMisResultArr.length; i++) {

				      var cdsGenearationStatus=cpDebitMisResultArr[i]["cdsGenearationStatus"];
					  if(cdsGenearationStatus === null){
						  cdsGenearationStatus="";
					  }
					  var cdsGenearationRemarks=cpDebitMisResultArr[i]["cdsGenearationRemarks"];
					  if(cdsGenearationRemarks === null){
						  cdsGenearationRemarks="";
					  }
					  var cdsNumber=cpDebitMisResultArr[i]["cdsNumber"];
					  if(cdsNumber === null){
						  cdsNumber="";
					  }
					  var sapProcessDateTime=cpDebitMisResultArr[i]["sapProcessDateTime"];
					  if(sapProcessDateTime === null){
						  sapProcessDateTime="";
					  }
					  var sapDocNumber=cpDebitMisResultArr[i]["sapDocNumber"];
					  if(sapDocNumber === null){
						  sapDocNumber="";
					  }
					  var cdsDate=cpDebitMisResultArr[i]["cdsDate"];
					  if(cdsDate === null){
						  cdsDate="";
					  }
					  var closureDate=cpDebitMisResultArr[i]["closureDate"];
					  if(closureDate === null){
						  closureDate="";
					  }
					  var branchCode=cpDebitMisResultArr[i]["branchCode"];
					  if(branchCode === null){
						  branchCode="";
					  }
					  
					  finalData =finalData + "<tr><td>" +(i+1)+ "</td><td>" +cpDebitMisResultArr[i]["shipmentNumber"]+ "</td><td>" +cpDebitMisResultArr[i]["blockedProcessDateTime"]  + "</td><td>" +cpDebitMisResultArr[i]["blockedUserID"]+ "</td><td>" +cpDebitMisResultArr[i]["blockedstatus"]+ "</td><td>" + cpDebitMisResultArr[i]["blockedRemarks"] + "</td><td>" +cdsGenearationStatus+ "</td><td>" +cdsGenearationRemarks+ "</td><td>" +cdsNumber+ "</td><td>" +sapProcessDateTime+ "</td><td>" + cpDebitMisResultArr[i]["sapUserID"] + "</td><td>" +sapDocNumber+ "</td><td>" +cdsDate+ "</td><td>" +closureDate+ "</td><td>" +branchCode+ "</td></tr>";
				       
				 } 
					 //alert("Hi9");
					 
				  finalData=finalData+"</tbody>";
				  $("#example").html(finalData);
		        $("#example").DataTable().search( '' ).columns().search( '' ).draw();
		        document.getElementById("secondHit").value="Yes";
		        $("#table-div").show();
		 }else{
				//alert("Hi7");
				
			 var dataTable = $('#example').DataTable();
			    dataTable.clear();
			    
			
			    for (var i = 0; i < cpDebitMisResultArr.length; i++) {

			    	  var cdsGenearationStatus=cpDebitMisResultArr[i]["cdsGenearationStatus"];
					  if(cdsGenearationStatus === null){
						  cdsGenearationStatus="";
					  }
					  var cdsGenearationRemarks=cpDebitMisResultArr[i]["cdsGenearationRemarks"];
					  if(cdsGenearationRemarks === null){
						  cdsGenearationRemarks="";
					  }
			    	  var cdsNumber=cpDebitMisResultArr[i]["cdsNumber"];
					  if(cdsNumber === null){
						  cdsNumber="";
					  }
					  var sapProcessDateTime=cpDebitMisResultArr[i]["sapProcessDateTime"];
					  if(sapProcessDateTime === null){
						  sapProcessDateTime="";
					  }
					  var sapDocNumber=cpDebitMisResultArr[i]["sapDocNumber"];
					  if(sapDocNumber === null){
						  sapDocNumber="";
					  }
					  var cdsDate=cpDebitMisResultArr[i]["cdsDate"];
					  if(cdsDate === null){
						  cdsDate="";
					  }
					  var closureDate=cpDebitMisResultArr[i]["closureDate"];
					  if(closureDate === null){
						  closureDate="";
					  }
					  var branchCode=cpDebitMisResultArr[i]["branchCode"];
					  if(branchCode === null){
						  branchCode="";
					  }
			        dataTable.row.add([ (i+1) ,
					        			   cpDebitMisResultArr[i]["shipmentNumber"],
					        			   cpDebitMisResultArr[i]["blockedProcessDateTime"] ,
					        			   cpDebitMisResultArr[i]["blockedUserID"],
					        			   cpDebitMisResultArr[i]["blockedstatus"], 
					        			   cpDebitMisResultArr[i]["blockedRemarks"] ,
					        			   cdsGenearationStatus ,
					        			   cdsGenearationRemarks ,
					        			   cdsNumber,
					        			   sapProcessDateTime, 
					        			   cpDebitMisResultArr[i]["sapUserID"] ,
					        			   sapDocNumber,
					        			   cdsDate, 
					        			   closureDate ,
					        			   branchCode
					    ]).search( '' ).columns().search( '' ).draw();
			        $("#table-div").show();
				 }
			 }	 
	}
} */

</script>
</html>