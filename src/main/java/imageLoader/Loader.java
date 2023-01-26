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
	private static String path ="C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\";
	private static String otherPath ="C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\";

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
					image = rs.getString("productId") + increament + ".jpg";
					blob = rs.getBlob("productSample"+imageColumn);
					byte [] imageArr = blob.getBytes(1, (int)blob.length());
					file = new FileOutputStream("C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\allImage\\" + image);
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
	
	//Load Product Image by ID for Vendor View
	public static String imageSampleById(String productId) {
		String image = "";
		int increament = 1;
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "SELECT productSample1, productSample2, productSample3 FROM campusestock.product WHERE productId = '"+productId+"'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Blob blob;
				for (int imageColumn = 1; imageColumn <= 3; imageColumn++) {
					image = productId + increament + ".jpg";
					blob = rs.getBlob("productSample"+imageColumn);
					byte [] imageArr = blob.getBytes(1, (int)blob.length());
					file = new FileOutputStream(path + "product\\vendorDetails\\" + image);
					file.write(imageArr);	
					
					increament++;
					if(increament > 3) {
						increament = 1;
					}	
				}
			}
			
			System.out.println(productId + " Image Loaded...");
			file.close();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Couldn't Load iMAGE!");
			e.printStackTrace();
		}
		return image;
	}
	
	//Load Product Image by ID for Product View
	public static String imageSampleByIdForProduct(String productId) {
		String image = "";
		int increament = 1;
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "SELECT productSample1, productSample2, productSample3 FROM campusestock.product WHERE productId = '"+productId+"'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Blob blob;
				for (int imageColumn = 1; imageColumn <= 3; imageColumn++) {
					image = productId + increament + ".jpg";
					blob = rs.getBlob("productSample"+imageColumn);
					byte [] imageArr = blob.getBytes(1, (int)blob.length());
					file = new FileOutputStream("C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\product\\productDetails\\" + image);
					file.write(imageArr);	
					
					increament++;
					if(increament > 3) {
						increament = 1;
					}	
				}
			}
			
			System.out.println(productId + " Image Loaded...");
			file.close();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Couldn't Load iMAGE!");
			e.printStackTrace();
		}
		return image;
	}
	
	//Load Related Images 
	public static String relatedImage(String category) {
		String image = "";
		int increament = 1;
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "SELECT * FROM campusestock.product WHERE productCategory = '"+category+"'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Blob blob;
				for (int imageColumn = 1; imageColumn <= 3; imageColumn++) {
					image = rs.getString("productId") + increament + ".jpg";
					blob = rs.getBlob("productSample"+imageColumn);
					byte [] imageArr = blob.getBytes(1, (int)blob.length());
					file = new FileOutputStream("C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\product\\relatedProduct\\" + image);
					file.write(imageArr);	
					
					increament++;
					if(increament > 3) {
						increament = 1;
					}	
				}
			}
			
			System.out.println("Related Image Loaded...");
			file.close();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Couldn't Load Related iMAGE!");
			e.printStackTrace();
		}
		return image;
	}
	
	//Load featured Image 
	public static String featuredProducts() {
		String image = "";
		int increament = 1;
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "SELECT * FROM campusestock.product WHERE productCategory = 'Phones & Tablets' OR productCategory = 'Fashion' OR productCategory = 'Supermarket' OR productCategory = 'Jewelries'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Blob blob;
				for (int imageColumn = 1; imageColumn <= 3; imageColumn++) {
					image = rs.getString("productId") + increament + ".jpg";
					blob = rs.getBlob("productSample"+imageColumn);
					byte [] imageArr = blob.getBytes(1, (int)blob.length());
					file = new FileOutputStream("C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\product\\featuredProduct\\" + image);
					file.write(imageArr);	
					
					increament++;
					if(increament > 3) {
						increament = 1;
					}	
				}
			}
			
			System.out.println("Featured Image Loaded...");
			file.close();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Couldn't Load Featured iMAGE!");
			e.printStackTrace();
		}
		return image;
	}
	
	//Load Filter Image 
	public static String filteredImage1() {
		String image = "";
		int increament = 1;
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "SELECT * FROM campusestock.product WHERE productCategory = 'Health & Beauty' OR productCategory = 'Home & Office' OR productCategory = 'Computing'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Blob blob;
				for (int imageColumn = 1; imageColumn <= 3; imageColumn++) {
					image = rs.getString("productId") + increament + ".jpg";
					blob = rs.getBlob("productSample"+imageColumn);
					byte [] imageArr = blob.getBytes(1, (int)blob.length());
					file = new FileOutputStream("C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\product\\filter1\\" + image);
					file.write(imageArr);	
					
					increament++;
					if(increament > 3) {
						increament = 1;
					}	
				}
			}
			
			System.out.println("filter1 Image Loaded...");
			file.close();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Couldn't Load filter1 iMAGE!");
			e.printStackTrace();
		}
		return image;
	}
	
	public static String filteredImage2() {
		String image = "";
		int increament = 1;
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "SELECT * FROM campusestock.product WHERE productCategory = 'Electronic' OR productCategory = 'Baby Products' OR productCategory = 'Gaming'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery(); 
			
			while(rs.next()) {
				
				Blob blob;
				for (int imageColumn = 1; imageColumn <= 3; imageColumn++) {
					image = rs.getString("productId") + increament + ".jpg";
					blob = rs.getBlob("productSample"+imageColumn);
					byte [] imageArr = blob.getBytes(1, (int)blob.length());
					file = new FileOutputStream("C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\product\\filter2\\" + image);
					file.write(imageArr);	
					
					increament++;
					if(increament > 3) {
						increament = 1;
					}	
				}
			}
			
			System.out.println("filter2 Image Loaded...");
			file.close();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Couldn't Load filter2 iMAGE!");
			e.printStackTrace();
		}
		return image;
	}
	
	public static String filteredImage3() {
		String image = "";
		int increament = 1;
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "SELECT * FROM campusestock.product WHERE productCategory = 'Automobile' OR productCategory = 'Accessories' OR productCategory = 'Others'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Blob blob;
				for (int imageColumn = 1; imageColumn <= 3; imageColumn++) {
					image = rs.getString("productId") + increament + ".jpg";
					blob = rs.getBlob("productSample"+imageColumn);
					byte [] imageArr = blob.getBytes(1, (int)blob.length());
					file = new FileOutputStream("C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\product\\filter3\\" + image);
					file.write(imageArr);	
					
					increament++;
					if(increament > 3) {
						increament = 1;
					}	
				}
			}
			
			System.out.println("filter3 Image Loaded...");
			file.close();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Couldn't Load filter3 iMAGE!");
			e.printStackTrace();
		}
		return image;
	}
	
	//Load Product According to their Categories 
	public static String accessoriesImage() {
		String accessories_image = "";
		int increament = 1;
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product WHERE productCategory = 'Accessories'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Blob blob;
				for (int imageColumn = 1; imageColumn <= 3; imageColumn++) {
					accessories_image = rs.getString("productId") + increament + ".jpg";
					blob = rs.getBlob("productSample"+imageColumn);
					byte [] imageArr = blob.getBytes(1, (int)blob.length());
					file = new FileOutputStream("C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\accessories\\" + accessories_image);
					file.write(imageArr);	
					
					increament++;
					if(increament > 3) {
						increament = 1;
					}	
				}
			}
			
			System.out.println("Accessories Image Loaded...");
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
		int increament = 1;
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product WHERE productCategory = 'Automobile'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Blob blob;
				for (int imageColumn = 1; imageColumn <= 3; imageColumn++) {
					automobile_image = rs.getString("productId") + increament + ".jpg";
					blob = rs.getBlob("productSample"+imageColumn);
					byte [] imageArr = blob.getBytes(1, (int)blob.length());
					file = new FileOutputStream("C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\automobile\\" + automobile_image);
					file.write(imageArr);	
					
					increament++;
					if(increament > 3) {
						increament = 1;
					}	
				}
			}		
			
			System.out.println("Automobile Image Loaded...");
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
		int increament = 1;
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product WHERE productCategory = 'Baby Products'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Blob blob;
				for (int imageColumn = 1; imageColumn <= 3; imageColumn++) {
					babyProduct_image = rs.getString("productId") + increament + ".jpg";
					blob = rs.getBlob("productSample"+imageColumn);
					byte [] imageArr = blob.getBytes(1, (int)blob.length());
					file = new FileOutputStream("C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\babyProduct\\" + babyProduct_image);
					file.write(imageArr);	
					
					increament++;
					if(increament > 3) {
						increament = 1;
					}	
				}
			}	
			
			System.out.println("Baby Products Image Loaded...");
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
		int increament = 1;
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product WHERE productCategory = 'Computing'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Blob blob;
				for (int imageColumn = 1; imageColumn <= 3; imageColumn++) {
					computing_image = rs.getString("productId") + increament + ".jpg";
					blob = rs.getBlob("productSample"+imageColumn);
					byte [] imageArr = blob.getBytes(1, (int)blob.length());
					file = new FileOutputStream("C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\computing\\" + computing_image );
					file.write(imageArr);	
					
					increament++;
					if(increament > 3) {
						increament = 1;
					}	
				}
			}		
			
			System.out.println("Computing Image Loaded...");
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
		int increament = 1;
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product WHERE productCategory = 'Electronics'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Blob blob;
				for (int imageColumn = 1; imageColumn <= 3; imageColumn++) {
					electronics_Image = rs.getString("productId") + increament + ".jpg";
					blob = rs.getBlob("productSample"+imageColumn);
					byte [] imageArr = blob.getBytes(1, (int)blob.length());
					file = new FileOutputStream("C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\electronics\\" + electronics_Image);
					file.write(imageArr);	
					
					increament++;
					if(increament > 3) {
						increament = 1;
					}	
				}
			}	
			
			System.out.println("Electronics Image Loaded...");
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
		int increament = 1;
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product WHERE productCategory = 'Fashion'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Blob blob;
				for (int imageColumn = 1; imageColumn <= 3; imageColumn++) {
					fashion_Image = rs.getString("productId") + increament + ".jpg";
					blob = rs.getBlob("productSample"+imageColumn);
					byte [] imageArr = blob.getBytes(1, (int)blob.length());
					file = new FileOutputStream("C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\fashion\\" + fashion_Image);
					file.write(imageArr);	
					
					increament++;
					if(increament > 3) {
						increament = 1;
					}	
				}
			}	
			
			System.out.println("Fashion Image Loaded...");
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
		int increament = 1;
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product WHERE productCategory = 'Gaming'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Blob blob;
				for (int imageColumn = 1; imageColumn <= 3; imageColumn++) {
					gaming_Image = rs.getString("productId") + increament + ".jpg";
					blob = rs.getBlob("productSample"+imageColumn);
					byte [] imageArr = blob.getBytes(1, (int)blob.length());
					file = new FileOutputStream("C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\gaming\\" + gaming_Image);
					file.write(imageArr);	
					
					increament++;
					if(increament > 3) {
						increament = 1;
					}	
				}
			}		
			
			System.out.println("Gaming Image Loaded...");
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
		int increament = 1;
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product WHERE productCategory = 'Health & Beauty'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Blob blob;
				for (int imageColumn = 1; imageColumn <= 3; imageColumn++) {
					health_beauty_Image = rs.getString("productId") + increament + ".jpg";
					blob = rs.getBlob("productSample"+imageColumn);
					byte [] imageArr = blob.getBytes(1, (int)blob.length());
					file = new FileOutputStream("C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\healthBeauty\\" + health_beauty_Image);
					file.write(imageArr);	
					
					increament++;
					if(increament > 3) {
						increament = 1;
					}	
				}
			}	
			
			System.out.println("Health & Beauty Image Loaded...");
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
		int increament = 1;
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product WHERE productCategory = 'Home & Office'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Blob blob;
				for (int imageColumn = 1; imageColumn <= 3; imageColumn++) {
					home_office_Image = rs.getString("productId") + increament + ".jpg";
					blob = rs.getBlob("productSample"+imageColumn);
					byte [] imageArr = blob.getBytes(1, (int)blob.length());
					file = new FileOutputStream("C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\homeOffice\\" + home_office_Image);
					file.write(imageArr);	
					
					increament++;
					if(increament > 3) {
						increament = 1;
					}	
				}
			}	
			
			System.out.println("Home & Office Image Loaded...");
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
		int increament = 1;
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product WHERE productCategory = 'Jewelries'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Blob blob;
				for (int imageColumn = 1; imageColumn <= 3; imageColumn++) {
					jewelries_Image = rs.getString("productId") + increament + ".jpg";
					blob = rs.getBlob("productSample"+imageColumn);
					byte [] imageArr = blob.getBytes(1, (int)blob.length());
					file = new FileOutputStream("C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\jewelries\\" + jewelries_Image);
					file.write(imageArr);	
					
					increament++;
					if(increament > 3) {
						increament = 1;
					}	
				}
			}	
			
			System.out.println("Jewelries Image Loaded...");
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
		int increament = 1;
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product WHERE productCategory = 'others'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Blob blob;
				for (int imageColumn = 1; imageColumn <= 3; imageColumn++) {
					others_Image = rs.getString("productId") + increament + ".jpg";
					blob = rs.getBlob("productSample"+imageColumn);
					byte [] imageArr = blob.getBytes(1, (int)blob.length());
					file = new FileOutputStream("C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\others\\" + others_Image);
					file.write(imageArr);	
					
					increament++;
					if(increament > 3) {
						increament = 1;
					}	
				}
			}	
			
			System.out.println("others Image Loaded...");
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
		int increament = 1;
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product WHERE productCategory = 'Phones & Tablets'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Blob blob;
				for (int imageColumn = 1; imageColumn <= 3; imageColumn++) {
					phones_tablets_Image = rs.getString("productId") + increament + ".jpg";
					blob = rs.getBlob("productSample"+imageColumn);
					byte [] imageArr = blob.getBytes(1, (int)blob.length());
					file = new FileOutputStream("C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\phonesTablets\\" + phones_tablets_Image);
					file.write(imageArr);	
					
					increament++;
					if(increament > 3) {
						increament = 1;
					}	
				}
			}		
			
			System.out.println("Phones & Tablets Image Loaded...");
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
		int increament = 1;
		try {
			PreparedStatement ps = null;
			Connection con = null;
			FileOutputStream file = null;			
			
			String sql = "select * from campusestock.product WHERE productCategory = 'Supermarket'";
			con = DbConnection.connection();
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Blob blob;
				for (int imageColumn = 1; imageColumn <= 3; imageColumn++) {
					supermarket_Image = rs.getString("productId") + increament + ".jpg";
					blob = rs.getBlob("productSample"+imageColumn);
					byte [] imageArr = blob.getBytes(1, (int)blob.length());
					file = new FileOutputStream("C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\supermarket\\" + supermarket_Image);
					file.write(imageArr);	
					
					increament++;
					if(increament > 3) {
						increament = 1;
					}	
				}
			}	
			
			System.out.println("Supermarket Image Loaded...");
			file.close();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("Couldn't Load Supermarket iMAGE!");
			e.printStackTrace();
		}
		return supermarket_Image;
	}
	
	
	//Delete all Existing Image in Folder
	public static void deleteProductImage(){
		File file=new File(path+"product\\vendorDetails\\");
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
	public static void deleteRelatedProductImage(){
		File file=new File("C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\product\\relatedProduct\\");
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
	
	public static void deleteProductImageInProductDetails(){
		File file=new File("C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\product\\productDetails\\");
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
		
		filePaths.add(path + "accessories\\");
		filePaths.add(path + "automobile\\");
		filePaths.add(path + "babyProduct\\");
		filePaths.add(path + "computing\\");
		filePaths.add(path + "electronics\\");
		filePaths.add(path + "fashion\\");
		filePaths.add(path + "gaming\\");
		filePaths.add(path + "healthBeauty\\");
		filePaths.add(path + "homeOffice\\");
		filePaths.add(path + "jewelries\\");
		filePaths.add(path + "others\\");
		filePaths.add(path + "phonesTablets\\");
		filePaths.add(path + "supermarket\\");
		
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
	
	public static void deleteImageInIndex(){
		ArrayList <String> filePaths = new ArrayList<String>();
		
		filePaths.add(path + "product\\filter1\\");
		filePaths.add(path + "product\\filter2\\");
		filePaths.add(path + "product\\filter3\\");
		filePaths.add(path + "product\\featuredProduct\\");
		filePaths.add(path + "allImage\\");
		
		for (String fp: filePaths) {
			path = fp;
			
			File file=new File(fp);
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
}
