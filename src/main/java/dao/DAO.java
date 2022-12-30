package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.fileupload.FileItem;

import connection.DbConnection;
import model.LoginCredentials;
import model.Vendor;

public class DAO {
	
	//Save Vendor Information
	
	public static int saveVendor(Vendor vn, FileItem fi) {
		int i = 0;
		Connection con = DbConnection.connection();
		String sql = "INSERT INTO campusestock.vendor(vendorId, vendorName, vendorEmail, vendorMatricNo, vendorPassword, vendorBrandName, vendorSchoolId) values (?,?,?,?,?,?,?)";
		String sql2 = "INSERT INTO campusestock.position (username, position) values (?,?)";
		String sql3 = "INSERT INTO campusestock.login_credential (username, password, position) values (?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, vn.getVendorId());
			ps.setString(2, vn.getVendorName());
			ps.setString(3, vn.getVendorEmail());
			ps.setString(4, vn.getVendorMatricNo());
			ps.setString(5, vn.getVendorPassword());
			ps.setString(6, vn.getVendorBrandName());
			ps.setBinaryStream(7, fi.getInputStream(), (int) fi.getSize());
			
			i = ps.executeUpdate();
			
			PreparedStatement ps2 = con.prepareStatement(sql2);
			
			ps2.setString(1, vn.getVendorEmail());
			ps2.setString(2, vn.getPosition());
			
			i+= ps2.executeUpdate();
			
			PreparedStatement ps3 = con.prepareStatement(sql3);
			
			ps3.setString(1, vn.getVendorEmail());
			ps3.setString(2, vn.getVendorPassword());
			ps3.setString(3, vn.getPosition());
			
			i+= ps3.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println(e+" exception occurred");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println(e+" exception occurred");
			e.printStackTrace();
		}
				
		
		return i;
	}
	
	//Authenticate vendor login
	public static boolean authenticateUser(LoginCredentials login) {
		boolean validate = false;
		
		Connection con = DbConnection.connection();
		
		String sql = "SELECT * FROM campusestock.login_credential WHERE username = ? and password = ?";
		
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, login.getUsername());
			pst.setString(2, login.getPassword());
			
			ResultSet rs = pst.executeQuery();
			
			validate = rs.next();
			
		} catch (SQLException e) {
			System.out.println(e+" exception occurred");
			e.printStackTrace();
		}
		
		return validate;
	}
	
	// Validate Vendor position
	public static LoginCredentials validatePosition (LoginCredentials login) {
		Connection con = DbConnection.connection();
		LoginCredentials ln = new LoginCredentials();
		String sql = "SELECT * FROM campusestock.position WHERE username = ?";
		
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, login.getUsername());
			
			ResultSet rst = pst.executeQuery();
			
			while(rst.next()) {
				ln.setPosition(rst.getString(2));
			}
			
		} catch (SQLException e) {
			System.out.println(e+" exception occurred");
			e.printStackTrace();
		}
		return ln;
	}
	
	// Query Vendor Table
	public static List<Vendor> getVendorByEmail(String email){
		List<Vendor> vendors = new ArrayList<Vendor>();
		
		Connection con = DbConnection.connection();
		String sql = "SELECT * FROM campusestock.vendor WHERE vendorEmail = '"+email+"'";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Vendor vn = new Vendor();
				
				vn.setVendorId(rs.getString(1));
				vn.setVendorName(rs.getString(2));
				vn.setVendorEmail(rs.getString(3));
				vn.setVendorMatricNo(rs.getString(4));
				vn.setVendorBrandName(rs.getString(6));
				
				vendors.add(vn);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vendors;
	}

}
