package com.notifier_application.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.notifier_application.beans.NotebooksBean;
import com.notifier_application.utils.JDBCUtils;

public class ViewNotebooksDAO
{
	public List<String> viewNotebooks(int user_id) throws SQLException
	{
		List<String> notebooks = new ArrayList<>();
		try(Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedstatement = connection.prepareStatement("select * from notebook where user_id = ?");)
		{
			preparedstatement.setInt(1,user_id);
			ResultSet rs = preparedstatement.executeQuery();
			while(rs.next())
			{
				String notebook_name = rs.getString("notebook_name");
				notebooks.add(notebook_name);
			}
		}
		catch(SQLException exception)
		{
			JDBCUtils.printSQLException(exception);
		}
		return notebooks;
	}
}
