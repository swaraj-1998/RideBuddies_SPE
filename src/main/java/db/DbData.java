package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbData implements Data{
	
	private static Connection con=null;
	private DbData() {

	}
	static {
		try {
			Class.forName(driver);
			con=DriverManager.getConnection(url,user,password);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	public static Connection getConnection() {
		return con;
	}
	public static void main(String[] args) {
		System.out.println(getConnection());
	}
}
