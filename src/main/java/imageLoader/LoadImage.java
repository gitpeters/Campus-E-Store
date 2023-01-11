package imageLoader;

import java.sql.Blob;

public class LoadImage {
	private Blob sample1;
	private Blob sample2;
	private Blob sample3;
	private String base64Image;
	private String productId;
	
	public Blob getSample1() {
		return sample1;
	}
	public void setSample1(Blob blob) {
		this.sample1 = blob;
	}
	public Blob getSample2() {
		return sample2;
	}
	public void setSample2(Blob sample2) {
		this.sample2 = sample2;
	}
	public Blob getSample3() {
		return sample3;
	}
	public void setSample3(Blob sample3) {
		this.sample3 = sample3;
	}
	public String getBase64Image() {
		return base64Image;
	}
	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	
	
}
