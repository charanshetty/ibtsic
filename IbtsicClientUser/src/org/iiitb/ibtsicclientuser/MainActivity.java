package org.iiitb.ibtsicclientuser;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.widget.TextView;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.iiitb.ibtsicclientuser.net.HttpConnection;

public class MainActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu)
	{
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}
	
	@Override
	protected void onStart() {
		super.onStart();
		
		try
		{
			TextView tv=(TextView)findViewById(R.id.tv);
			tv.setText(HttpConnection.sendHttpGetRequest("http://www.google.com").toString()); 
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
