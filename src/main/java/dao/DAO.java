package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.fileupload.FileItem;

import connection.DbConnection;
import model.Vendor;

public class DAO {
	
	//Save Vendor Information
	
	public static int saveVendor(Vendor vn, FileItem fi) {
		int i = 0;
		Connection con = DbConnection.connection();
		String sql = "INSERT INTO campusestock.vendor(vendorId, vendorName, vendorEmail, vendorMatricNo, vendorPassword, vendorBrandName, vendorSchoolId) values (?,?,?,?,?,?,?)";
		String sql2 = "INSERT INTO campusestock.position values (?,?)";
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
			
			ps.setString(1, vn.getVendorEmail());
			ps.setString(2, vn.getPosition());
			
			i+= ps2.executeUpdate();
			
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
	public static boolean authenticateUser(Vendor vn) {
		boolean validate = false;
		
		Connection con = DbConnection.connection();
		
		String sql = "SELECT * FROM campusestock.vendor WHERE vendorEmail = ? and vendorPassword = ?";
		
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, vn.getVendorEmail());
			pst.setString(2, vn.getVendorPassword());
			
			ResultSet rs = pst.executeQuery();
			
			validate = rs.next();
			
		} catch (SQLException e) {
			System.out.println(e+" exception occurred");
			e.printStackTrace();
		}
		
		return validate;
	}
	
	// Validate Vendor position
	public static Vendor validatePosition (Vendor vn) {
		Connection con = DbConnection.connection();
		Vendor vendor = new Vendor();
		String sql = "SELECT * FROM campusestock.position WHERE username = ?";
		
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, vn.getVendorEmail());
			
			ResultSet rst = pst.executeQuery();
			
			while(rst.next()) {
				vn.setPosition(rst.getString(2));
			}
		} catch (SQLException e) {
			System.out.println(e+" exception occurred");
			e.printStackTrace();
		}
		return vendor;
	}

}
