package DAO;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Model.connect;
import Model.user;

public class userDAO {
	public static List<user> DanhSach()
	{
		List<user> llh = new ArrayList<user>();
		String sql = "Select * from users order by id";
		try {
			ResultSet rs = new connect().selectData(sql);
			while(rs.next()) {
				int ID = rs.getInt("ID");
				String name = rs.getString("name");
				String username = rs.getString("username");
				String password = rs.getString("password");
				int  role = rs.getInt("role");
				user ng = new user();
				ng.setID(ID);
				ng.setName(name);
				ng.setUsername(username);
				ng.setPassword(password);
				ng.setRole(role);
				llh.add(ng);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return llh;
	}
	public static user DanhSachTheoUserName(String username)
	{
		user ng = new user();
		String sql = "Select * from users where username = '"+username+"'";
		try {
			ResultSet rs = new connect().selectData(sql);
			while(rs.next()) {
			int id = rs.getInt("ID");
			String name = rs.getString("name");
			String Username = rs.getString("username");
			String password = rs.getString("password");
			int role = rs.getInt("role");
			ng.setID(id);
			ng.setName(name);
			ng.setUsername(Username);
			ng.setPassword(password);
			ng.setRole(role);
			
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ng;
	}
	public static boolean KiemTraDangNhap(String username, String password) {
		try {
			String sql = "select * from users where username= '"+username+"'";
			ResultSet  rs=new connect().selectData(sql);
			 while(rs.next()){
				 if(rs.getString("username").equals(username) && rs.getString("password").equals(password)){
					 return true;
				 }
			 }
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return false;
	}
	public static boolean Them(String name, String username, String password)
	{
		String sql = "INSERT INTO `users`(`name`, `username`, `password`) "
				+ "VALUES ('"+name+"','"+username+"','"+password+"')";
		try {
			new connect().excuteSql(sql);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	public static boolean Sua(int id, String password) {
		String sql = "UPDATE `users` SET `password`='"+password+"' WHERE  id = '"+id+"'";
		try {
			new connect().excuteSql(sql);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	public static boolean Xoa(int id) {
		String sql = "DELETE FROM `users` WHERE id = '"+id+"'";
		try {
			new connect().excuteSql(sql);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
}