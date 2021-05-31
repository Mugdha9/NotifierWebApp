package com.notifier_application.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.notifier_application.beans.NotebooksBean;
import com.notifier_application.daos.ViewNotebooksDAO;


@WebServlet("/notebooks")
public class NotebooksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ViewNotebooksDAO viewnotebooksdao;
	
	public void init()
	{
		viewnotebooksdao = new ViewNotebooksDAO();
	}
	   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
    	List<String> notebooks = new ArrayList<>();
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
			notebooks = viewnotebooksdao.viewNotebooks(user_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	request.setAttribute("notebooks", notebooks);
    	RequestDispatcher dispatcher = request.getRequestDispatcher("notebooks.jsp");
    	dispatcher.forward(request,response);
    	}
    		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGet(request, response);
	}

}
