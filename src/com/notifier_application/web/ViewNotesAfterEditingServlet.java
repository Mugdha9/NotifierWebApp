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

import com.notifier_application.beans.NotesBean;
import com.notifier_application.daos.NotesDAO;


@WebServlet("/viewnotesafterediting")
public class ViewNotesAfterEditingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private NotesDAO notesdao;
	
	public void init()
	{
		notesdao = new NotesDAO();
	}
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
    	int notebook_id = (int) request.getAttribute("notebook_id");
    	List<NotesBean> notes = new ArrayList<>();
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
			notes = notesdao.viewNotes(notebook_id,user_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(int i=0;i<notes.size();i++)
		{
			System.out.println(notes.get(i).getNote_name());
			System.out.println("Inside for loop");
		}
		request.setAttribute("notes",notes);
		RequestDispatcher dispatcher = request.getRequestDispatcher("notes.jsp");
		dispatcher.forward(request,response);
    	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGet(request, response);
	}

}
