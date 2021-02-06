package com.example.app;

import android.os.StrictMode;
import android.widget.Toast;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import static java.sql.DriverManager.println;

public class conectionDB {

    public Connection conexionDB(){
        Connection cnn=null;
        try{
            StrictMode.ThreadPolicy politica = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(politica);

            Class.forName("org.gjt.mm.mysql.Driver").newInstance();
            //remotemysql.com:
            //cnn = DriverManager.getConnection("jdbc:mysql://remotemysql.com:PORT/DATABASENAME","USERNAME","PASSWORD");

            //base de datos de prueba remota
            //cnn = DriverManager.getConnection("jdbc:mysql://sql3.freesqldatabase.com:puerto/sql3391094","sql3391094","cjsgKzknrW");
            cnn = DriverManager.getConnection("jdbc:mysql://ip:3306/base de datos","usuario","contraseña");


        }catch(Exception e){
            println("Error en la conexión");
        }
        return cnn;

    }
}
