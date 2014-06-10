<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add New Bus Stop</title>
</head>
<body>
	<div><h1><a href="default.jsp" style="text-decoration: none; color: gray;">IBTSIC Admin</a></h1></div>
	<hr />
	<div style="float: left; width: 300px; border-right: medium; border-style: solid; border-bottom: none; border-left: none; border-top: none; color: gray; background-color: #efefef; height: 700px; padding-left: 10px;">
		<h4>Menu</h4>
		<a href="addNodeAction" style="text-decoration: none; color: gray;">Add New Bus Stop &gt;</a><br />
		<a href="addPathAction" style="text-decoration: none; color: gray;">Add New Bus Route</a><br />
		<a href="addBusAction" style="text-decoration: none; color: gray;">Add New Bus</a><br />
	</div>
	<div style="margin-left: 350px">
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
			</table><br />
			<input type="button" value="Add" onclick="onClick_add()" /><br />
		</form>
		<%if(request.getAttribute("message")!=null) {%>
			<%=request.getAttribute("message").toString() %>
		<%} %>
	</div>
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