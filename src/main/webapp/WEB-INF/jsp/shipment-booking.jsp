<%@page import="org.apache.catalina.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Done Here</title>
<script type="text/javascript" src="webjars/jquery/2.2.4/jquery.min.js" ></script>

<script type="text/javascript">

	$(window).load(function() {
		 var userId = '${userId}';
		

		 if(userId==""){

			 window.location.replace("http://localhost:7777/logout.htm");
		}
	});
	$(document).ready(function() {

		$("#fromCity").change(function(){

			var city=$("#fromCity").val();

			$("#source").val(city);
		});

		$("#toCity").change(function(){

			var toCity=$("#toCity").val();

			var fromCity=$("#fromCity").val();

			if(fromCity==toCity){
				alert("From city and To city should not be same");
				$("#destination").val("");
				$("#toCity").val(0) ;
				return;
			}
			$("#destination").val(toCity);
			getBookingPrice();
		});
	});

	function getBookingPrice(){

		var source=$("#source").val();
		var dest=$("#destination").val();


		var search={};
		search["source"]=source;
		search["destination"]=dest;

		  $.ajax({
              type: "POST",
              contentType: "application/json",
              url: "/api/find-price",
              data: JSON.stringify(search),
              dataType: 'json',
              cache: false,
              timeout: 600000,
              success: function (result) {
            	  populatePrice(result);
              },
              error: function (e) {

              }
          });

   
		
	};

	function populatePrice(result){

		$("#price").val(result.price);
	}
</script>
</head>
<body bgcolor="GreenYellow">
	<%
		
	%>
	<form:form modelAttribute="bookingCommand">
		<div id="error-div">
			<span style="color: red"> <form:errors path="*" /></span>
		</div>
		<div id="customer-details-div">
			<table border="1px" style="background-color: Fuchsia">
				<tr>
					<td>Name:</td>
					<td><form:input path="name" /></td>
				</tr>
				<tr>
					<td>Phone:</td>
					<td><form:input path="phone" /></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><form:input path="email" /></td>
				</tr>
				<tr>
					<td height="30px">
						<div align="center"
							style="width: 250px; height: 70%; background-color: Yellow; border-radius: 7px;">FORM</div>
					</td>
					<td height="30px">
						<div align="center"
							style="width: 250px; height: 70%; background-color: Yellow; border-radius: 7px;">TO</div>
					</td>
				</tr>
				<tr>
					<td>
						<table border="1px" style="background-color: Turquoise">
							<tr>
								<td>address Line1:</td>
								<td><form:input path="fromAddressLine1" /></td>
							</tr>
							<tr>
								<td>address Line2:</td>
								<td><form:input path="fromAddressLine2" /></td>
							</tr>
							<tr>
								<td>city:</td>
								<td><form:select path="fromCity" class="" id="fromCity">
										<form:option value="">Select</form:option>
										<form:option value="Banglore">Banglore</form:option>
										<form:option value="Chennai">Chennai</form:option>
										<form:option value="Hydrabad">Hydrabad</form:option>
										<form:option value="Bhubaneswar">Bhubaneswar</form:option>
									</form:select></td>
							</tr>
							<tr>
								<td>state:</td>
								<td><form:input path="fromState" /></td>
							</tr>
							<tr>
								<td>country:</td>
								<td><form:input path="fromCountry" /></td>
							</tr>
							<tr>
								<td>zip:</td>
								<td><form:input path="fromZip" /></td>
							</tr>
						</table>
					</td>
					<td>
						<table border="1px" style="background-color: Turquoise">
							<tr>
								<td>address Line1:</td>
								<td><form:input path="toAddressLine1" /></td>
							</tr>
							<tr>
								<td>address Line2:</td>
								<td><form:input path="toAddressLine2" /></td>
							</tr>
							<tr>
								<td>city:</td>
								<td><form:select path="toCity" id="toCity">
										<form:option value="">Select</form:option>
										<form:option value="Banglore">Banglore</form:option>
										<form:option value="Chennai">Chennai</form:option>
										<form:option value="Hydrabad">Hydrabad</form:option>
										<form:option value="Bhubaneswar">Bhubaneswar</form:option>
									</form:select></td>
							</tr>
							<tr>
								<td>state:</td>
								<td><form:input path="toState" /></td>
							</tr>
							<tr>
								<td>country:</td>
								<td><form:input path="toCountry" /></td>
							</tr>
							<tr>
								<td>zip:</td>
								<td><form:input path="toZip" /></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		<div id="booking-details-div">
			<table>
				<tr>
					<td>Vas-Prod-Cod:</td>
					<td><form:select path="vasProdCod">
							<form:option value="">select</form:option>
							<form:option value="cod">cod</form:option>
							<form:option value="fod">fod</form:option>
							<form:option value="pob">pob</form:option>
						</form:select></td>
				</tr>
				<tr>
					<td>Source:</td>
					<td><form:input path="source" id="source"/></td>
				</tr>
				<tr>
					<td>Destination</td>
					<td><form:input path="destination" id="destination"/></td>
				</tr>
				<tr>
					<td>Price:</td>
					<td><form:input path="price" /></td>
				</tr>
				<tr>
					<td>Weight:</td>
					<td><form:input path="weight" /></td>
				</tr>
				<tr>
					<td>DateOfTime:</td>
					<td><form:input path="dob" type="date" /></td>
				</tr>
				<tr>
					<td>BookingParsalType:</td>
					<td><form:select path="bookingParcelType">
							<form:option value="">select</form:option>
							<form:option value="a">A</form:option>
							<form:option value="b">B</form:option>
						</form:select></td>
				</tr>
				<tr>
					<td>Quantity:</td>
					<td>
						<form:input path="quantity" />
						<form:hidden path="userId" value="${userId}" />
					</td>
				</tr>
				<tr>
					<td><input type="submit" value="Booking" /></td>
					<td><input type="reset" value="Reset"></td>
				</tr>
			</table>
		</div>
	</form:form>
</body>
</html>