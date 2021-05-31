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

import com.notifier_application.beans.NotesBean;
import com.notifier_application.daos.NotesDAO;

@WebServlet("/notedetails")
public class NoteDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NotesDAO notesdao;
	
	public void init()
	{
		notesdao = new NotesDAO();
	}
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
		String note_name = request.getParameter("note_name");
		PrintWriter out = response.getWriter();
		out.println(note_name);
		int notebook_id = 0;
		NotesBean notedetails = null;
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
			notebook_id = notesdao.getNoteID(note_name,user_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			notedetails = notesdao.displayNote(notebook_id,user_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("notedetails",notedetails);
		RequestDispatcher dispatcher = request.getRequestDispatcher("notedetails.jsp");
		dispatcher.forward(request,response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGet(request, response);
	}

}
