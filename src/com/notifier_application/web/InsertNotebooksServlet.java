package com.notifier_application.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.notifier_application.daos.InsertNotebookDAO;

@WebServlet("/insertnotebooks")
public class InsertNotebooksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private InsertNotebookDAO insertnotebookdao;
	
	public void init()
	{
		insertnotebookdao = new InsertNotebookDAO();
	}
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
    	String name = request.getParameter("notebook_name");
    	HttpSession session = request.getSession();
    	int user_id = (int) session.getAttribute("user_id");
    	if(user_id == 0)
    	{
    		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
    		dispatcher.forward(request,response);
    	}
    	else
    	{
		try {
			if(insertnotebookdao.insertNotebook(name,user_id) == 1);
			{
				RequestDispatcher dispatcher = request.getRequestDispatcher("/notebooks");
				dispatcher.forward(request,response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	}
    	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
