package com.create;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateBusServlet")
public class updateBusServlet extends HttpServlet {
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
		
		try {
			capacity = Integer.parseInt(capacityString); // cast String to int
		}catch(NumberFormatException e) {
			e.printStackTrace();
		}
		
		boolean isTrue;
		isTrue = busDbUtil.updatebus(busRegistrationNo, type, name, capacity, route, permitNo);
		
		if(isTrue == true){
			request.setAttribute("successMessage", "Bus registered successfully!");
		}else {
			request.setAttribute("errorMessage", "Bus registration failed. Please try again.");
		}
		// forward to the JSP page
        request.getRequestDispatcher("BusInsert.jsp").forward(request, response);
		
		
		
		
	}

}
