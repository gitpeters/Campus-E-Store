package model;

public class Product {
	private String productId, vendorId, productName, datePosted, productStatus, adsStatus, brandName, keywords, productDescription, productCondition;
	private byte productSample1, prodcutSample2, productSample3;
	private double productAmount;

	public Product(String productId, String vendorId, String productName, String datePosted, String productStatus,
			String adsStatus, String brandName, String keywords, String productDescription, String productCondition,
			byte productSample1, byte prodcutSample2, byte productSample3, double productAmount) {
		super();
		this.productId = productId;
		this.vendorId = vendorId;
		this.productName = productName;
		this.datePosted = datePosted;
		this.productStatus = productStatus;
		this.adsStatus = adsStatus;
		this.brandName = brandName;
		this.keywords = keywords;
		this.productDescription = productDescription;
		this.productCondition = productCondition;
		this.productSample1 = productSample1;
		this.prodcutSample2 = prodcutSample2;
		this.productSample3 = productSample3;
		this.productAmount = productAmount;
	}

	public Product() {
		super();
	}

	public double getProductAmount() {
		return productAmount;
	}

	public void setProductAmount(double productAmount) {
		this.productAmount = productAmount;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getVendorId() {
		return vendorId;
	}

	public void setVendorId(String vendorId) {
		this.vendorId = vendorId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getDatePosted() {
		return datePosted;
	}

	public void setDatePosted(String datePosted) {
		this.datePosted = datePosted;
	}

	public String getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}

	public String getAdsStatus() {
		return adsStatus;
	}

	public void setAdsStatus(String adsStatus) {
		this.adsStatus = adsStatus;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public byte getProductSample1() {
		return productSample1;
	}

	public void setProductSample1(byte productSample1) {
		this.productSample1 = productSample1;
	}

	public byte getProdcutSample2() {
		return prodcutSample2;
	}

	public void setProdcutSample2(byte prodcutSample2) {
		this.prodcutSample2 = prodcutSample2;
	}

	public byte getProductSample3() {
		return productSample3;
	}

	public void setProductSample3(byte productSample3) {
		this.productSample3 = productSample3;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getProductCondition() {
		return productCondition;
	}

	public void setProductCondition(String productCondition) {
		this.productCondition = productCondition;
	}
	
}
