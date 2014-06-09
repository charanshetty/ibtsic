package org.iiitb.ibtsic.action.model;

public class Run
{
	public int id;
	public int number;
	public String startTime;
	public String endTime;
	
	public Run(int id, int number, String startTime, String endTime)
	{
		this.id=id;
		this.number=number;
		this.startTime=startTime;
		this.endTime=endTime;
	}
}
