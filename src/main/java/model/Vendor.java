package model;

public class Vendor {
	private String vendorId, vendorName, vendorPhone, vendorMatricNo, vendorPassword,
			vendorBrandName, vendorEmail, position;
	private byte vendorSchoolId;
	
	public Vendor() {
		super();
	}
	
	public Vendor(String vendorId, String vendorName, String vendorPhone, String vendorMatricNo, String vendorPassword,
			String vendorBrandName, String vendorEmail, String position, byte vendorSchoolId) {
		super();
		this.vendorId = vendorId;
		this.vendorName = vendorName;
		this.vendorPhone = vendorPhone;
		this.vendorMatricNo = vendorMatricNo;
		this.vendorPassword = vendorPassword;
		this.vendorBrandName = vendorBrandName;
		this.vendorEmail = vendorEmail;
		this.position = position;
		this.vendorSchoolId = vendorSchoolId;
	}

	public String getVendorId() {
		return vendorId;
	}

	public void setVendorId(String vendorId) {
		this.vendorId = vendorId;
	}

	public String getVendorName() {
		return vendorName;
	}

	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}

	public String getVendorMatricNo() {
		return vendorMatricNo;
	}

	public void setVendorMatricNo(String vendorMatricNo) {
		this.vendorMatricNo = vendorMatricNo;
	}

	public String getVendorPhone() {
		return vendorPhone;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public void setVendorPhone(String vendorPhone) {
		this.vendorPhone = vendorPhone;
	}

	public String getVendorPassword() {
		return vendorPassword;
	}

	public void setVendorPassword(String vendorPassword) {
		this.vendorPassword = vendorPassword;
	}

	public String getVendorBrandName() {
		return vendorBrandName;
	}

	public void setVendorBrandName(String vendorBrandName) {
		this.vendorBrandName = vendorBrandName;
	}

	public byte getVendorSchoolId() {
		return vendorSchoolId;
	}

	public void setVendorSchoolId(byte vendorSchoolId) {
		this.vendorSchoolId = vendorSchoolId;
	}

	public String getVendorEmail() {
		return vendorEmail;
	}

	public void setVendorEmail(String vendorEmail) {
		this.vendorEmail = vendorEmail;
	}

}
