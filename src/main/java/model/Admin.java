package model;

public class Admin {
	private String adminUsername, adminPassword, adminId;

	
	public Admin(String adminUsername, String adminPassword, String adminId) {
		super();
		this.adminUsername = adminUsername;
		this.adminPassword = adminPassword;
		this.adminId = adminId;
	}
	
	

	public Admin() {
		super();
	}



	public String getAdminUsername() {
		return adminUsername;
	}

	public void setAdminUsername(String adminUsername) {
		this.adminUsername = adminUsername;
	}

	public String getAdminPassword() {
		return adminPassword;
	}

	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

}
