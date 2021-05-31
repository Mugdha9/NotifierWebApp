package com.notifier_application.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAccessor;
import java.util.Date;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.notifier_application.beans.NotesBean;
import com.notifier_application.daos.NotesDAO;

@WebServlet("/insertnotes")
public class InsertNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private NotesDAO notesdao;
	
	public void init()
	{
		notesdao = new NotesDAO();
	}
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
    	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String note_name = request.getParameter("note_name");
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		String reminder_date = request.getParameter("reminder_date");
		LocalDate start_date1 = LocalDate.parse(start_date, formatter);
		LocalDate end_date1 = LocalDate.parse(end_date, formatter);
		LocalDate reminder_date1 = LocalDate.parse(reminder_date, formatter);
		String status = request.getParameter("status");
		String tag = request.getParameter("tag");
		String description = request.getParameter("description");
		String notebook_name = request.getParameter("notebook_name");
		
		int notebook_id = 0;
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
			notebook_id = notesdao.getID(notebook_name,user_id);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("Notebook id is" + notebook_id); 
		
		NotesBean notesbean = new NotesBean(notebook_id,note_name,start_date1,end_date1,reminder_date1,status,tag,description);
		try {
			int result = notesdao.insertNotes(notesbean,user_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("notesbean",notesbean);
		RequestDispatcher dispatcher = request.getRequestDispatcher("viewnotes");
		dispatcher.forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
