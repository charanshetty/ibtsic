<%@page import="org.iiitb.ibtsic.action.model.Path"%>
<%@page import="org.iiitb.ibtsic.action.model.Bus"%>
<%@page import="java.util.List"%>
<%@page import="org.iiitb.ibtsic.action.model.Node"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Author: Joshi Dnyanesh Madhav -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Bus Details</title>
</head>
<body>
	<div><h1><a href="default.jsp" style="text-decoration: none; color: gray;">IBTSIC Admin</a></h1></div>
	<hr />
	<div style="float: left; width: 300px; color: #555555; background-color: #efefef; height: 100%; padding-left: 10px;">
		<h4>Menu</h4>
		<hr />
		<a href="addNodeAction" style="text-decoration: none; color: gray;">Add New Bus Stop</a><br />
		<a href="editNodeAction" style="text-decoration: none; color: gray;">Edit Bus Stop Details</a><br />
		<a href="deleteNodeAction" style="text-decoration: none; color: gray;">Delete Bus Stop</a><br />
		<hr />
		<a href="addPathAction" style="text-decoration: none; color: gray;">Add New Bus Route</a><br />
		<a href="deletePathAction" style="text-decoration: none; color: gray;">Delete Bus Route</a><br />
		<hr />
		<a href="addBusAction" style="text-decoration: none; color: gray;">Add New Bus</a><br />
		<a href="editBusAction" style="text-decoration: none; color: gray;">Edit Bus Details &gt;</a><br />
		<a href="deleteBusAction" style="text-decoration: none; color: gray;">Delete Bus</a><br />
		<hr />
	</div>
	<div style="margin-left: 350px;">
		<h2>Edit Bus Details</h2>
		<form id='frmEditBus' action="editBusAction" method="post">
			<input id="pathName" name="pathName" type="hidden" value="" />
			<table>
				<tr>
					<td>Select Bus to Edit: </td>
					<td>
						<select id="busId" name="busId" onchange="onChange_bus(this)">
							<option></option>
							<%for(Bus bus:(List<Bus>)request.getAttribute("busList")) {%>
								<option value="<%=bus.id+"|"+bus.regNo+"|"+bus.onwardPathId %>"><%=bus.regNo %></option>
							<%} %>
						</select>
					</td>
				</tr>
				<tr>
					<td>New Registration No.: </td>
					<td><input id="regNo" name="regNo" type="text" /></td>
				</tr>
				<tr>
					<td>New Route: </td>
					<td>
						<select id="pathId" name="pathId">
							<option></option>
							<%for(Path path:(List<Path>)request.getAttribute("pathList")) {%>
								<option value='<%=path.id %>'><%=path.name.split("[.]")[0] %></option>
							<%} %>
						</select>
					</td>
				</tr>
			</table><br />
			<input type="button" value="Done" onclick="onClick_done()" /><br />
		</form>
		<%if(request.getAttribute("message")!=null) {%>
			<%=request.getAttribute("message").toString() %>
		<%} %>
	</div>
</body>
<script type="text/javascript">
	function onChange_bus(l)
	{
		var a=l.value.split('|');
		document.getElementById('regNo').value=a[1];
		document.getElementById('pathId').value=a[2];
	}
	
	function onClick_done()
	{
		if(document.getElementById('busId').value=='')
			alert('Please select a bus.');
		else if(document.getElementById('regNo').value=='')
			alert('Registration No. is empty.');
		else if(document.getElementById('pathId').value=='')
			alert('Please select a path.');
		else
		{
			var s=document.getElementById('pathId');
			document.getElementById('pathName').value=s.options[s.selectedIndex].text;
			document.getElementById('frmEditBus').submit();
		}
	}
</script>
</html>