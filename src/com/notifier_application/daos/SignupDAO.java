package com.notifier_application.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.notifier_application.beans.SignupBean;
import com.notifier_application.utils.JDBCUtils;

public class SignupDAO 
{
	public int signup1(SignupBean signupbean) throws SQLException
	{
		String signup_user = "INSERT INTO sign_up" + "(name,username,mobile_number,email_id,password,reset_password) VALUES" + "(?,?,?,?,?,?);";
		
		int result = 0;
		try(Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedstatement = connection.prepareStatement(signup_user))
		{
			preparedstatement.setString(1,signupbean.getName());
			preparedstatement.setString(2,signupbean.getUsername());
			preparedstatement.setLong(3,signupbean.getMobile_number());
			preparedstatement.setString(4,signupbean.getEmail_id());
			preparedstatement.setString(5,signupbean.getPassword());
			preparedstatement.setString(6,signupbean.getRe_password());
					
			result = preparedstatement.executeUpdate();
		}
		catch(SQLException e)
		{
			JDBCUtils.printSQLException(e);
		}
		
		return result;
	}
}
