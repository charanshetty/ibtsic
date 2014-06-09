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
	<form id='frmAddNode' action="addNodeAction" method="post">
		<table>
			<tr>
				<td>Bus Stop Name: </td>
				<td><input id="name" name="name" type="text" /></td>
			</tr>
			<tr>
				<td>Latitude: </td>
				<td><input id="latitude" name="latitude" type="text" /></td>
			</tr>
			<tr>
				<td>Longitude: </td>
				<td><input id="longitude" name="longitude" type="text" /></td>
			</tr>
		</table>
		<input type="button" value="Add" onclick="onClick_add()" /><br />
	</form>
	<%if(request.getAttribute("message")!=null) {%>
		<%=request.getAttribute("message").toString() %>
	<%} %>
</body>
<script type="text/javascript">
	function onClick_add()
	{
		if(document.getElementById('name').value=='')
			alert('Bus stop name is empty.');
		else if(document.getElementById('latitude').value=='')
			alert('Latitude is empty.');
		else if(document.getElementById('longitude').value=='')
			alert('Longitude is empty.');
	}
</script>
</html>