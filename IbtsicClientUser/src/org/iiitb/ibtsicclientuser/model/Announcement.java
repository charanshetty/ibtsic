package org.iiitb.ibtsicclientuser.model;

public class Announcement
{
	public int id;
	public String name;
	public String description;
	public String startInstant;
	public String validity;
	public int nodeId;
	
	public Announcement(int id, String name, String description, String startInstant,
			String validity, int nodeId)
	{
		this.id=id;
		this.name=name;
		this.description=description;
		this.startInstant=startInstant;
		this.validity=validity;
		this.nodeId=nodeId;
	}
}
