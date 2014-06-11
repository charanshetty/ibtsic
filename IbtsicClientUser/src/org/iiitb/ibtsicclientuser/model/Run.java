package org.iiitb.ibtsic.action.model;

public class Run
{
	public int id;
	public int number;
	public String startTime;
	public String endTime;
	public int pathId;
	
	public Run(int id, int number, String startTime, String endTime, int pathId)
	{
		this.id=id;
		this.number=number;
		this.startTime=startTime;
		this.endTime=endTime;
		this.pathId=pathId;
	}
}
