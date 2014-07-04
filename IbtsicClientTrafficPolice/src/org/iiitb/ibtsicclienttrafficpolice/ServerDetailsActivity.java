package org.iiitb.ibtsicclienttrafficpolice;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.PrintWriter;

import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.view.Menu;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

public class ServerDetailsActivity extends Activity {

	EditText serverDetails;
	final static String fname="IbtsicServerDetails.txt";
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_server_details);
		
		serverDetails=(EditText)findViewById(R.id.editText11);
		
		try
		{
			File f = new File(this.getFilesDir(), fname);
			FileReader fr=new FileReader(f);
			BufferedReader br=new BufferedReader(fr);
			serverDetails.setText(br.readLine());
			br.close();
			fr.close();
		}
		catch(Exception e)
		{
			//do nothing
		}
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.server_details, menu);
		return true;
	}

	public void button1_onClick(View view)
	{
		if(!serverDetails.getText().toString().trim().equals(""))
		{
			try
			{
				File f = new File(this.getFilesDir(), fname);
				PrintWriter pw=new PrintWriter(f);
				pw.println(serverDetails.getText().toString());
				pw.close();
			}
			catch(Exception e)
			{
				Toast.makeText(this, "Server details could not be saved.", Toast.LENGTH_SHORT).show();
			}
			
			this.finish();
			/*
			Intent intent=new Intent(this, MainActivity.class);
			intent.putExtra("serverDetailsText", serverDetails.getText().toString());
			this.startActivity(intent);*/
		}
		else
			Toast.makeText(this, "The field is empty.", Toast.LENGTH_SHORT).show();
	}
}
