package org.iiitb.ibtsic.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class S1 extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		resp.setContentType("text");
		String p1=req.getParameter("p1");
		String p2=req.getParameter("p2");
		PrintWriter pw=resp.getWriter();
		pw.print("You gave p1="+p1+" and p2="+p2);
		pw.close();
	}
}
