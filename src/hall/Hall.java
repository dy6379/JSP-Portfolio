package hall;

public class Hall {

	private String Sortation;//구분
	private String name;
	private String start_date;
	private String end_date;
	private String country;
	private String place;
	private String price;
	private String Inquiry;//문의
	private String homepage;
	
	public String getSortation() {
		return Sortation;
	}
	public void setSortation(String sortation) {
		Sortation = sortation;
	}
	
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getInquiry() {
		return Inquiry;
	}
	public void setInquiry(String inquiry) {
		Inquiry = inquiry;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Hall(String sortation, String name, String start_date, String end_date, String country, String place,
			String price, String inquiry, String homepage) {
		super();
		Sortation = sortation;
		this.name = name;
		this.start_date = start_date;
		this.end_date = end_date;
		this.country = country;
		this.place = place;
		this.price = price;
		Inquiry = inquiry;
		this.homepage = homepage;
	}
	public Hall() {
		// TODO Auto-generated constructor stub
	}
	
}
