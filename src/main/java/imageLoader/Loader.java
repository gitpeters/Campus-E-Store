package imageLoader;

import java.io.FileOutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import connection.DbConnection;

public class Loader {

	public static String productSample1(String productId) {
		String image = "";
		try {
			PreparedStatement ps = null;
			FileOutputStream file;
			
			image = productId + ".jpg";
			String sql = "select productSample1 from campusestock.product where productId=?";
			Connection con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ps.setString(1, productId);
			ResultSet rs = ps.executeQuery();
			rs.next();
			Blob blob = rs.getBlob("productSample1");
			byte [] imageArr = blob.getBytes(1, (int)blob.length());
			file = new FileOutputStream("C:\\Users\\Depittaz\\Desktop\\Campus-E-Store\\src\\main\\java\\productImages\\" + image);
			file.write(imageArr);
			System.out.println("Image Loaded...");
			file.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Invalid Image!");
			e.printStackTrace();
		}
		return image;
	}
	
	public static String productSample2(String productId) {
		String image = "";
		try {
			PreparedStatement ps = null;
			FileOutputStream file;
			
			image = productId + ".jpg";
			String sql = "select productSample2 from campusestock.product where productId=?";
			Connection con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ps.setString(1, productId);
			ResultSet rs = ps.executeQuery();
			rs.next();
			Blob blob = rs.getBlob("productSample2");
			byte [] imageArr = blob.getBytes(1, (int)blob.length());
			file = new FileOutputStream("C:\\Users\\Depittaz\\Desktop\\Campus-E-Store\\src\\main\\java\\productImages\\" + image);
			file.write(imageArr);
			System.out.println("Image Loaded...");
			file.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Invalid Image!");
			e.printStackTrace();
		}
		return image;
	}
	
	public static String productSample3(String productId) {
		String image = "";
		try {
			PreparedStatement ps = null;
			FileOutputStream file;
			
			image = productId + ".jpg";
			String sql = "select productSample3 from campusestock.product where productId=?";
			Connection con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ps.setString(1, productId);
			ResultSet rs = ps.executeQuery();
			rs.next();
			Blob blob = rs.getBlob("productSample3");
			byte [] imageArr = blob.getBytes(1, (int)blob.length());
			file = new FileOutputStream("C:\\Users\\Depittaz\\Desktop\\Campus-E-Store\\src\\main\\java\\productImages\\" + image);
			file.write(imageArr);
			System.out.println("Image Loaded...");
			file.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Invalid Image!");
			e.printStackTrace();
		}
		return image;
	}
	
	public static String vendorSchoolId(String schoolId) {
		String image = "";
		try {
			PreparedStatement ps = null;
			FileOutputStream file;
			
			image = schoolId + ".jpg";
			String sql = "select vendorSchoolId from campusestock.vendor where productId=?";
			Connection con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ps.setString(1, schoolId);
			ResultSet rs = ps.executeQuery();
			rs.next();
			Blob blob = rs.getBlob("vendorSchoolId");
			byte [] imageArr = blob.getBytes(1, (int)blob.length());
			file = new FileOutputStream("C:\\Users\\Depittaz\\Desktop\\Campus-E-Store\\src\\main\\java\\productImages\\" + image);
			file.write(imageArr);
			System.out.println("Image Loaded...");
			file.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Invalid Image!");
			e.printStackTrace();
		}
		return image;
	}
}
