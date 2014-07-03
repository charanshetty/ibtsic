package org.iiitb.ibtsicclienttrafficpolice;

import java.util.ArrayList;
import java.util.List;

import org.iiitb.ibtsicclienttrafficpolice.net.HttpConnection;

import android.os.Bundle;
import android.app.Activity;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.Menu;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends Activity {

	EditText name, description, validity, serverDetails;
	AutoCompleteTextView node1Name, node2Name;
	ArrayAdapter<String> adapter1, adapter2;
	List<String> l1=new ArrayList<String>();
	List<String> l2=new ArrayList<String>();
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		name=(EditText)findViewById(R.id.editText1);
		description=(EditText)findViewById(R.id.editText2);
		validity=(EditText)findViewById(R.id.editText3);
		serverDetails=(EditText)findViewById(R.id.editText4);
		serverDetails.setText(this.getIntent().getExtras().getString("serverDetailsText"));
		node1Name=(AutoCompleteTextView)findViewById(R.id.autoCompleteTextView1);
		node2Name=(AutoCompleteTextView)findViewById(R.id.autoCompleteTextView2);
		
		node1Name.addTextChangedListener(new TextWatcher() {
			
			@Override
			public void onTextChanged(CharSequence arg0, int arg1, int arg2, int arg3) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void beforeTextChanged(CharSequence arg0, int arg1, int arg2,
					int arg3) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void afterTextChanged(Editable arg0) {
				// TODO Auto-generated method stub
				try
				{
					if(!serverDetails.getText().toString().trim().equals(""))
					{
						Thread t=new Thread(
							new HttpConnection("sendHttpGetRequest", 
								"http://"+serverDetails.getText().toString()+"/IbtsicServer/getNodeNamesWithPrefixAction?nodeNamePrefix="+node1Name.getText().toString(),
								adapter1));
						t.start();
					}
				}
				catch(Exception e)
				{
				}
			}
		});
		
		adapter1 = new ArrayAdapter<String>(this, android.R.layout.simple_dropdown_item_1line, l1);
		node1Name.setThreshold(1);
		node1Name.setAdapter(adapter1);
		
		node2Name.addTextChangedListener(new TextWatcher() {
			
			@Override
			public void onTextChanged(CharSequence arg0, int arg1, int arg2, int arg3) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void beforeTextChanged(CharSequence arg0, int arg1, int arg2,
					int arg3) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void afterTextChanged(Editable arg0) {
				// TODO Auto-generated method stub
				try
				{
					if(!serverDetails.getText().toString().trim().equals(""))
					{
						Thread t=new Thread(
							new HttpConnection("sendHttpGetRequest", 
								"http://"+serverDetails.getText().toString()+"/IbtsicServer/getNodeNamesWithPrefixAction?nodeNamePrefix="+node2Name.getText().toString(),
								adapter2));
						t.start();
					}
				}
				catch(Exception e)
				{
				}
			}
		});
		
		adapter2 = new ArrayAdapter<String>(this, android.R.layout.simple_dropdown_item_1line, l2);
		node2Name.setThreshold(1);
		node2Name.setAdapter(adapter2);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	public void button1_onClick(View view)
	{
		try
		{
			if(!serverDetails.getText().toString().trim().equals("")
					&& !name.getText().toString().trim().equals("")
					&& !description.getText().toString().trim().equals("")
					&& !validity.getText().toString().trim().equals("")
					&& !node1Name.getText().toString().trim().equals("")
					&& !node2Name.getText().toString().trim().equals(""))
			{
				new HttpConnection().sendHttpGetRequest("http://"
					+serverDetails.getText().toString()
					+"/IbtsicServer/addAnnouncementAction?"
					+"name="+name.getText().toString()
					+"description="+description.getText().toString()
					+"validity="+validity.getText().toString()
					+"node1Name="+node1Name.getText().toString()
					+"node2Name="+node2Name.getText().toString());
				
				Toast.makeText(this, "Success!", Toast.LENGTH_SHORT).show();
				
				name.setText("");
				description.setText("");
				validity.setText("");
				node1Name.setText("");
				node2Name.setText("");
			}
			else
				Toast.makeText(this, "One or more fields are empty.", Toast.LENGTH_SHORT).show();
		}
		catch(Exception e)
		{
			Toast.makeText(this, "Error!", Toast.LENGTH_SHORT).show();
		}
	}
}
