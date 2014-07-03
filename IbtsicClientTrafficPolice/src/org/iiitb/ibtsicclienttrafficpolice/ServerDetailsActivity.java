package org.iiitb.ibtsicclienttrafficpolice;

import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.view.Menu;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

public class ServerDetailsActivity extends Activity {

	EditText serverDetails;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_server_details);
		
		serverDetails=(EditText)findViewById(R.id.editText11);
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
			Intent intent=new Intent(this, MainActivity.class);
			intent.putExtra("serverDetailsText", serverDetails.getText().toString());
			this.startActivity(intent);
		}
		else
			Toast.makeText(this, "The field is empty.", Toast.LENGTH_SHORT).show();
	}
}
