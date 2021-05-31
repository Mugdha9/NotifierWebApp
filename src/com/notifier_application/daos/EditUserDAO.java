package com.notifier_application.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.notifier_application.beans.SignupBean;
import com.notifier_application.utils.JDBCUtils;

public class EditUserDAO
{
	public SignupBean displaydetails(String email_id,int user_id) throws ClassNotFoundException, SQLException
	{
		SignupBean signupbean = null;
		Class.forName("com.mysql.jdbc.Driver");
		
		try(Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedstatement = connection.prepareStatement("select * from sign_up where email_id = ? and user_id = ?"))
		{
			preparedstatement.setString(1,email_id);
			preparedstatement.setInt(2,user_id);
			ResultSet rs = preparedstatement.executeQuery();
			while(rs.next())
			{
				String name = rs.getString("name");
				String username = rs.getString("username");
				long mobile_no = rs.getLong("mobile_number");
				String email = rs.getString("email_id");
				String password = rs.getString("password");
				signupbean = new SignupBean(name,username,mobile_no,email,password);
			}
		}
		catch(SQLException exception)
		{
			JDBCUtils.printSQLException(exception);
		}
		return signupbean;
	}
}
