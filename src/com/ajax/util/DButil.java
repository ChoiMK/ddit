package com.ajax.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DButil {
	static{
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Throwable e){
			throw new ExceptionInInitializerError(e);
		}
	}

	public static Connection getConnection() throws SQLException{
		return DriverManager.getConnection(
					"jdbc:oracle:thin:@ localhost:1521:xe",		
					"pc02",
					"java");
				
	}

}
