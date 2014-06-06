package org.iiitb.ibtsicclientuser.net;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

public class HttpConnection
{
	private static HttpClient client=new DefaultHttpClient();
	
	public static List<String> sendHttpGetRequest(String url) throws ClientProtocolException, IOException
	{
		HttpGet request = new HttpGet(url);
		HttpResponse response=client.execute(request);
		BufferedReader rd=new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
		
		String line="";
		List<String> responseLines=new ArrayList<String>();
		while ((line=rd.readLine())!=null)
			responseLines.add(line);
		
		return responseLines;
	}
}
