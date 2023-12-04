package com.create;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/insertBusServlet")
public class insertBusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// get and store values to variables which passing from the jsp
		String busRegistrationNo = request.getParameter("regNo");
		String type = request.getParameter("type");
		String name = request.getParameter("name");
		String capacityString = request.getParameter("capacity");
		String route = request.getParameter("route");
		String permitNo = request.getParameter("permitNo");
		int capacity = 0; // declare capacity variable for Casting 
		
		boolean isTrue;
		
		try {
			capacity = Integer.parseInt(capacityString); // cast String to int
		}catch(NumberFormatException e) {
			e.printStackTrace();
		}		
		
		isTrue = busDbUtil.insertBus(busRegistrationNo, type, name, capacity, route, permitNo); //callinsert bus method 
		
		if(isTrue == true){
			request.setAttribute("successMessage", "Bus registered successfully!");
		}else {
			request.setAttribute("errorMessage", "Bus registration failed. Please try again.");
		}
		// forward to the jsp page
        request.getRequestDispatcher("BusInsert.jsp").forward(request, response);
	}

}
