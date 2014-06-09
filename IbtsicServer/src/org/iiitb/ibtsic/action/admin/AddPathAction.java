package org.iiitb.ibtsic.action.admin;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iiitb.ibtsic.action.dao.NodeDao;
import org.iiitb.util.ConnectionPool;

public class AddPathAction extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException		
	{
		try
		{
			Connection cn=ConnectionPool.getConnection();
			NodeDao nodeDao=new NodeDao(cn);
			request.setAttribute("nodeList", nodeDao.getAllNodes());
			ConnectionPool.freeConnection(cn);
			
			request.getRequestDispatcher("Path/AddPathPage.jsp").forward(request, response);
		}
		catch(Exception e)
		{
			request.getRequestDispatcher("Path/AddPathPage.jsp").forward(request, response);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException
	{
		try
		{
			for(String s:request.getParameterValues("nodesInPath"))
				System.out.println(s);
			for(String s:request.getParameterValues("runsOnPath"))
				System.out.println(s);
			
			request.setAttribute("message", "Success");
			doGet(request, response);
		}
		catch(Exception e)
		{
			request.setAttribute("message", "Failure");
			doGet(request, response);
		}
	}
}
