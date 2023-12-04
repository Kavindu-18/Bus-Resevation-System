package com.create;

public class bus {

	private String busRegistrationNo;
	private String type;
	private String name;
	private int capacity;
	private String route;
	private String permitNo;
	
	
	// default constructor
	public bus() {
		super();
	}
 //overload constructor
	public bus(String busRegistrationNo, String type, String name, int capacity, String route, String permitNo) {

		this.busRegistrationNo = busRegistrationNo;
		this.type = type;
		this.name = name;
		this.capacity = capacity;
		this.route = route;
		this.permitNo = permitNo;
	}

	//all getter and setter are below
	public String getBusRegistrationNo() {
		return busRegistrationNo;
	}


	public void setBusRegistrationNo(String busRegistrationNo) {
		this.busRegistrationNo = busRegistrationNo;
	}

	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getCapacity() {
		return capacity;
	}


	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}


	public String getRoute() {
		return route;
	}


	public void setRoute(String route) {
		this.route = route;
	}


	public String getPermitNo() {
		return permitNo;
	}


	public void setPermitNo(String permitNo) {
		this.permitNo = permitNo;
	}
}
