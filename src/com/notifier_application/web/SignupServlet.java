package com.notifier_application.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notifier_application.beans.SignupBean;
import com.notifier_application.daos.SignupDAO;


@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private SignupDAO signupdao;
	
	public void init()
	{
		signupdao = new SignupDAO();
	}
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
		response.sendRedirect("signup.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		signup(request,response);
	}
	
	public void signup(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		Long mobile = Long.parseLong(request.getParameter("mobile"));
		System.out.println(mobile);
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		String re_pass = request.getParameter("re_password");
		
		if(!pass.equals(re_pass))
		{
			PrintWriter out = response.getWriter();
			out.println("Password is wrong");
		}
		else
		{
			SignupBean signupbean = new SignupBean();
			signupbean.setName(name);
			signupbean.setUsername(username);
			signupbean.setMobile_number(mobile);
			signupbean.setEmail_id(email);
			signupbean.setPassword(pass);
			signupbean.setRe_password(re_pass);;

			try {
				int result = signupdao.signup1(signupbean);
				if(result == 1) {
					System.out.println("User registered successfully");
					request.setAttribute("NOTIFICATION", "User Registered Successfully!");
				}
				else
				{
					request.setAttribute("NOTIFICATION", "Invalid data");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}

			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
		}
	}	
}
