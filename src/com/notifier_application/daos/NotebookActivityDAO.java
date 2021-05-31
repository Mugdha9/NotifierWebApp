package com.notifier_application.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import com.notifier_application.utils.JDBCUtils;


public class NotebookActivityDAO
{
	public boolean deleteNotebook(String notebook_name,int user_id) throws SQLException {
		boolean rowDeleted;		
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement("DELETE FROM notebook where notebook_name = ? AND user_id = ?");) {
			statement.setString(1,notebook_name);
			statement.setInt(2,user_id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}
	
	public boolean updateNotebook(String old_name,String new_name,int user_id) throws SQLException
	{
		boolean rowUpdated;
		try(Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedstatement = connection.prepareStatement("UPDATE notebook set notebook_name = ? where notebook_name = ? and user_id = ?");)
		{
			preparedstatement.setString(1,new_name);
			preparedstatement.setString(2,old_name);
			preparedstatement.setInt(3,user_id);
						
			rowUpdated = preparedstatement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

}

