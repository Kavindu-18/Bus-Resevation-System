package com.create;

import java.sql.Connection;
import java.sql.DriverManager;

public class dbConnect {

	//declare global variables
	private static String url = "jdbc:mysql://localhost:3306/juniors_oop"; //db url
	private static String user ="root"; //db user
	private static String password = "Sithanga@1231"; //user password
	private static Connection con;
	
	//connection establish method
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, user, password);
			System.out.println("Database Connection is successfull..!!");
			
		}catch(Exception e) {
			System.out.println("Database Connection is not success..!!");
			e.printStackTrace();
		}
		
		return con;
	}

}
