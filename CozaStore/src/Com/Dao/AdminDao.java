package Com.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Com.Conn.ProjectConn;
import pojo.Admin;

public class AdminDao {

	public Admin checkLogin(String name,String password)throws SQLException,
    ClassNotFoundException{
			
			Connection con=ProjectConn.createConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM admin WHERE (email=? OR binary name=? ) AND binary password = ?");
			ps.setString(1,name);
			ps.setString(2,name);
			ps.setString(3,password);
			
			ResultSet result = ps.executeQuery();
			
			
			Admin admin =null;
			 
	        if (result.next()) {
	        	admin = new Admin();
	        	admin.setName(result.getString("name"));
	        	admin.setNumber(result.getString("number"));
	        	admin.setEmail(result.getString("email"));
	        	admin.setPassword(result.getString("password"));
	        }
	        con.close();
	       
	        return admin;
		}
}
