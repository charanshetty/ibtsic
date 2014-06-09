package org.iiitb.ibtsic.action.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.iiitb.ibtsic.action.model.Node;
import org.iiitb.ibtsic.action.model.Run;

public class PathDao
{
	private static final String GET_NTH_NODE_IN_PATH_QUERY=
			"select Node.* from Node, PathNode, Path where Node.id=PathNode.nodeId and PathNode.pathId=Path.id and Path.name=? and PathNode.seqNo=?;"; 
	
	private static final String GET_NODE_COUNT_IN_PATH_QUERY=
			"select max(seqNo) from PathNode, Path where PathNode.pathId=Path.id and Path.name=?;";
	
	private static final String GET_ALL_RUNS_ON_PATH=
			"select Run.* from Run, Path where Run.pathId=Path.id and Path.name=? order by Run.number;";
	
	private Connection cn;
	
	public PathDao(Connection cn)
	{
		this.cn=cn;
	}
	
	public Node getNthNodeInPath(String pathName, int n) throws SQLException
	{
		Node r=null;
		PreparedStatement ps=cn.prepareStatement(GET_NTH_NODE_IN_PATH_QUERY);
		int ind=0;
		ps.setString(++ind, pathName);
		ps.setInt(++ind, n);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
			r=new Node(rs.getInt("id"),
					rs.getString("name"), 
					rs.getDouble("latitude"), 
					rs.getDouble("longitude"));

		rs.close();
		ps.close();
		return r;
	}
	
	public int getNodeCountInPath(String pathName) throws SQLException
	{
		int r=-1;
		PreparedStatement ps=cn.prepareStatement(GET_NODE_COUNT_IN_PATH_QUERY);
		ps.setString(1, pathName);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
			r=rs.getInt(1);
		rs.close();
		ps.close();
		return r;
	}
	
	public Node getSourceNodeOfPath(String pathName) throws SQLException
	{
		return getNthNodeInPath(pathName, 1);
	}
	
	public Node getDestinationNodeOfPath(String pathName) throws SQLException
	{
		return getNthNodeInPath(pathName, getNodeCountInPath(pathName));
	}
	
	public List<Run> getAllRunsOnPath(String pathName) throws SQLException
	{
		List<Run> r=new ArrayList<Run>();
		PreparedStatement ps=cn.prepareStatement(GET_ALL_RUNS_ON_PATH);
		ps.setString(1, pathName);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
			r.add(new Run(rs.getInt("id"),
					rs.getInt("number"), 
					rs.getString("startTime"), 
					rs.getString("endTime")));
		rs.close();
		ps.close();
		return r;
	}
}
