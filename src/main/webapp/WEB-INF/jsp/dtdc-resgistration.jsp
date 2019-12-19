<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>dtdc-resgistration</title>
</head>
<body>
	<h1>dtdc-resgistration</h1>
	<%-- <form action=""> --%>
	<form:form modelAttribute="dtdcRegistration">
		<div id="error-div">
			<span style="color: red">
				<form:errors path="*"/>
			</span>
		</div>
		<div id="address-div">
			<table>
				<tr>
					<td>Address Line1</td>
					<td>
						<form:input path="addressLine1"/>
					</td>
				</tr>
				<tr>
					<td>Address Line2</td>
					<td><form:input path="addressLine2"/></td>
				</tr>
				<tr>
					<td>city</td>
					<td><form:input path="city"/></td>
				</tr>
				<tr>
					<td>state</td>
					<td><form:input path="state"/></td>
				</tr>
				<tr>
					<td>country</td>
					<td><form:input path="country"/></td>
				</tr>
				<tr>
					<td>zip</td>
					<td><form:input path="zip"/></td>
				</tr>
			</table>
		</div>

		 <div id="user-div">
			<table>
				<tr>
					<td>name</td>
					<td><form:input path="name"/></td>
				</tr>
				<tr>
					<td>phone</td>
					<td><form:input path="phone"/></td>
				</tr>
				<tr>
					<td>email</td>
					<td><form:input path="email"/></td>
				</tr>
				<tr>
					<td>dob</td>
					<td><form:input path="dob" type="date"/></td>
				</tr>
			</table>
		</div>
		<div id="login-info-div">
			<table>
				<tr>
					<td>user name</td>
					<td><form:input path="userName"/></td>
				</tr>
				<tr>
					<td>password</td>
					<td><form:input path="password" type="password"/></td>
				</tr>
				<tr>
					<td>confirm password</td>
					<td><input type="password" name="confirmPassword"><%-- <form:input path=""/> --%></td>
				</tr>
				<tr>
					<td>user type</td>
					<td>
					<form:select path="userType">
						<form:option value="">select</form:option>
						<form:option value="corporate">corporate</form:option>
						<form:option value="channel-pattner">channel-pattner</form:option>
						<form:option value="delivery-pattner">delivery-pattner</form:option>
					</form:select>	
					</td>
				</tr>
			</table>
		</div>
		<!--<div id="account-div">
			<table>
				<tr>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div> -->

		<div id="submit-div">
			<table>
				<tr>
					<td><input type="submit" value="register"></td>
					<td><input type="reset" value="reset"></td>
				</tr>
			</table>
		</div>
	<%-- </form> --%>
	</form:form>
	<a href="/dtdc-home.htm">back</a>
</body>
</html>