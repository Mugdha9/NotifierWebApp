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
import javax.servlet.http.HttpSession;

import com.notifier_application.beans.SignupBean;
import com.notifier_application.daos.EditUserDAO;

@WebServlet("/edituser")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private EditUserDAO edituserdao;
	
	public void init()
	{
		edituserdao = new EditUserDAO();
	}
       
   	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
   	{
		try {
			display(request,response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}
	
	private void display(HttpServletRequest request,HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException
	{
		HttpSession session = request.getSession();
		String email_id = (String) session.getAttribute("email_id");
		int user_id = (int) session.getAttribute("user_id");
		if(user_id == 0)
    	{
    		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
    		dispatcher.forward(request,response);
    	}
		else
		{
		SignupBean signupbean = edituserdao.displaydetails(email_id,user_id);
		request.setAttribute("signupbean",signupbean);
		RequestDispatcher dispatcher = request.getRequestDispatcher("edituser.jsp");
		dispatcher.forward(request,response);
		}
	}

}
