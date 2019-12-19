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
<!-- <script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/dataTables.jqueryui.min.js"></script> -->
<script defer src="../resource/fonts/js/all.js"></script>

<c:url var="home" value="/" scope="request" />

<%-- <spring:url value="../resource/core/js/jquery.1.10.2.min.js"
	var="jqueryJs" /> --%>
<%-- <script src="${jqueryJs}"></script> --%>
</head>
<body>

	<!----------------- Header Starts -------------------->
	<div class="header">
		<div class="dtdclogo">
			INTRANET<br /> <span>CP DEBIT MIS</span>
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
					<img src="./jsp/images/or.jpg" alt="" />
				</div>
				<div class="form-group col-lg-2">
					<label>Select Block CDS period</label> <input class="form-control"
						type="text" name="daterange" onclick="forDateInput()"  id="daterange" placeholder="Enter Block CDS period" />
				</div>
				<div class="form-group col-lg-1" style="text-align: center;">
					<img src="./jsp/images/or.jpg" alt="" />
				</div>
				<div class="form-group col-lg-2">
					<label>SAP Doc Number</label> <input class="form-control"
						type="text" name="sapDocNumber" id="sapDocNumber" />
				</div>
				<div class="col-lg-2">
					<label>Process Status</label> <select title="Select Process"
						class="form-control" name="proStatus" id="proStatus">
						<option>All</option>
						<option>Success</option>
						<option>Fail</option>
					</select>
				</div>
				<div class="form-group col-lg-2" style="margin-top: 20px;">
					<button type="submit"  id="submitButton" class="btn btn-success" >
						<span class="fa fa-check"></span>&nbsp;Submit
					</button>
					<button type="button" onclick="downloadExcelFile()"  id="excelDownloadButton"
						style="background: none; padding: 0px; float: right; border: none;">
						<img src="./jsp/images/excl.jpg" alt="" />
					</button>
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
<script type="text/javascript">
/* 	$(function() {
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
							picker.startDate.format('YYYY/MM/DD') + ' - '
									+ picker.endDate.format('YYYY/MM/DD'));
				});

		$('input[name="daterange"]').on('cancel.daterangepicker',
				function(ev, picker) {
					$(this).val('');
				});
	});

	


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