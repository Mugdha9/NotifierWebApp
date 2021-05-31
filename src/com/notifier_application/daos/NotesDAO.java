package com.notifier_application.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.notifier_application.beans.NotesBean;
import com.notifier_application.utils.JDBCUtils;

public class NotesDAO 
{
	public int getID(String notebook_name,int user_id) throws SQLException
	{
		int notebook_id = 0;
		try(Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedstatement = connection.prepareStatement("select notebook_id from notebook where notebook_name = ? AND user_id = ?"))
		{
			preparedstatement.setString(1, notebook_name);
			preparedstatement.setInt(2, user_id);
			ResultSet rs = preparedstatement.executeQuery();
			while(rs.next())
			{
				notebook_id = rs.getInt("notebook_id");
				
			}
		}
		catch(SQLException exception)
		{
			JDBCUtils.printSQLException(exception);
		}
		return notebook_id;
	}
	
	public int getNotebookID(int note_id,int user_id) throws SQLException
	{
		int notebook_id = 0;
		try(Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedstatement = connection.prepareStatement("select notebook_id from note where note_id = ? AND user_id = ?"))
		{
			preparedstatement.setInt(1, note_id);
			preparedstatement.setInt(2, user_id);
			ResultSet rs = preparedstatement.executeQuery();
			while(rs.next())
			{
				notebook_id = rs.getInt("notebook_id");
				
			}
		}
		catch(SQLException exception)
		{
			JDBCUtils.printSQLException(exception);
		}
		return notebook_id;
	}
	
	public int getNoteID(String note_name,int user_id) throws SQLException
	{
		int note_id = 0;
		try(Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedstatement = connection.prepareStatement("select note_id from note where note_name = ? and user_id = ?"))
		{
			preparedstatement.setString(1, note_name);
			preparedstatement.setInt(2, user_id);
			ResultSet rs = preparedstatement.executeQuery();
			if(rs.next())
			{
				note_id = rs.getInt("note_id");
				System.out.println("Note id is :" + note_id);
				
			}
		}
		catch(SQLException exception)
		{
			JDBCUtils.printSQLException(exception);
		}
		return note_id;
	}

	public List<NotesBean> viewNotes(int notebook_id,int user_id) throws SQLException
	{
		List<NotesBean> notes = new ArrayList<>();
		try(Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedstatement = connection.prepareStatement("select * from note where notebook_id = ? and user_id = ?"))
		{
			preparedstatement.setInt(1, notebook_id);
			preparedstatement.setInt(2, user_id);
			ResultSet rs = preparedstatement.executeQuery();
			while(rs.next())
			{
				String note_name = rs.getString("note_name");
				Date start_date = rs.getDate("start_date");
				Date end_date = rs.getDate("end_date");
				Date reminder_date = rs.getDate("reminder_date");
				String status = rs.getString("status");
				String tag = rs.getString("tag");
				String description = rs.getString("description");
				LocalDate start_date1 = ((java.sql.Date) start_date).toLocalDate();
				LocalDate end_date1 = ((java.sql.Date) end_date).toLocalDate();
				LocalDate reminder_date1 = ((java.sql.Date) reminder_date).toLocalDate();
				notes.add(new NotesBean(note_name,start_date1,end_date1,reminder_date1,status,tag,description,notebook_id));
			}
		}
		catch(SQLException exception)
		{
			JDBCUtils.printSQLException(exception);
		}
		return notes;
	}
	
	public List<NotesBean> viewAllNotes(int user_id) throws SQLException
	{
		List<NotesBean> notes = new ArrayList<>();
		try(Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedstatement = connection.prepareStatement("select * from note where user_id = ?"))
		{
			preparedstatement.setInt(1, user_id);
			ResultSet rs = preparedstatement.executeQuery();
			while(rs.next())
			{
				String note_name = rs.getString("note_name");
				Date start_date = rs.getDate("start_date");
				Date end_date = rs.getDate("end_date");
				Date reminder_date = rs.getDate("reminder_date");
				String status = rs.getString("status");
				String tag = rs.getString("tag");
				String description = rs.getString("description");
				LocalDate start_date1 = ((java.sql.Date) start_date).toLocalDate();
				LocalDate end_date1 = ((java.sql.Date) end_date).toLocalDate();
				LocalDate reminder_date1 = ((java.sql.Date) reminder_date).toLocalDate();
				notes.add(new NotesBean(note_name,start_date1,end_date1,reminder_date1,status,tag,description));
			}
		}
		catch(SQLException exception)
		{
			JDBCUtils.printSQLException(exception);
		}
		return notes;
	}
	
	public int insertNotes(NotesBean notesbean,int user_id) throws SQLException
	{
		int result = 0;
		try(Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedstatement = connection.prepareStatement("insert into note(note_name,start_date,end_date,reminder_date,status,tag,description,notebook_id,user_id) VALUES (?,?,?,?,?,?,?,?,?)"))
		{
			preparedstatement.setString(1,notesbean.getNote_name());
			preparedstatement.setDate(2,JDBCUtils.getSQLDate(notesbean.getStart_date()));
			preparedstatement.setDate(3,JDBCUtils.getSQLDate(notesbean.getEnd_date()));
			preparedstatement.setDate(4,JDBCUtils.getSQLDate(notesbean.getReminder_date()));
			preparedstatement.setString(5,notesbean.getStatus());
			preparedstatement.setString(6,notesbean.getTag());
			preparedstatement.setString(7,notesbean.getDescription());
			preparedstatement.setInt(8,notesbean.getNotebook_id());
			preparedstatement.setInt(9,user_id);
			System.out.println(notesbean.getNotebook_id());
			
			result = preparedstatement.executeUpdate();
		}
		catch(SQLException exception)
		{
			JDBCUtils.printSQLException(exception);
		}
		return result;
	}
	
