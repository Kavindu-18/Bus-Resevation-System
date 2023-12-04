package com.create;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteBusServlet")
public class deleteBusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String regNo = request.getParameter("regNo");
        boolean isDeleted = busDbUtil.deleteBus(regNo);
        
        if (isDeleted) {
            response.sendRedirect("retirveBusServlet"); 
        } else {
            response.getWriter().println("Failed to delete the bus.");
        }
	}

}
