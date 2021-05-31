package com.notifier_application.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.notifier_application.utils.JDBCUtils;

public class InsertNotebookDAO
{
	public int insertNotebook(String name,int user_id) throws SQLException
	{
		String insert_notebook = "INSERT INTO notebook (notebook_name,user_id) VALUES (?,?)" ;
		
		int result = 0;
		
		try(Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedstatement = connection.prepareStatement(insert_notebook))
		{
			preparedstatement.setString(1,name);
			preparedstatement.setInt(2,user_id);
			
			result = preparedstatement.executeUpdate();
		}
		catch(SQLException exception)
		{
			JDBCUtils.printSQLException(exception);
		}
		return result;
	} 
}
