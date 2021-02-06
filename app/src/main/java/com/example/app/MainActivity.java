package com.example.app;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import java.sql.ResultSet;
import java.sql.Statement;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button boton = findViewById(R.id.button);
        boton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                consultarUser();
            }
        });


    }


    //ejemplo de consulta
    public void consultarUser(){
        try{
            conectionDB conection = new conectionDB();

            //Statement stm = conectionDB.conexionDBC().createStatement();
            Statement stm = conection.conexionDB().createStatement();
            ResultSet rs = stm.executeQuery("SELECT nombre FROM user WHERE id=1");
            if(rs.next()){
                Toast.makeText(getApplicationContext(),rs.getString(1),Toast.LENGTH_SHORT).show();

            }
        }catch(Exception e){
            Toast.makeText(getApplicationContext(),e.getMessage(),Toast.LENGTH_LONG).show();
        }
    }


}
