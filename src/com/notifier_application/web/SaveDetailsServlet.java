package com.notifier_application.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notifier_application.beans.SignupBean;
import com.notifier_application.daos.SaveDetailsDAO;

@WebServlet("/savedetails")
public class SaveDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private SaveDetailsDAO savedetailsdao;
	
	public void init()
	{
		savedetailsdao = new SaveDetailsDAO();
	}
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
		try {
			saveDetails(request,response);
		} catch (IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}
	
	private void saveDetails(HttpServletRequest request,HttpServletResponse response) throws IOException, SQLException, ServletException
	{
		String email_id = request.getParameter("email");
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		Long mobile_number = Long.parseLong(request.getParameter("mobile"));
		String password = request.getParameter("pass");
		

			SignupBean signupbean = new SignupBean();
			signupbean.setEmail_id(email_id);
			signupbean.setName(name);
			signupbean.setUsername(username);
			signupbean.setMobile_number(mobile_number);
			signupbean.setPassword(password);
			
			if(savedetailsdao.updateUser(signupbean))
			{
				RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
				dispatcher.forward(request,response);
				
			}
	}
}


