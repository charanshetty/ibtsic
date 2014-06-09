<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add New Bus Stop</title>
</head>
<body>
	<h2>Add New Bus Stop</h2>
	<form action="addNodeAction" method="post">
		<table>
			<tr>
				<td>Bus Stop Name: </td>
				<td><input name="name" type="text" /></td>
			</tr>
			<tr>
				<td>Latitude: </td>
				<td><input name="latitude" type="text" /></td>
			</tr>
			<tr>
				<td>Longitude: </td>
				<td><input name="longitude" type="text" /></td>
			</tr>
		</table>
		<input type="submit" value="Add" /><br />
	</form>
	<%if(request.getAttribute("message")!=null) {%>
		<%=request.getAttribute("message").toString() %>
	<%} %>
</body>
</html>