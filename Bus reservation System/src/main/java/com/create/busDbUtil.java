package com.create;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class busDbUtil {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs =null;
	
	//add new bus method
	public static boolean insertBus(String regno, String type, String name, int capacity, String route, String permitNo) {
	    boolean isSuccess = false;

	    try {
	        // call database connection
	        con = dbConnect.getConnection();
	        stmt = con.createStatement();

	        // sql statement
	        String sql = "INSERT INTO Bus VALUES(0, '" + regno + "', '" + type + "', '" + name + "', '" + capacity + "', '" + route + "', '" + permitNo + "')";
	        int response = stmt.executeUpdate(sql);

	        if (response > 0) {
	            isSuccess = true;
	        } else {
	            isSuccess = false;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return isSuccess;
	}

	
	//get all bus method
	public static List<bus> getBusDetails(){
		//declere arraylist to save the data
		ArrayList<bus> busList = new ArrayList<>();
		
		try {
			
			//establish the database connection
			con = dbConnect.getConnection();
			stmt = con.createStatement();
			
			//sql query
			String sql = "SELECT * FROM Bus";
			rs = stmt.executeQuery(sql);
			
			//read data
	        while (rs.next()) {
	            bus bus = new bus();// create bus object for save data
	            bus.setBusRegistrationNo(rs.getString("busRegistrationNo"));
	            bus.setType(rs.getString("type"));
	            bus.setName(rs.getString("name"));
	            bus.setCapacity(rs.getInt("capacity"));
	            bus.setRoute(rs.getString("route"));
	            bus.setPermitNo(rs.getString("permitNo"));

	            busList.add(bus);// pass bus object to buslist array
	        }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return busList;
	}
	
	//get last 4 bus 
		public static List<bus> getLastBusDetails(){
			//declere arraylist to save the data
			ArrayList<bus> busList = new ArrayList<>();
			
			try {
				
				//establish the database connection
				con = dbConnect.getConnection();
				stmt = con.createStatement();
				
				//sql query
				String sql = "SELECT * FROM Bus ORDER BY busRegistrationNo DESC LIMIT 4";
				rs = stmt.executeQuery(sql);
				
				//read data
		        while (rs.next()) {
		            bus bus = new bus();// create bus object for save data
		            bus.setBusRegistrationNo(rs.getString("busRegistrationNo"));
		            bus.setType(rs.getString("type"));
		            bus.setName(rs.getString("name"));
		            bus.setCapacity(rs.getInt("capacity"));
		            bus.setRoute(rs.getString("route"));
		            bus.setPermitNo(rs.getString("permitNo"));

		            busList.add(bus);// pass bus object to buslist array
		        }
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return busList;
		}
	
		//update bus details method
		public static boolean updatebus(String regno, String type, String name, int capacity, String route, String permitNo) {
			boolean isSuccess = false;
			
			try {
				//call database connection 
				con = dbConnect.getConnection();
				stmt = con.createStatement();
				
				//sql statement
				String sql = "UPDATE Bus SET type = '" + type + "', name = '" + name + "', capacity = " + capacity + ", route = '" + route + "', permitNo = '" + permitNo + "' WHERE busRegistrationNo = '" + regno + "'"; 
				int response = stmt.executeUpdate(sql);
				
				if(response > 0) {
					isSuccess = true; 
				}else {
					isSuccess = false;
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}

			return isSuccess;
			
		}
		
		//delete bus details method
		public static boolean deleteBus(String regNo) {
			boolean isSuccess = false;
			
			try {
				//call database connection 
				con = dbConnect.getConnection();
				stmt = con.createStatement();
				
				//sql statement
				String sql = "DELETE FROM Bus WHERE busRegistrationNo = '"+regNo+"'"; 
				int response = stmt.executeUpdate(sql);
				
				if(response > 0) {
					isSuccess =true;
				}else {
					isSuccess = false;
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return isSuccess;
		}
		
}
