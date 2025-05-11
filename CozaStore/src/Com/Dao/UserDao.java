package Com.Dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import Com.Conn.ProjectConn;


import pojo.Product;
import pojo.User;

public class UserDao {

	public User userCheckLogin(String name,String password) throws SQLException,ClassNotFoundException{
		
			Connection conn=Com.Conn.ProjectConn.createConnection();
			String sql="select * from user where (email=? OR binary name=? ) AND binary password=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, name);
			pst.setString(2, name);
			pst.setString(3, password);
			ResultSet rs=pst.executeQuery();
			User user = null;
			
			if(rs.next()){
				user = new User();
				
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setContact(rs.getFloat("contact"));
				user.setPassword(rs.getString("password"));
				user.setCpassword(rs.getString("cpassword"));
			}

			conn.close();
			return user;
		}
	public static void EditUser(User u)
	{
		try {
			Connection conn=ProjectConn.createConnection();
			String sql="update user set name=?,email=?,contact=?,password=?,cpassword=? where id=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1,u.getName());
			pst.setString(2,u.getEmail());
			pst.setFloat(3,u.getContact());
			pst.setString(4,u.getPassword());
			pst.setString(5,u.getCpassword());
			pst.setInt(6, u.getId());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static List<Product> searchProducts(String keyword) throws SQLException {
        List<Product> productList = new ArrayList<>();
        Connection con=ProjectConn.createConnection();
        String sql = "SELECT * FROM product WHERE productName LIKE ?";
        PreparedStatement statement=con.prepareStatement(sql);
        statement.setString(1, "%" + keyword + "%");
        ResultSet result = statement.executeQuery();
        
        while(result.next()) {
            Product product = new Product();
            product.setId(result.getInt("id"));
            product.setProductName(result.getString("productName"));
            product.setQty(result.getInt("qty"));
            product.setDescription(result.getString("description"));
            product.setWeight(result.getDouble("weight"));
            product.setDimensions(result.getString("dimensions"));
            product.setMaterials(result.getInt("materials"));
            product.setSize(result.getString("size"));
            product.setColor(result.getString("color"));
            product.setPrice(result.getFloat("price"));
            product.setImage1(result.getString("image1"));
            product.setImage2(result.getString("image2"));
            product.setImage3(result.getString("image3"));
            productList.add(product);
        }
        
        return productList;
    }

	
}
