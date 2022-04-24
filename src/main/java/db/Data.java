package db;

public interface Data {

	String user = System.getenv("dbUserName");
	String password = System.getenv("dbPassword");
	String url = System.getenv("dbConnectionUrl");
	String driver = System.getenv("dbDriver");
//String user = "swaraj";
//	String password = "password";
//	String url = "jdbc:mysql://localhost/RideBuddies?allowPublicKeyRetrieval=true&useSSL=false";
//	String driver = "com.mysql.jdbc.Driver";
	}
