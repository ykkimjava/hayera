package spring.mvc.domain;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO {
	private String prod_no;
	private String prod_name;
	private String brand;
	private String category;
	private int price;
	private int cost_price;
	private int discount_price;
	private int capacity;
	private String scent;
	private String scent_rating;
	private String feel;
	private String feel_rating;
	private String avg_rating;
	private int totalsales;
	private int stock;
	private String img_url;
	private String manager_id;
	private String product_explain;
	private String explain_url;
	
	public String getExplain_url() {
		return explain_url;
	}
	public void setExplain_url(String explain_url) {
		this.explain_url = explain_url;
	}
	MultipartFile file;	// write.jsp에 파일첨부시 name="file"과 동일한 변수명
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
		
		// 업로드 파일 접근
		if(! file.isEmpty()){
			this.img_url = file.getOriginalFilename();
//			this.b_fsize = file.getSize(); // 필요한지 고민해보기
			
			// 해당 경로로 변경
			File f = new File("C:\\Work\\project\\aHayera\\WebContent\\resources\\upload\\"+img_url);
			
			try {file.transferTo(f);
			} catch (IllegalStateException e) {e.printStackTrace();
			} catch (IOException e) {e.printStackTrace();}
		}
	}
	public String getProd_no() {
		return prod_no;
	}
	public void setProd_no(String prod_no) {
		this.prod_no = prod_no;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCost_price() {
		return cost_price;
	}
	public void setCost_price(int cost_price) {
		this.cost_price = cost_price;
	}
	public int getDiscount_price() {
		return discount_price;
	}
	public void setDiscount_price(int discount_price) {
		this.discount_price = discount_price;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public String getScent() {
		return scent;
	}
	public void setScent(String scent) {
		this.scent = scent;
	}
	public String getScent_rating() {
		return scent_rating;
	}
	public void setScent_rating(String scent_rating) {
		this.scent_rating = scent_rating;
	}
	public String getFeel() {
		return feel;
	}
	public void setFeel(String feel) {
		this.feel = feel;
	}
	public String getFeel_rating() {
		return feel_rating;
	}
	public void setFeel_rating(String feel_rating) {
		this.feel_rating = feel_rating;
	}
	public String getAvg_rating() {
		return avg_rating;
	}
	public void setAvg_rating(String avg_rating) {
		this.avg_rating = avg_rating;
	}
	public int getTotalsales() {
		return totalsales;
	}
	public void setTotalsales(int totalsales) {
		this.totalsales = totalsales;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public String getProduct_explain() {
		return product_explain;
	}
	public void setProduct_explain(String product_explain) {
		this.product_explain = product_explain;
	}
}
