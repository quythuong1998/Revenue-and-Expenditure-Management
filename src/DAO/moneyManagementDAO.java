package DAO;
import Model.money_management;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sun.org.apache.xalan.internal.xsltc.compiler.sym;

import Model.connect;

public class moneyManagementDAO {
	
	public static List<money_management> listMoney(int idUser)
	{
		List<money_management> MoneyList = new ArrayList<money_management>();
		String sql = "SELECT * FROM `revenues_expenditure` WHERE idUser='"+idUser+"'";
		try {
			ResultSet rs = new connect().selectData(sql);
			while(rs.next()) {
//				int ID = rs.getInt("ID");
//				String TenThuongHieu = rs.getString("TenThuongHieu");
//				thuonghieu th = new thuonghieu();
//				th.setID(ID);
//				th.setTenThuongHieu(TenThuongHieu);
//				llh.add(th);
				
				int id = rs.getInt("id");
				String money = rs.getString("money");
				String date = rs.getString("date");
				String explain = rs.getString("explain");
				int type = (rs.getInt("type"));
				
				money_management mn = new money_management();
				
				
				mn.setID(id);
				mn.setMoney(money);
				mn.setDate(date);
				mn.setType(type);
				mn.setExplain(explain);
				
				MoneyList.add(mn);
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return MoneyList;
	}
	
	
	public static boolean Add( String money, String date, String explain, int type, int userId)
	{
		String sql = "INSERT INTO `revenues_expenditure`( `money`, `date`, `explain`, `type`, `idUser`) VALUES ("+money+", '"+date+"', "+explain+", "+type+", "+userId+")";
		try {
			new connect().excuteSql(sql);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	public static money_management ListManagement(String idUser)
	{
		
		money_management lm = new money_management();
		String sql = "SELECT * FROM `revenues_expenditure` WHERE idUser='"+idUser+"'";
		
		try {
			ResultSet rs = new connect().selectData(sql);
			while(rs.next()) {
			int id = rs.getInt("id");
			String money = rs.getString("money");
			String date = rs.getString("date");
			String explain = rs.getString("explain");
			
			int type = (rs.getInt("type"));
			
			
			lm.setID(id);
			lm.setMoney(money);
			lm.setDate(date);
			lm.setType(type);
			lm.setExplain(explain);
			
			
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lm;
	}
//	public static boolean Edit(int id, String TenLoai) {
//		String sql = "UPDATE `loaihang` SET `TenLoai`='"+TenLoai+"' WHERE  ID = '"+id+"'";
//		try {
//			new Connect().excuteSql(sql);
//			return true;
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return false;
//		}
//	}
	public static boolean Remove(int id) {
		String sql = "DELETE FROM `revenues_expenditure` WHERE ID = '"+id+"'";
		System.out.print(sql);
		try {
			new connect().excuteSql(sql);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean RemoveAll(int id) {
		String sql = "DELETE FROM `revenues_expenditure` WHERE idUser = '"+id+"'";
		System.out.print(sql);
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
