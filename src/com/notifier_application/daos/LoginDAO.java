package com.notifier_application.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.notifier_application.beans.LoginBean;
import com.notifier_application.utils.JDBCUtils;



public class LoginDAO 
{
	public boolean checkIfUserExists(LoginBean loginbean) throws ClassNotFoundException
	{
		boolean status = false;

		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from sign_up where email_id = ?")) {
			preparedStatement.setString(1, loginbean.getEmail_id());

			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();

		} catch (SQLException e) {
			JDBCUtils.printSQLException(e);
		}
		return status;	
	}

	public boolean check(LoginBean loginbean) throws ClassNotFoundException
	{
		boolean status = false;

		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from sign_up where email_id = ? and password = ?")) {
			preparedStatement.setString(1, loginbean.getEmail_id());
			preparedStatement.setString(2, loginbean.getPassword());

			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();

		} catch (SQLException e) {
			JDBCUtils.printSQLException(e);
		}
		return status;	
	}
	
	public int getUserID(String email_id) throws ClassNotFoundException
	{
		int user_id = 0;
		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("select user_id from sign_up where email_id = ?")) {
			preparedStatement.setString(1, email_id);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next())
			{
				user_id = rs.getInt("user_id");
			}

		} catch (SQLException e) {
			JDBCUtils.printSQLException(e);
		}
		return user_id;	

	}

}
