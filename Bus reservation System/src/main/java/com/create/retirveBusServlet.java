package com.create;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/retirveBusServlet")
public class retirveBusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//all bus list
		List<bus> busList = busDbUtil.getBusDetails();
		request.setAttribute("busList", busList);
		
		//last 5 bus details
		List<bus> latestBus = busDbUtil.getLastBusDetails();
		request.setAttribute("latestBus", latestBus);
		
		request.getRequestDispatcher("BusList.jsp").forward(request, response);
	}

}
