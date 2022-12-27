package model;

public class ProductAds {
	private String productId, vendorId, adsId, adsAmount, adsStartDate, adsEndDate, adsStatus, adsDuration;

	
	
	public ProductAds(String productId, String vendorId, String adsId, String adsAmount, String adsStartDate,
			String adsEndDate, String adsStatus, String adsDuration) {
		super();
		this.productId = productId;
		this.vendorId = vendorId;
		this.adsId = adsId;
		this.adsAmount = adsAmount;
		this.adsStartDate = adsStartDate;
		this.adsEndDate = adsEndDate;
		this.adsStatus = adsStatus;
		this.adsDuration = adsDuration;
	}
	
	
	public ProductAds() {
		super();
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

	public String getAdsId() {
		return adsId;
	}

	public void setAdsId(String adsId) {
		this.adsId = adsId;
	}

	public String getAdsAmount() {
		return adsAmount;
	}

	public void setAdsAmount(String adsAmount) {
		this.adsAmount = adsAmount;
	}

	public String getAdsStartDate() {
		return adsStartDate;
	}

	public void setAdsStartDate(String adsStartDate) {
		this.adsStartDate = adsStartDate;
	}

	public String getAdsEndDate() {
		return adsEndDate;
	}

	public void setAdsEndDate(String adsEndDate) {
		this.adsEndDate = adsEndDate;
	}

	public String getAdsStatus() {
		return adsStatus;
	}

	public void setAdsStatus(String adsStatus) {
		this.adsStatus = adsStatus;
	}

	public String getAdsDuration() {
		return adsDuration;
	}

	public void setAdsDuration(String adsDuration) {
		this.adsDuration = adsDuration;
	}

}
