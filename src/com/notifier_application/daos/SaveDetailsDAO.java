package com.notifier_application.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.notifier_application.beans.SignupBean;
import com.notifier_application.utils.JDBCUtils;

public class SaveDetailsDAO
{
	public boolean updateUser(SignupBean signupbean) throws SQLException
	{
		boolean rowUpdated;
		try(Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedstatement = connection.prepareStatement("update sign_up set name = ?,username = ?,mobile_number = ?,password = ?,reset_password = ? where email_id = ?");)
		{
			preparedstatement.setString(1,signupbean.getName());
			preparedstatement.setString(2,signupbean.getUsername());
			preparedstatement.setLong(3,signupbean.getMobile_number());
			preparedstatement.setString(4,signupbean.getPassword());
			preparedstatement.setString(5,signupbean.getPassword());
			preparedstatement.setString(6,signupbean.getEmail_id());
			
			rowUpdated = preparedstatement.executeUpdate() > 0;
		}
		return rowUpdated;
	}
}
