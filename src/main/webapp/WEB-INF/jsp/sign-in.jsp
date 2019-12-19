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
<title>Insert title here</title>
</head>
<body>
	<div id="login-div">
		<form:form action="/sign-in.htm" modelAttribute="loginCommand">
			<span style="color: red">
				<form:errors path="*"/>
			</span>
			<table>
				<tr>
					<td>user name :</td>
					<td><form:input path="userName" /></td>
				</tr>
				<tr>
					<td>password :</td>
					<td><form:input type="password" path="password" /></td>
				</tr>
				<tr>
					<td>usertype :</td>
					<td><form:select path="userType">
							<form:option value="">select</form:option>
							<form:option value="corporate">corporate</form:option>
							<form:option value="channel-pattner">channel-pattner</form:option>
							<form:option value="delivery-pattner">delivery-pattner</form:option>
						</form:select></td>
				</tr>
				<tr>
					<td><input type="submit" value="login"></td>
					<td><input type="reset" value="reset"></td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>