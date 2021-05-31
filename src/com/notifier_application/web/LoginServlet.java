package com.notifier_application.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.notifier_application.beans.LoginBean;
import com.notifier_application.beans.SignupBean;
import com.notifier_application.daos.EditUserDAO;
import com.notifier_application.daos.LoginDAO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	private LoginDAO logindao;
	
	public void init()
	{
		logindao = new LoginDAO();
	}
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
		response.sendRedirect("index.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try {
			authenticate(request,response);
		} catch (IOException | ServletException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void authenticate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException
	{
		EditUserDAO edituserdao = new EditUserDAO();
		String email_id = request.getParameter("email_id");
		String password = request.getParameter("password");
		
		
		LoginBean loginbean = new LoginBean();
		loginbean.setEmail_id(email_id);
		loginbean.setPassword(password);
		

		try {
			if (logindao.checkIfUserExists(loginbean) && logindao.check(loginbean)) {
				
				HttpSession session = request.getSession();
				session.setAttribute("email_id", email_id);
				int user_id = logindao.getUserID(email_id);
				session.setAttribute("user_id",user_id);
				SignupBean signupBean = edituserdao.displaydetails(email_id, user_id);
				session.setAttribute("name",signupBean.getName());
				RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
				dispatcher.forward(request, response);
				
			} else
			{
				if(logindao.checkIfUserExists(loginbean) == false)
					request.setAttribute("errMsg", "User with this email id does not exist");
				else
					request.setAttribute("errMsg", "Username or password is incorrect");
			    // The following will keep you in the login page
			    RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
			    rd.forward(request, response);

			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}			


}
