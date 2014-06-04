package org.iiitb.ibtsic.action.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BusDao
{
	private static final String UPDATE_BUS_LOCATION_QUERY=
			"update Bus set latitude=?, longitude=? where id=?;"; 
	
	private Connection cn;
	
	public BusDao(Connection cn)
	{
		this.cn=cn;
	}
	
	public void updateBusLocation(int busId, double latitude, double longitude) throws SQLException
	{
		int ind=0;
		PreparedStatement ps=cn.prepareStatement(UPDATE_BUS_LOCATION_QUERY);
		ps.setDouble(++ind, latitude);
		ps.setDouble(++ind, longitude);
		ps.setInt(++ind, busId);
		ps.executeUpdate();
		ps.close();
	}
}
