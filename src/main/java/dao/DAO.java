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
import model.*;

public class DAO {
	private int noOfRecords;
	// Save Vendor Information

	public static int saveVendor(Vendor vn, FileItem fi) {
		int i = 0;
		Connection con = DbConnection.connection();
		String sql = "INSERT INTO campusestock.vendor(vendorId, vendorName, vendorEmail, vendorMatricNo, vendorPassword, vendorPhone, vendorBrandName, vendorSchoolId) values (?,?,?,?,?,?,?,?)";
		String sql2 = "INSERT INTO campusestock.position (username, position) values (?,?)";
		String sql3 = "INSERT INTO campusestock.login_credential values (?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, vn.getVendorId());
			ps.setString(2, vn.getVendorName());
			ps.setString(3, vn.getVendorEmail());
			ps.setString(4, vn.getVendorMatricNo());
			ps.setString(5, vn.getVendorPassword());
			ps.setString(6, vn.getVendorPhone());
			ps.setString(7, vn.getVendorBrandName());
			ps.setBinaryStream(8, fi.getInputStream(), (int) fi.getSize());

			i = ps.executeUpdate();

			PreparedStatement ps2 = con.prepareStatement(sql2);

			ps2.setString(1, vn.getVendorEmail());
			ps2.setString(2, vn.getPosition());

			i += ps2.executeUpdate();

			PreparedStatement ps3 = con.prepareStatement(sql3);

			ps3.setString(1, vn.getVendorEmail());
			ps3.setString(2, vn.getVendorPassword());
			ps3.setString(3, vn.getPosition());

			i += ps3.executeUpdate();

		} catch (SQLException e) {
			System.out.println(e + " exception occurred");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println(e + " exception occurred");
			e.printStackTrace();
		}

