package utility;
import java.sql.*;
public class DB {

	public static Connection getConnection(){
		Connection con = null;
		
		String driver = "org.postgresql.Driver";
		String url = "jdbc:postgresql://localhost:5432/db";
		String uname = "postgres";
		String pass = "root";
		try
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url,uname,pass);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return con;

	}

}
