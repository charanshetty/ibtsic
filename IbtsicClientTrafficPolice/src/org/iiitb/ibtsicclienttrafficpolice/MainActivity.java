package org.iiitb.ibtsicclienttrafficpolice;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;

import org.iiitb.ibtsicclienttrafficpolice.net.HttpConnection;

import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.content.res.Resources;
import android.text.Editable;
import android.text.TextWatcher;
import android.text.method.KeyListener;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends Activity {

	EditText name, description, validity;
	AutoCompleteTextView node1Name, node2Name;
	ArrayAdapter<String> adapter1, adapter2;
	List<String> l1=new ArrayList<String>();
	List<String> l2=new ArrayList<String>();
	String serverDetails="";
	
	@Override
	protected void onStart() {
		// TODO Auto-generated method stub
		super.onStart();
		
		try
		{
			File f = new File(this.getFilesDir(), ServerDetailsActivity.fname);
			FileReader fr=new FileReader(f);
			BufferedReader br=new BufferedReader(fr);
			serverDetails=br.readLine();
			br.close();
			fr.close();
		}
		catch(Exception e)
		{
			//do nothing
		}
	}
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		name=(EditText)findViewById(R.id.editText1);
		description=(EditText)findViewById(R.id.editText2);
		validity=(EditText)findViewById(R.id.editText3);
		node1Name=(AutoCompleteTextView)findViewById(R.id.autoCompleteTextView1);
		node2Name=(AutoCompleteTextView)findViewById(R.id.autoCompleteTextView2);
		
		Resources res = getResources(); 
		int color = res.getColor(android.R.color.black);
		node1Name.setTextColor(color);
		node1Name.setHintTextColor(color);
		node2Name.setTextColor(color);
		node2Name.setHintTextColor(color);
		
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
					if(!serverDetails.trim().equals(""))
					{
						Thread t=new Thread(
							new HttpConnection("sendHttpGetRequest", 
								"http://"+serverDetails+"/IbtsicServer/getNodeNamesWithPrefixAction?nodeNamePrefix="+node1Name.getText().toString(),
								adapter1));
						t.start();
					}
				}
				catch(Exception e)
				{
				}
			}
		});
		
		adapter1 = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, l1);
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
					if(!serverDetails.trim().equals(""))
					{
						Thread t=new Thread(
							new HttpConnection("sendHttpGetRequest", 
								"http://"+serverDetails+"/IbtsicServer/getNodeNamesWithPrefixAction?nodeNamePrefix="+node2Name.getText().toString(),
								adapter2));
						t.start();
					}
				}
				catch(Exception e)
				{
				}
			}
		});
		
		adapter2 = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, l2);
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
			if(!serverDetails.trim().equals("")
					&& !name.getText().toString().trim().equals("")
					&& !description.getText().toString().trim().equals("")
					&& !validity.getText().toString().trim().equals("")
					&& !node1Name.getText().toString().trim().equals("")
					&& !node2Name.getText().toString().trim().equals(""))
			{
				new HttpConnection().sendHttpGetRequest("http://"
					+serverDetails
					+"/IbtsicServer/addAnnouncementAction?"
					+"name="+name.getText().toString()
					+"&description="+description.getText().toString()
					+"&validity="+validity.getText().toString()
					+"&node1Name="+node1Name.getText().toString()
					+"&node2Name="+node2Name.getText().toString());
				
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
	
	public void button2_onClick(View view)
	{
		Intent intent=new Intent(this, ServerDetailsActivity.class);
		this.startActivity(intent);
	}
}