		return i;
	}

	// Authenticate vendor login
	public static boolean authenticateUser(Login_credential lc) {
		boolean validate = false;

		Connection con = DbConnection.connection();

		String sql = "SELECT * FROM campusestock.login_credential WHERE username = ? and password = ?";

		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, lc.getUsername());
			pst.setString(2, lc.getPassword());

			ResultSet rs = pst.executeQuery();

			validate = rs.next();

		} catch (SQLException e) {
			System.out.println(e + " exception occurred");
			e.printStackTrace();
		}

		return validate;
	}

	// Validate Vendor position
	public static Login_credential validatePosition(Login_credential lc) {
		Connection con = DbConnection.connection();
		Login_credential vendor = new Login_credential();
		String sql = "SELECT * FROM campusestock.position WHERE username = ?";

		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, lc.getUsername());

			ResultSet rst = pst.executeQuery();

			while (rst.next()) {
				vendor.setPosition(rst.getString(2));
			}
		} catch (SQLException e) {
			System.out.println(e + " exception occurred");
			e.printStackTrace();
		}
		return vendor;
	}

	// Query Vendor Table
	public static List<Vendor> getVendorByEmail(String email) {
		List<Vendor> vendors = new ArrayList<Vendor>();

		Connection con = DbConnection.connection();
		String sql = "SELECT * FROM campusestock.vendor WHERE vendorEmail = '" + email + "'";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
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

	public static List<Vendor> getVendorById(String vendorId) {
		List<Vendor> vendors = new ArrayList<Vendor>();

		Connection con = DbConnection.connection();
		String sql = "SELECT * FROM campusestock.vendor WHERE vendorId = '" + vendorId + "'";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Vendor vn = new Vendor();

				vn.setVendorId(rs.getString(1));
				vn.setVendorName(rs.getString(2));
				vn.setVendorEmail(rs.getString(3));
				vn.setVendorMatricNo(rs.getString(4));
				vn.setVendorBrandName(rs.getString(5));
				vn.setVendorPhone(rs.getString(6));
				vn.setVendorBrandName(rs.getString(7));

				vendors.add(vn);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return vendors;
	}

	// Adding new Product
	public static int addProduct(Product pr, FileItem f1, FileItem f2, FileItem f3) {
		int i = 0;
		Connection con = DbConnection.connection();
		String sql = "INSERT INTO campusestock.product values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, pr.getProductId());
			ps.setString(2, pr.getVendorId());
			ps.setString(3, pr.getProductName());
			ps.setString(4, pr.getProductDescription());
			ps.setString(5, pr.getProductCategory());
			ps.setString(6, pr.getProductCondition());
			ps.setString(7, pr.getDatePosted());
			ps.setString(8, pr.getProductStatus());
			ps.setBinaryStream(9, f1.getInputStream(), (int) f1.getSize());
			ps.setBinaryStream(10, f2.getInputStream(), (int) f2.getSize());
			ps.setBinaryStream(11, f3.getInputStream(), (int) f3.getSize());
			ps.setString(12, pr.getAdsStatus());
			ps.setString(13, pr.getBrandName());
			ps.setString(14, pr.getKeywords());
			ps.setDouble(15, pr.getProductAmount());
			i = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e + " exception occurred");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println(e + " exception occurred");
			e.printStackTrace();
		}

		return i;
	}
	
	// Saving feedbacks 
	public static int feedbackModel(FeedbackModel feedback) {
		int i = 0;
		Connection con = DbConnection.connection();
		String sql = "INSERT INTO campusestock.product_feedback VALUES(?,?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, feedback.getVendorId());
			ps.setString(2, feedback.getProductId());
			ps.setString(3, feedback.getFeedbackId());
			ps.setString(4, feedback.getFeedback());
			ps.setString(5, feedback.getFeedbackStatus());
			
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}

	// Query for all Vendor's information
	public static Vendor getVendor(String email) throws SQLException {
		Vendor vendor = new Vendor();
		Connection con = DbConnection.connection();

		String sql = "SELECT * FROM campusestock.vendor where vendorEmail = ?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, email);

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			vendor.setVendorId(rs.getString(1));
			vendor.setVendorName(rs.getString(2));
			vendor.setVendorEmail(rs.getString(3));
			vendor.setVendorMatricNo(rs.getString(4));
			vendor.setVendorPhone(rs.getString(6));
			vendor.setVendorBrandName(rs.getString(7));
		}

		return vendor;
	}

	// Query product table
	public static Product getProductDetails(String prodId) throws SQLException {
		Product pr = new Product();
		Connection con = DbConnection.connection();

		String sql = "SELECT * FROM campusestock.product WHERE productId = '" + prodId + "'";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			pr.setProductId(rs.getString("productId"));
			pr.setVendorId(rs.getString("vendorId"));
			pr.setProductName(rs.getString("productName"));
			pr.setProductDescription(rs.getString("productDescription"));
			pr.setProductCategory(rs.getString("productCategory"));
			pr.setProductCondition(rs.getString("productCondition"));
			pr.setDatePosted(rs.getString("datePosted"));
			pr.setProductStatus(rs.getString("productStatus"));
			pr.setAdsStatus(rs.getString("adsStatus"));
			pr.setBrandName(rs.getString("brandName"));
			pr.setKeywords(rs.getString("keywords"));
			pr.setProductAmount(rs.getDouble("productAmount"));
		}

		return pr;
	}

	public static List<Product> getProductDetailsWithList(String prodId) throws SQLException {
		List<Product> product = new ArrayList<Product>();
		Connection con = DbConnection.connection();

		String sql = "SELECT * FROM campusestock.product WHERE productId = '" + prodId + "'";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Product pr = new Product();
			pr.setProductId(rs.getString("productId"));
			pr.setVendorId(rs.getString("vendorId"));
			pr.setProductName(rs.getString("productName"));
			pr.setProductDescription(rs.getString("productDescription"));
			pr.setProductCategory(rs.getString("productCategory"));
			pr.setProductCondition(rs.getString("productCondition"));
			pr.setDatePosted(rs.getString("datePosted"));
			pr.setProductStatus(rs.getString("productStatus"));
			pr.setAdsStatus(rs.getString("adsStatus"));
			pr.setBrandName(rs.getString("brandName"));
			pr.setKeywords(rs.getString("keywords"));
			pr.setProductAmount(rs.getDouble("productAmount"));

			product.add(pr);
		}

		return product;
	}

	public static List<Product> getAllProductDetails() throws SQLException {
		List<Product> product = new ArrayList<Product>();
		Connection con = DbConnection.connection();

		String sql = "SELECT * FROM campusestock.product";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Product pr = new Product();
			pr.setProductId(rs.getString("productId"));
			pr.setVendorId(rs.getString("vendorId"));
			pr.setProductName(rs.getString("productName"));
			pr.setProductDescription(rs.getString("productDescription"));
			pr.setProductCategory(rs.getString("productCategory"));
			pr.setProductCondition(rs.getString("productCondition"));
			pr.setDatePosted(rs.getString("datePosted"));
			pr.setProductStatus(rs.getString("productStatus"));
			pr.setAdsStatus(rs.getString("adsStatus"));
			pr.setBrandName(rs.getString("brandName"));
			pr.setKeywords(rs.getString("keywords"));
			pr.setProductAmount(rs.getDouble("productAmount"));

			product.add(pr);
		}

		return product;
	}
	
	public static List<Product> filterImage1() throws SQLException {
		List<Product> product = new ArrayList<Product>();
		Connection con = DbConnection.connection();
		
		String sql = "SELECT * FROM campusestock.product WHERE productCategory = 'Health & Beauty' OR productCategory = 'Home & Office' OR productCategory = 'Computing'";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Product pr = new Product();
			pr.setProductId(rs.getString("productId"));
			pr.setVendorId(rs.getString("vendorId"));
			pr.setProductName(rs.getString("productName"));
			pr.setProductDescription(rs.getString("productDescription"));
			pr.setProductCategory(rs.getString("productCategory"));
			pr.setProductCondition(rs.getString("productCondition"));
			pr.setDatePosted(rs.getString("datePosted"));
			pr.setProductStatus(rs.getString("productStatus"));
			pr.setAdsStatus(rs.getString("adsStatus"));
			pr.setBrandName(rs.getString("brandName"));
			pr.setKeywords(rs.getString("keywords"));
			pr.setProductAmount(rs.getDouble("productAmount"));
			
			product.add(pr);
		}
		
		return product;
	}
	
	public static List<Product> filterImage2() throws SQLException {
		List<Product> product = new ArrayList<Product>();
		Connection con = DbConnection.connection();
		
		String sql = "SELECT * FROM campusestock.product WHERE productCategory = 'Electronic' OR productCategory = 'Baby Products' OR productCategory = 'Gaming'";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Product pr = new Product();
			pr.setProductId(rs.getString("productId"));
			pr.setVendorId(rs.getString("vendorId"));
			pr.setProductName(rs.getString("productName"));
			pr.setProductDescription(rs.getString("productDescription"));
			pr.setProductCategory(rs.getString("productCategory"));
			pr.setProductCondition(rs.getString("productCondition"));
			pr.setDatePosted(rs.getString("datePosted"));
			pr.setProductStatus(rs.getString("productStatus"));
			pr.setAdsStatus(rs.getString("adsStatus"));
			pr.setBrandName(rs.getString("brandName"));
			pr.setKeywords(rs.getString("keywords"));
			pr.setProductAmount(rs.getDouble("productAmount"));
			
			product.add(pr);
		}
		
		return product;
	}
	
	public static List<Product> filterImage3() throws SQLException {
		List<Product> product = new ArrayList<Product>();
		Connection con = DbConnection.connection();
		
		String sql = "SELECT * FROM campusestock.product WHERE productCategory = 'Automobile' OR productCategory = 'Accessories' OR productCategory = 'Others'";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Product pr = new Product();
			pr.setProductId(rs.getString("productId"));
			pr.setVendorId(rs.getString("vendorId"));
			pr.setProductName(rs.getString("productName"));
			pr.setProductDescription(rs.getString("productDescription"));
			pr.setProductCategory(rs.getString("productCategory"));
			pr.setProductCondition(rs.getString("productCondition"));
			pr.setDatePosted(rs.getString("datePosted"));
			pr.setProductStatus(rs.getString("productStatus"));
			pr.setAdsStatus(rs.getString("adsStatus"));
			pr.setBrandName(rs.getString("brandName"));
			pr.setKeywords(rs.getString("keywords"));
			pr.setProductAmount(rs.getDouble("productAmount"));
			
			product.add(pr);
		}
		
		return product;
	}

	// Query Product table by vendorId
	public static List<Product> getProductByVendorID(String vendorID) throws SQLException {
		List<Product> product = new ArrayList<Product>();
		Connection con = DbConnection.connection();

		String sql = "SELECT * FROM campusestock.product WHERE vendorId = '" + vendorID + "'";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Product pr = new Product();
			pr.setProductId(rs.getString("productId"));
			pr.setVendorId(rs.getString("vendorId"));
			pr.setProductName(rs.getString("productName"));
			pr.setProductDescription(rs.getString("productDescription"));
			pr.setProductCategory(rs.getString("productCategory"));
			pr.setProductCondition(rs.getString("productCondition"));
			pr.setDatePosted(rs.getString("datePosted"));
			pr.setProductStatus(rs.getString("productStatus"));
			pr.setAdsStatus(rs.getString("adsStatus"));
			pr.setBrandName(rs.getString("brandName"));
			pr.setKeywords(rs.getString("keywords"));
			pr.setProductAmount(rs.getDouble("productAmount"));

			product.add(pr);
		}

		return product;
	}

	// Product List Pagination
	public  List<Product> getProductByVendorIDPagination(String vendorID, int start, int noOfRecords) throws SQLException {
		List<Product> product = new ArrayList<Product>();
		Connection con = DbConnection.connection();

		String sql = "SELECT * FROM campusestock.product WHERE vendorId = '" + vendorID + "' LIMIT "+start+","+noOfRecords;
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Product pr = new Product();
			pr.setProductId(rs.getString("productId"));
			pr.setVendorId(rs.getString("vendorId"));
			pr.setProductName(rs.getString("productName"));
			pr.setProductDescription(rs.getString("productDescription"));
			pr.setProductCategory(rs.getString("productCategory"));
			pr.setProductCondition(rs.getString("productCondition"));
			pr.setDatePosted(rs.getString("datePosted"));
			pr.setProductStatus(rs.getString("productStatus"));
			pr.setAdsStatus(rs.getString("adsStatus"));
			pr.setBrandName(rs.getString("brandName"));
			pr.setKeywords(rs.getString("keywords"));
			pr.setProductAmount(rs.getDouble("productAmount"));

			product.add(pr);
		}
		rs.close();
		rs = ps.executeQuery("SELECT FOUND_ROWS()");
		  
        if (rs.next())
           this.noOfRecords = rs.getInt(1);
        

		return product;
	}
	
	// getter
	public int getNoOfRecords() { 
		System.out.println("number records:: "+noOfRecords);
		return noOfRecords; 
	}

	// Query Product table by Name
	public static List<Product> getProductByName(String prodName) throws SQLException {
		List<Product> product = new ArrayList<Product>();
		Connection con = DbConnection.connection();

		String sql = "SELECT * FROM campusestock.product WHERE productName = '" + prodName + "'";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Product pr = new Product();

			pr.setProductId(rs.getString("productId"));
			pr.setVendorId(rs.getString("vendorId"));
			pr.setProductName(rs.getString("productName"));
			pr.setProductDescription(rs.getString("productDescription"));
			pr.setProductCategory(rs.getString("productCategory"));
			pr.setProductCondition(rs.getString("productCondition"));
			pr.setDatePosted(rs.getString("datePosted"));
			pr.setProductStatus(rs.getString("productStatus"));
			pr.setAdsStatus(rs.getString("adsStatus"));
			pr.setBrandName(rs.getString("brandName"));
			pr.setKeywords(rs.getString("keywords"));
			pr.setProductAmount(rs.getDouble("productAmount"));

			product.add(pr);
		}

		return product;
	}
	
	public static Vendor getVendorPassword(String email) throws SQLException {
		Vendor vendor = new Vendor();
		Connection con = DbConnection.connection();
		String sql = "SELECT vendorPassword from campusestock.vendor WHERE vendorEmail = '"+email+"'";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			vendor.setVendorPassword(rs.getString("vendorPassword"));
		}
		return vendor;
	}

	// Delete Product by productId
	public static int deleteProductById(Product product) throws SQLException {
		int i = 0;
		Connection con = DbConnection.connection();
		String sql = "DELETE FROM campusestock.product WHERE productId = '" + product.getProductId() + "'";
		PreparedStatement pst = con.prepareStatement(sql);
		i = pst.executeUpdate();
		return i;
	}
	
	//Update vendor info
	
	public static int updateVendorInfo(Vendor vendor) throws SQLException {
		int i =0;
		
		Connection con = DbConnection.connection();
		String sql = "UPDATE campusestock.vendor set vendorPhone = '"+vendor.getVendorPhone()+"', vendorBrandName= '"+vendor.getVendorBrandName()+"'  WHERE vendorEmail = '"+vendor.getVendorEmail()+"' ";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
//		ps.setString(1, vendor.getVendorEmail());
//		ps.setString(2, vendor.getVendorPhone());
//		ps.setString(3, vendor.getVendorBrandName());
		i = ps.executeUpdate();
		return i;
	}
	
	
	
	
	// Change vendor password
	public static int changeVendorPassword(Vendor vendor) throws SQLException {
		int i =0;
		
		Connection con = DbConnection.connection();
		String sql = "UPDATE campusestock.vendor set vendorPassword = '"+vendor.getVendorPassword()+"' WHERE vendorEmail = '"+vendor.getVendorEmail()+"' ";
		
		PreparedStatement ps = con.prepareStatement(sql);
		i = ps.executeUpdate();
		return i;
	}
	
	// Change vendor password
		public static int changeBrandName(Vendor vendor) throws SQLException {
			int i =0;
			
			Connection con = DbConnection.connection();
			String sql = "UPDATE campusestock.vendor set vendorBrandName = '"+vendor.getVendorBrandName()+"' WHERE vendorEmail = '"+vendor.getVendorEmail()+"' ";
			
			PreparedStatement ps = con.prepareStatement(sql);
			i = ps.executeUpdate();
			return i;
		}
}
