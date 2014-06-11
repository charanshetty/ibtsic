package org.iiitb.ibtsic.action.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.iiitb.ibtsic.action.model.Node;

public class NodeDao
{
	private static final String ADD_NODE_QUERY=
			"insert into Node(name, latitude, longitude) values(?, ?, ?);";
	
	private static final String GET_MAX_NODE_ID_QUERY=
			"select max(id) from Node;";
	
	private static final String GET_ALL_NODES_QUERY=
			"select * from Node order by id;";
	
	private static final String SET_NODE_DETAILS_QUERY=
			"update Node set name=?, latitude=?, longitude=? where id=?;";
	
	private static final String DELETE_NODE_QUERY=
			"delete from Node where id=?;";
	
	private Connection cn;
	
	public NodeDao(Connection cn)
	{
		this.cn=cn;
	}
	
	public int addNode(Node node) throws SQLException
	{
		int r=-1, ind=0;
		PreparedStatement ps=cn.prepareStatement(ADD_NODE_QUERY);
		ps.setString(++ind, node.name);
		ps.setDouble(++ind, node.latitude);
		ps.setDouble(++ind, node.longitude);
		ps.executeUpdate();
		ps.close();
		ps=cn.prepareStatement(GET_MAX_NODE_ID_QUERY);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
			r=rs.getInt(1);
		rs.close();
		ps.close();
		return r;
	}
	
	public List<Node> getAllNodes() throws SQLException
	{
		List<Node> r=new ArrayList<Node>();
		PreparedStatement ps=cn.prepareStatement(GET_ALL_NODES_QUERY);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
			r.add(new Node(rs.getInt("id"),
					rs.getString("name"), 
					rs.getDouble("latitude"), 
					rs.getDouble("longitude")));
		rs.close();
		ps.close();
		return r;
	}
	
	public void setNodeDetails(Node node) throws SQLException
	{
		PreparedStatement ps=cn.prepareStatement(SET_NODE_DETAILS_QUERY);
		int ind=0;
		ps.setString(++ind, node.name);
		ps.setDouble(++ind, node.latitude);
		ps.setDouble(++ind, node.longitude);
		ps.setInt(++ind, node.id);
		ps.executeUpdate();
		ps.close();
	}
	
	public void deleteNode(int nodeId) throws SQLException
	{
		PreparedStatement ps=cn.prepareStatement(DELETE_NODE_QUERY);
		ps.setInt(1, nodeId);
		ps.executeUpdate();
		ps.close();
	}
}
