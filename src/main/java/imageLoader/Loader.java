package imageLoader;

import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Array;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import connection.DbConnection;

public class Loader {
	private static String path ="C:\\Users\\ABRAHAM\\eclipse-workspace\\Campus E-stock\\src\\main\\webapp\\img\\";

	//Load Product Image
	public static String imageSample() {
		String image = "";
		int increament = 1;
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				
				Blob blob;
				for (int imageColumn = 1; imageColumn <= 3; imageColumn++) {
					image = rs.getString("productId") +increament+ ".jpg";
					blob = rs.getBlob("productSample"+imageColumn);
					byte [] imageArr = blob.getBytes(1, (int)blob.length());
					file = new FileOutputStream(path+"allImage\\" + image);
					file.write(imageArr);	
					
					increament++;
					System.out.println(image);	
					System.out.println("Image Loaded...");	
				}
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
	public static String accessoriesImage() {
		String accessories_image = "";
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product WHERE productCategory = 'Accessories'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				accessories_image = rs.getString("productId") + ".jpg";
				
				Blob blob = rs.getBlob("prodcutSample2");
				byte [] imageArr = blob.getBytes(1, (int)blob.length());
				file = new FileOutputStream(path+"accessories\\" + accessories_image);
				file.write(imageArr);	
				
				System.out.println("Accessories Image Loaded...");	
			}		
			file.close();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Couldn't Load Accessories iMAGE!");
			e.printStackTrace();
		}
		return accessories_image;
	}
	
	public static String automobileImage() {
		String automobile_image = "";
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product WHERE productCategory = 'Automobile'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				automobile_image = rs.getString("productId") + ".jpg";
				
				Blob blob = rs.getBlob("prodcutSample2");
				byte [] imageArr = blob.getBytes(1, (int)blob.length());
				file = new FileOutputStream(path+"automobile\\" + automobile_image);
				file.write(imageArr);	
				
				System.out.println("Automobile Image Loaded...");	
			}		
			file.close();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Couldn't Load Automobile iMAGE!");
			e.printStackTrace();
		}
		return automobile_image;
	}
	
	public static String babyProductImage() {
		String babyProduct_image = "";
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product WHERE productCategory = 'Baby Products'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				babyProduct_image = rs.getString("productId") + ".jpg";
				
				Blob blob = rs.getBlob("prodcutSample2");
				byte [] imageArr = blob.getBytes(1, (int)blob.length());
				file = new FileOutputStream(path+"babyProduct\\" + babyProduct_image);
				file.write(imageArr);	
				
				System.out.println("Baby Products Image Loaded...");	
			}		
			file.close();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Couldn't Load Baby Products iMAGE!");
			e.printStackTrace();
		}
		return babyProduct_image;
	}
	
	public static String computingImage() {
		String computing_image = "";
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product WHERE productCategory = 'Computing'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				computing_image = rs.getString("productId") + ".jpg";
				
				Blob blob = rs.getBlob("prodcutSample2");
				byte [] imageArr = blob.getBytes(1, (int)blob.length());
				file = new FileOutputStream(path+"computing\\" + computing_image);
				file.write(imageArr);	
				
				System.out.println("Computing Image Loaded...");	
			}		
			file.close();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Couldn't Load Computing iMAGE!");
			e.printStackTrace();
		}
		return computing_image;
	}
	
	public static String electronicsImage() {
		String electronics_Image = "";
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product WHERE productCategory = 'Electronics'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				electronics_Image = rs.getString("productId") + ".jpg";
				
				Blob blob = rs.getBlob("prodcutSample2");
				byte [] imageArr = blob.getBytes(1, (int)blob.length());
				file = new FileOutputStream(path+"electronics\\" + electronics_Image);
				file.write(imageArr);	
				
				System.out.println("Electronics Image Loaded...");	
			}		
			file.close();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Couldn't Load Electronics iMAGE!");
			e.printStackTrace();
		}
		return electronics_Image;
	}
	
	public static String fashionImage() {
		String fashion_Image = "";
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product WHERE productCategory = 'Fashion'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				fashion_Image = rs.getString("productId") + ".jpg";
				
				Blob blob = rs.getBlob("prodcutSample2");
				byte [] imageArr = blob.getBytes(1, (int)blob.length());
				file = new FileOutputStream(path+"fashion\\" + fashion_Image);
				file.write(imageArr);	
				
				System.out.println("Fashion Image Loaded...");	
			}		
			file.close();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Couldn't Load Fashion iMAGE!");
			e.printStackTrace();
		}
		return fashion_Image;
	}
	
	public static String gamingImage() {
		String gaming_Image = "";
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product WHERE productCategory = 'Gaming'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				gaming_Image = rs.getString("productId") + ".jpg";
				
				Blob blob = rs.getBlob("prodcutSample2");
				byte [] imageArr = blob.getBytes(1, (int)blob.length());
				file = new FileOutputStream(path+"gaming\\" + gaming_Image);
				file.write(imageArr);	
				
				System.out.println("Gaming Image Loaded...");	
			}		
			file.close();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Couldn't Load Gaming iMAGE!");
			e.printStackTrace();
		}
		return gaming_Image;
	}
	
	public static String health_beautyImage() {
		String health_beauty_Image = "";
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product WHERE productCategory = 'Health & Beauty'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				health_beauty_Image = rs.getString("productId") + ".jpg";
				
				Blob blob = rs.getBlob("prodcutSample2");
				byte [] imageArr = blob.getBytes(1, (int)blob.length());
				file = new FileOutputStream(path+"health-beauty\\" + health_beauty_Image);
				file.write(imageArr);	
				
				System.out.println("Health & Beauty Image Loaded...");	
			}		
			file.close();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Couldn't Load Health & Beauty iMAGE!");
			e.printStackTrace();
		}
		return health_beauty_Image;
	}
	
	public static String home_officeImage() {
		String home_office_Image = "";
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product WHERE productCategory = 'Home & Office'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				home_office_Image = rs.getString("productId") + ".jpg";
				
				Blob blob = rs.getBlob("prodcutSample2");
				byte [] imageArr = blob.getBytes(1, (int)blob.length());
				file = new FileOutputStream(path+"home-office\\" + home_office_Image);
				file.write(imageArr);	
				
				System.out.println("Home & Office Image Loaded...");	
			}		
			file.close();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Couldn't Load Home & Office iMAGE!");
			e.printStackTrace();
		}
		return home_office_Image;
	}
	
	public static String jewelriesImage() {
		String jewelries_Image = "";
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product WHERE productCategory = 'Jewelries'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				jewelries_Image = rs.getString("productId") + ".jpg";
				
				Blob blob = rs.getBlob("prodcutSample2");
				byte [] imageArr = blob.getBytes(1, (int)blob.length());
				file = new FileOutputStream(path+"jewelries\\" + jewelries_Image);
				file.write(imageArr);	
				
				System.out.println("Jewelries Image Loaded...");	
			}		
			file.close();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Couldn't Load Jewelries iMAGE!");
			e.printStackTrace();
		}
		return jewelries_Image;
	}
	
	public static String othersImage() {
		String others_Image = "";
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product WHERE productCategory = 'others'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				others_Image = rs.getString("productId") + ".jpg";
				
				Blob blob = rs.getBlob("prodcutSample2");
				byte [] imageArr = blob.getBytes(1, (int)blob.length());
				file = new FileOutputStream(path+"others\\" + others_Image);
				file.write(imageArr);	
				
				System.out.println("others Image Loaded...");	
			}		
			file.close();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Couldn't Load others iMAGE!");
			e.printStackTrace();
		}
		return others_Image;
	}
	
	public static String phones_tabletsImage() {
		String phones_tablets_Image = "";
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product WHERE productCategory = 'Phones & Tablets'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				phones_tablets_Image = rs.getString("productId") + ".jpg";
				
				Blob blob = rs.getBlob("prodcutSample2");
				byte [] imageArr = blob.getBytes(1, (int)blob.length());
				file = new FileOutputStream(path+"phones-tablets\\" + phones_tablets_Image);
				file.write(imageArr);	
				
				System.out.println("Phones & Tablets Image Loaded...");	
			}		
			file.close();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Couldn't Load Phones & Tablets iMAGE!");
			e.printStackTrace();
		}
		return phones_tablets_Image;
	}
	
	public static String supermarketImage() {
		String supermarket_Image = "";
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product WHERE productCategory = 'Supermarket'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				supermarket_Image = rs.getString("productId") + ".jpg";
				
				Blob blob = rs.getBlob("prodcutSample2");
				byte [] imageArr = blob.getBytes(1, (int)blob.length());
				file = new FileOutputStream(path+"supermarket\\" + supermarket_Image);
				file.write(imageArr);	
				
				System.out.println("Supermarket Image Loaded...");	
			}		
			file.close();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Couldn't Load Supermarket iMAGE!");
			e.printStackTrace();
		}
		return supermarket_Image;
	}
	
	//Load Product Image by ID
			public static String productImage1(String id) {
				String image = "";
				try {
					PreparedStatement ps = null;
					Connection con = null;
					FileOutputStream file = null;			
					
					String sql = "select * from campusestock.product where productId =?";
					con = DbConnection.connection();
					ps = con.prepareStatement(sql);
					ps.setString(1, id);
					ResultSet rs = ps.executeQuery();
					rs.next();
					image = id+"p.jpg";
					Blob blob = rs.getBlob("productSample1");
					byte [] imageArr = blob.getBytes(1, (int)blob.length());
					file = new FileOutputStream(path+"product\\details\\" + image);
					file.write(imageArr);	
					System.out.println("Product Image1 Loaded...");
					file.close();
					ps.close();
					con.close();
					
				}catch(Exception e) {
					System.out.println("Couldn't Load Product IMAGE!");
					e.printStackTrace();
				}
				return image;
			}
			//Load Product Image by ID
					public static String productImage2(String id) {
						String image = "";
						try {
							PreparedStatement ps = null;
							Connection con = null;
							FileOutputStream file = null;			
							
							String sql = "select * from campusestock.product where productId =?";
							con = DbConnection.connection();
							ps = con.prepareStatement(sql);
							ps.setString(1, id);
							ResultSet rs = ps.executeQuery();
							rs.next();
							image = id+"w.jpg";
							Blob blob = rs.getBlob("productSample2");
							byte [] imageArr = blob.getBytes(1, (int)blob.length());
							file = new FileOutputStream(path+"product\\details\\" + image);
							file.write(imageArr);	
							System.out.println("Product Image2 Loaded...");
							file.close();
							ps.close();
							con.close();
							
						}catch(Exception e) {
							System.out.println("Couldn't Load Product IMAGE!");
							e.printStackTrace();
						}
						return image;
					}
					//Load Product Image by ID
					public static String productImage3(String id) {
						String image = "";
						try {
							PreparedStatement ps = null;
							Connection con = null;
							FileOutputStream file = null;			
							
							String sql = "select * from campusestock.product where productId =?";
							con = DbConnection.connection();
							ps = con.prepareStatement(sql);
							ps.setString(1, id);
							ResultSet rs = ps.executeQuery();
							rs.next();
							image = id+"s.jpg";
							Blob blob = rs.getBlob("productSample3");
							byte [] imageArr = blob.getBytes(1, (int)blob.length());
							file = new FileOutputStream(path+"product\\details\\" + image);
							file.write(imageArr);	
							System.out.println("Product Image3 Loaded...");
							file.close();
							ps.close();
							con.close();
							
						}catch(Exception e) {
							System.out.println("Couldn't Load Product IMAGE!");
							e.printStackTrace();
						}
						return image;
					}
	
					//Delete all Existing Image in Folder
					public static void deleteProductImage(){
						File file=new File(path+"product\\details\\");
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
					
	//Delete all Existing Image in Folder
	public static void deleteImage(){
		File file=new File(path+"allImage\\");
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
	
	public static void deleteImageInCategoryFolders(){
		ArrayList <String> filePaths = new ArrayList<String>();
		
		filePaths.add(path+"accessories\\");
		filePaths.add(path+"automobile\\");
		filePaths.add(path+"babyProduct\\");
		filePaths.add(path+"computing\\");
		filePaths.add(path+"electronics\\");
		filePaths.add(path+"fashion\\");
		filePaths.add(path+"gaming\\");
		filePaths.add(path+"health-beauty\\");
		filePaths.add(path+"home-office\\");
		filePaths.add(path+"jewelries\\");
		filePaths.add(path+"others\\");
		filePaths.add(path+"phones-tablets\\");
		filePaths.add(path+"supermarket\\");
		
		for (String fp: filePaths) {
			path = fp;
			
			File file=new File(fp);
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
}