	public boolean deleteNote(int note_id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement("DELETE FROM note where note_id = ?");) {
			statement.setInt(1,note_id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}
	
	public NotesBean displayNote(int note_id,int user_id) throws SQLException
	{
		NotesBean note = null;
		try(Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedstatement = connection.prepareStatement("SELECT * FROM note WHERE note_id = ? AND user_id = ?"))
		{
			preparedstatement.setInt(1,note_id);
			preparedstatement.setInt(2,user_id);
			ResultSet rs = preparedstatement.executeQuery();
			while(rs.next())
			{
				String note_name = rs.getString("note_name");
				Date start_date = rs.getDate("start_date");
				Date end_date = rs.getDate("end_date");
				Date reminder_date = rs.getDate("reminder_date");
				String status = rs.getString("status");
				String tag = rs.getString("tag");
				String description = rs.getString("description");
				LocalDate start_date1 = ((java.sql.Date) start_date).toLocalDate();
				LocalDate end_date1 = ((java.sql.Date) end_date).toLocalDate();
				LocalDate reminder_date1 = ((java.sql.Date) reminder_date).toLocalDate();
				note = new NotesBean(note_name,start_date1,end_date1,reminder_date1,status,tag,description,note_id);
			}
		}
		catch(SQLException exception)
		{
			JDBCUtils.printSQLException(exception);
		}
		return note;
	}
	
	public boolean updateNote(NotesBean note,int user_id) throws SQLException
	{
		boolean rowUpdated;
		try(Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedstatement = connection.prepareStatement("UPDATE note set start_date = ?,end_date = ?,reminder_date = ?,status = ?,tag = ?,description = ? where note_name = ? and user_id = ?");)
		{
			preparedstatement.setDate(1,JDBCUtils.getSQLDate(note.getStart_date()));
			preparedstatement.setDate(2,JDBCUtils.getSQLDate(note.getEnd_date()));
			preparedstatement.setDate(3,JDBCUtils.getSQLDate(note.getReminder_date()));
			preparedstatement.setString(4,note.getStatus());
			preparedstatement.setString(5,note.getTag());
			preparedstatement.setString(6,note.getDescription());
			preparedstatement.setString(7,note.getNote_name());
			preparedstatement.setInt(8,user_id);
						
			rowUpdated = preparedstatement.executeUpdate() > 0;
		}
		return rowUpdated;
	}
	
	public List<NotesBean> displayAllNotes(int user_id) throws SQLException
	{
		List<NotesBean> noteslist = new ArrayList<>();
		try(Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedstatement = connection.prepareStatement("SELECT * FROM note WHERE user_id = ?"))
		{
			preparedstatement.setInt(1, user_id);
			ResultSet rs = preparedstatement.executeQuery();
			while(rs.next())
			{
				String note_name = rs.getString("note_name");
				Date start_date = rs.getDate("start_date");
				Date end_date = rs.getDate("end_date");
				Date reminder_date = rs.getDate("reminder_date");
				String status = rs.getString("status");
				String tag = rs.getString("tag");
				String description = rs.getString("description");
				LocalDate start_date1 = ((java.sql.Date) start_date).toLocalDate();
				LocalDate end_date1 = ((java.sql.Date) end_date).toLocalDate();
				LocalDate reminder_date1 = ((java.sql.Date) reminder_date).toLocalDate();
				int notebook_id = rs.getInt("notebook_id");
				noteslist.add(new NotesBean(note_name,start_date1,end_date1,reminder_date1,status,tag,description,notebook_id));
			}
		}
		catch(SQLException exception)
		{
			JDBCUtils.printSQLException(exception);
		}
		return noteslist;
	}
	
	public List<NotesBean> checkReminder(int user_id,LocalDate today) throws SQLException
	{
		List<NotesBean> reminders = new ArrayList<>();
		try(Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedstatement = connection.prepareStatement("select note_name,reminder_date,status,note_id from note where user_id = ?"))
		{
			preparedstatement.setInt(1, user_id);
			ResultSet rs = preparedstatement.executeQuery();
			while(rs.next())
			{
				String note_name = rs.getString("note_name");
				Date reminder_date = rs.getDate("reminder_date");
				String status = rs.getString("status");
				int note_id = rs.getInt("note_id");
				LocalDate reminder_date1 = ((java.sql.Date) reminder_date).toLocalDate();
				if(reminder_date1.compareTo(today) == 0)
				{
					reminders.add(new NotesBean(note_name,reminder_date1,status,note_id));
				}
			}
		}
		catch(SQLException exception)
		{
			JDBCUtils.printSQLException(exception);
		}
		return reminders;
	}
	
	
}
