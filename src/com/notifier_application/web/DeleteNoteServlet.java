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

import com.notifier_application.daos.NotesDAO;

@WebServlet("/deletenote")
public class DeleteNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private NotesDAO notesdao;
	
	public void init()
	{
		notesdao = new NotesDAO();
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String note_name = request.getParameter("note_name");
		HttpSession session = request.getSession();
		int user_id = 0;
		try {
			user_id = (int) session.getAttribute("user_id");
			if(user_id == 0)
	    	{
	    		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
	    		dispatcher.forward(request,response);
	    	}
			else
			{
			System.out.println(notesdao.getNoteID(note_name,user_id));
			notesdao.deleteNote(notesdao.getNoteID(note_name,user_id));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("viewnotesafterdeleting");
		dispatcher.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
