package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB 
{

	public static Connection ConnectToDatabase() 
		throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException {
		Connection connection = null;
		String Database = "jdbc:mysql://mh1412.no-ip.org:3306/ece456";
		String Username = "dev";
		String Password = "dev";
		// Get JDBC driver
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		
		// Connect to TutorJam database.
		connection = DriverManager.getConnection(
				Database, 
				Username,
				Password);

		if(connection.isClosed())
			System.out.println("Error - Unable to connect to MySQL database.");
	
		return connection;	
	}
}