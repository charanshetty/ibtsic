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
	private static final String CREATE_NODE_QUERY=
			"insert into Node(name, latitude, longitude) values(?, ?, ?);"; 
	
	private static final String GET_ALL_NODES_QUERY=
			"select * from Node order by id;";
	
	private Connection cn;
	
	public NodeDao(Connection cn)
	{
		this.cn=cn;
	}
	
	public void addNode(Node node) throws SQLException
	{
		int ind=0;
		PreparedStatement ps=cn.prepareStatement(CREATE_NODE_QUERY);
		ps.setString(++ind, node.name);
		ps.setDouble(++ind, node.latitude);
		ps.setDouble(++ind, node.longitude);
		ps.executeUpdate();
		ps.close();
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
}
