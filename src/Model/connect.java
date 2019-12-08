package Model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class connect {
	private static final String hostName = "localhost";
    private static final String dbName = "revenue_management";
    private static final String userName = "root";
    private static final String password = "vertrigo";
    private static final String connectionURL = "jdbc:mysql://" + hostName + ":3306/" + dbName; 
	public static Connection getConnect(){ 
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(connectionURL, userName, password);
			System.out.println("Lỗi kết nối!");
			return conn;
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println("Lỗi kết nối CSDL! Lỗi là: "+e.getMessage());
		}
		return conn;
	}
	public static void main(String[] args) {
		System.out.println(getConnect());
	}
	public  void excuteSql(String sql) throws Exception{
		Connection conn =getConnect();
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
	}
	public ResultSet selectData(String sql) throws Exception{
		Connection conn =getConnect();
		Statement stmt = conn.createStatement();
		ResultSet rs= stmt.executeQuery(sql);
		return rs;
	}
}