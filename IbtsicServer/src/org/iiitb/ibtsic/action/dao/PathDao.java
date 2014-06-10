package org.iiitb.ibtsic.action.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.iiitb.ibtsic.action.model.Node;
import org.iiitb.ibtsic.action.model.Path;
import org.iiitb.ibtsic.action.model.Run;

public class PathDao
{
	private static final String GET_NTH_NODE_IN_PATH_QUERY=
			"select Node.* from Node, PathNode, Path where Node.id=PathNode.nodeId and PathNode.pathId=Path.id and Path.name=? and PathNode.seqNo=?;"; 
	
	private static final String GET_NODE_COUNT_IN_PATH_QUERY=
			"select max(seqNo) from PathNode, Path where PathNode.pathId=Path.id and Path.name=?;";
	
	private static final String GET_ALL_RUNS_ON_PATH=
			"select Run.* from Run, Path where Run.pathId=Path.id and Path.name=? order by Run.number;";
	
	private static final String ADD_PATH_QUERY=
			"insert into Path(name) values(?);";
	
	private static final String GET_MAX_PATH_ID_QUERY=
			"select max(id) from Path;";
	
	private static final String DELETE_ALL_NODES_IN_PATH_QUERY=
			"delete from PathNode where pathId=?;";
	
	private static final String ADD_NODE_TO_PATH_QUERY=
			"insert into PathNode(pathId, nodeId, seqNo) values(?, ?, ?);";
	
	private static final String DELETE_ALL_RUNS_ON_PATH_QUERY=
			"delete from Run where pathId=?;";
	
	private static final String ADD_RUN_ON_PATH_QUERY=
			"insert into Run(number, startTime, endTime, pathId) values(?, ?, ?, ?);";
	
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
					rs.getString("endTime"),
					rs.getInt("pathId")));
		rs.close();
		ps.close();
		return r;
	}
	
	public int addPath(Path path) throws SQLException
	{
		int r=-1;
		PreparedStatement ps=cn.prepareStatement(ADD_PATH_QUERY);
		ps.setString(1, path.name);
		ps.executeUpdate();
		ps.close();
		ps=cn.prepareStatement(GET_MAX_PATH_ID_QUERY);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
			r=rs.getInt(1);
		rs.close();
		ps.close();
		return r;
	}
	
	public void deleteAllNodesInPath(int pathId) throws SQLException
	{
		PreparedStatement ps=cn.prepareStatement(DELETE_ALL_NODES_IN_PATH_QUERY);
		ps.setInt(1, pathId);
		ps.executeUpdate();
		ps.close();
	}
	
	public int addNodesToPath(int pathId, List<Integer> nodeIdList) throws SQLException
	{
		deleteAllNodesInPath(pathId);
		
		PreparedStatement ps=cn.prepareStatement(ADD_NODE_TO_PATH_QUERY);
		int seqNo=0;
		for(int nodeId:nodeIdList)
		{
			ps.setInt(1, pathId);
			ps.setInt(2, nodeId);
			ps.setInt(3, ++seqNo);
			ps.executeUpdate();
		}
		ps.close();
		return seqNo;
	}
	
	public void deleteAllRunsOnPath(int pathId) throws SQLException
	{
		PreparedStatement ps=cn.prepareStatement(DELETE_ALL_RUNS_ON_PATH_QUERY);
		ps.setInt(1, pathId);
		ps.executeUpdate();
		ps.close();
	}
	
	public int addRunsOnPath(int pathId, List<Run> runList) throws SQLException
	{
		deleteAllRunsOnPath(pathId);
		
		PreparedStatement ps=cn.prepareStatement(ADD_RUN_ON_PATH_QUERY);
		int seqNo=0;
		for(Run run:runList)
		{
			ps.setInt(1, ++seqNo);
			ps.setString(2, run.startTime);
			ps.setString(3, run.endTime);
			ps.setInt(4, run.pathId);
			ps.executeUpdate();
		}
		ps.close();
		return seqNo;
	}
}
