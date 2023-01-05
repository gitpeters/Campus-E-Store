package imageLoader;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import connection.DbConnection;

public class Loader {

	//Load Product Image
	public static String imageSample1() {
		String image = "";
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				image = rs.getString("productId") + "x.jpg";
				
				Blob blob = rs.getBlob("productSample1");
				byte [] imageArr = blob.getBytes(1, (int)blob.length());
				file = new FileOutputStream("C:\\Users\\ABRAHAM\\eclipse-workspace\\Campus E-stock\\src\\main\\webapp\\img\\allImage\\" + image);
				file.write(imageArr);	
				
				System.out.println("Image Loaded...");	
			}		
			file.close();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Couldn't Load iMAGE!");
			e.printStackTrace();
		}
		return image;
	}
	
	public static String imageSample2() {
		String image = "";
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				image = rs.getString("productId") + "y.jpg";
				
				Blob blob = rs.getBlob("prodcutSample2");
				byte [] imageArr = blob.getBytes(1, (int)blob.length());
				file = new FileOutputStream("C:\\Users\\ABRAHAM\\eclipse-workspace\\Campus E-stock\\src\\main\\webapp\\img\\allImage\\" + image);
				file.write(imageArr);	
				
				System.out.println("Image Loaded...");	
			}		
			file.close();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Couldn't Load iMAGE!");
			e.printStackTrace();
		}
		return image;
	}
	
	public static String imageSample3() {
		String image = "";
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				image = rs.getString("productId") + "z.jpg";
				
				Blob blob = rs.getBlob("productSample3");
				byte [] imageArr = blob.getBytes(1, (int)blob.length());
				file = new FileOutputStream("C:\\Users\\ABRAHAM\\eclipse-workspace\\Campus E-stock\\src\\main\\webapp\\img\\allImage\\" + image);
				file.write(imageArr);	
				
				System.out.println("Image Loaded...");	
			}		
			file.close();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Couldn't Load iMAGE!");
			e.printStackTrace();
		}
		return image;
	}
	
	
	//Delete all Existing Image in Folder
	public static void deleteImage(){
		File file=new File("C:\\Users\\ABRAHAM\\eclipse-workspace\\Campus E-stock\\src\\main\\webapp\\img\\allImage\\");
		File [] dirListing = file.listFiles();
		if(dirListing != null){
			for (File fl: dirListing){
				file.delete();
				fl.delete();
			}
			System.out.println("Initial Files deleted...");
		}else {
			System.out.println("iMAGE folder is empty!");
		}
	}
}
