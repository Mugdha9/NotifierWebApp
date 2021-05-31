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

import com.notifier_application.daos.NotebookActivityDAO;
import com.notifier_application.daos.NotesDAO;

@WebServlet("/updatenotebook")
public class UpdateNotebookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private NotebookActivityDAO notebookactivitydao;
	private NotesDAO notesdao;
	
	public void init()
	{
		notebookactivitydao = new NotebookActivityDAO();
		notesdao = new NotesDAO();
	}
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	String old_name = request.getParameter("notebook_name");
    	String new_name = request.getParameter("newnotebook_name");
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
			boolean result = notebookactivitydao.updateNotebook(old_name, new_name,user_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	RequestDispatcher dispatcher = request.getRequestDispatcher("notebooks");
    	dispatcher.forward(request, response);
    	}
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
