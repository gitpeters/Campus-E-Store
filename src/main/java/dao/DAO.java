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
import model.DataSupply;
import model.Product;
import model.Vendor;

public class DAO {
	
	//Save Vendor Information
	
	public static int saveVendor(Vendor vn, FileItem fi) {
		int i = 0;
		Connection con = DbConnection.connection();
		String sql = "INSERT INTO campusestock.vendor(vendorId, vendorName, vendorEmail, vendorMatricNo, vendorPassword, vendorBrandName, vendorSchoolId) values (?,?,?,?,?,?,?)";
		String sql2 = "INSERT INTO campusestock.position (username, position) values (?,?)";
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
	
	public static List<Vendor> getVendorById(String vendorId){
		List<Vendor> vendors = new ArrayList<Vendor>();
		
		Connection con = DbConnection.connection();
		String sql = "SELECT * FROM campusestock.vendor WHERE vendorId = '"+vendorId+"'";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Vendor vn = new Vendor();
				
				vn.setVendorId(rs.getString(1));
				vn.setVendorName(rs.getString(2));
				vn.setVendorEmail(rs.getString(3));
				vn.setVendorMatricNo(rs.getString(4));
				vn.setVendorBrandName(rs.getString(5));
				vn.setVendorBrandName(rs.getString(6));
				
				vendors.add(vn);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vendors;
	}
	
	//Adding new Product
	public static int addProduct (Product pr, FileItem f1, FileItem f2, FileItem f3) {
		int i = 0;
		Connection con = DbConnection.connection();
		String sql = "INSERT INTO campusestock.product values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, pr.getProductId());
			ps.setString(2, pr.getVendorId());
			ps.setString(3, pr.getProductName());
			ps.setString(4, pr.getProductDescription());
			ps.setString(5, pr.getProductCondition());
			ps.setString(6, pr.getDatePosted());
			ps.setString(7, pr.getProductStatus());
			ps.setBinaryStream(8, f1.getInputStream(), (int) f1.getSize());
			ps.setBinaryStream(9, f2.getInputStream(), (int) f2.getSize());
			ps.setBinaryStream(10, f3.getInputStream(), (int) f3.getSize());
			ps.setString(11, pr.getAdsStatus());
			ps.setString(12, pr.getBrandName());
			ps.setString(13, pr.getKeywords());
			ps.setDouble(14, pr.getProductAmount());
			i = ps.executeUpdate();
		}catch (SQLException e) {
			System.out.println(e+" exception occurred");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println(e+" exception occurred");
			e.printStackTrace();
		}
		
		return i;
	}
	

}
