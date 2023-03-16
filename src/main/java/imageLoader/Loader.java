package imageLoader;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import connection.DbConnection;

public class Loader {
	static String path = "C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img";
	static File generalDirectory = new File("C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img");
	//Load Product Image
	public static String imageSample(){
		String image = "";
		int increament = 1;
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;	
			
			File directory = new File(generalDirectory + "\\allImage");
			if (!directory.exists()) {
			    directory.mkdirs();
			    System.out.println(directory + " Created");
			}
			
			String sql = "select * from campusestock.product";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Blob blob;
				for (int imageColumn = 1; imageColumn <= 3; imageColumn++) {
					image = rs.getString("productId") + increament + ".jpg";
					blob = rs.getBlob("productSample"+imageColumn);
					byte [] imageArr = blob.getBytes(1, (int)blob.length());
					file = new FileOutputStream(generalDirectory + "\\allImage\\" + image);
					file.write(imageArr);	
					
					increament++;
					if(increament > 3) {
						increament = 1;
					}	
				}
			}
			
			System.out.println("Image Loaded...");
			file.close();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Couldn't Load iMAGE!");
			e.printStackTrace();
		}
		return image;
	}
	
	
	public static void deleteImageInIndex(){
		
		String filePaths = generalDirectory + "\\allImage\\";
				
			File file=new File(filePaths);
			File [] dirListing = file.listFiles();
			
			if(dirListing != null){
				for (File fl: dirListing){
					file.delete();
					fl.delete();
				}
				System.out.println("All Images in Index deleted...");
			}else {
				System.out.println("iMAGE folder is empty!");
			}
	}
}
