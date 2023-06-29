package hall;

import connectdb.ConnectionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HallService {

	ConnectionDB dbConnect = new ConnectionDB();
	
    public int getSearchCount(String searchKeyword, String searchTarget) {
        int count = 0;

        try {
            Connection con = dbConnect.getCon();
            String sql = "";

            if(searchTarget.equals("name")){
                sql = "SELECT COUNT(*) FROM hall WHERE name LIKE ? ";
            } else if (searchTarget.equals("address")) {
                sql = "SELECT COUNT(*) FROM hall WHERE sortation LIKE ?";
            } else if (searchTarget.equals("dish")) {
                sql = "SELECT COUNT(*) FROM hall WHERE country LIKE ?";
            }

            PreparedStatement pstmt = null;
            ResultSet rs = null;

            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,"%"+searchKeyword+"%");
            rs = pstmt.executeQuery();

            while (rs.next()){
                count =  rs.getInt(1);
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return count;
    }
	
	public List<Hall> getHalls() {
		List<Hall> halls = new ArrayList<>();

		try {
			Connection con = dbConnect.getCon();
			String sql = "SELECT * FROM HALL";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			dbConnect.closeAll(rs, pstmt, con);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return halls;
	}
		
	public List<Hall> getPageHalls(int pageNum){
		
		Connection con = dbConnect.getCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<Hall> halls = new ArrayList<>();
		//pageNum부터 amount까 
		String sql = "select * from hall limit ?,10";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pageNum*10);
			
			rs = pstmt.executeQuery();
			
			
			writeHallList(halls,con,pstmt);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return halls;
	}
	
	public int getCount() {
		int count = 0;
		String sql = "select count(*) from hall";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Connection con = dbConnect.getCon();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				count=rs.getInt(1);
			}
			dbConnect.closeAll(rs, pstmt, con);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return count;
	}
	
	 public Hall getOneHall(String zipcode){
	        Hall hall = new Hall();
	        try {
	            Connection con = dbConnect.getCon();
	            String sql = "SELECT * FROM hall WHERE ADDRESS= ?";
	            PreparedStatement pstmt = null;
	            ResultSet rs = null;

	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1,zipcode);
	            rs = pstmt.executeQuery();
	            
	            while(rs.next()) {
	            	String sortation = rs.getString("sortation");
					String name = rs.getString("name");
					String start_date = rs.getString("start_date");
					String end_date = rs.getString("end_date");
					String country = rs.getString("country");
					String place = rs.getString("place");
					String price = rs.getString("price");
					String Inquiry = rs.getString("Inquiry");
					String homepage = rs.getString("homepage");
					hall.setSortation(sortation);
					hall.setName(name);
					hall.setStart_date(start_date);
					hall.setEnd_date(end_date);
					hall.setCountry(country);
					hall.setPlace(place);
					hall.setPrice(price);
					hall.setInquiry(Inquiry);
					hall.setHomepage(homepage);
					
				}
	            dbConnect.closeAll(rs, pstmt, con);
	        } catch (SQLException e) {
	            throw new RuntimeException(e);
	        }

	        return hall;
	    }

	    public List<Hall> getSpecificHalls(String searchKeyword, String searchTarget, int page) {
	        List<Hall> halls = new ArrayList<>();


	        try {
	            Connection con = dbConnect.getCon();
	            String sql = "";

	            if(searchTarget.equals("hallName")){
	                sql = "SELECT * FROM hall WHERE NAME LIKE ? LIMIT ?,10";
	            } else if (searchTarget.equals("address")) {
	                sql = "SELECT * FROM hall WHERE ADDRESS LIKE ? LIMIT ?,10";
	            } else if (searchTarget.equals("country")) {
	                sql = "SELECT * FROM hall WHERE sortation LIKE ? LIMIT ?,10";
	            }


	            PreparedStatement pstmt = null;
	            ResultSet rs = null;

	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1,"%"+searchKeyword+"%");
	            pstmt.setInt(2,page*10);


	            writeHallList(halls, con, pstmt);
	        } catch (SQLException e) {
	            throw new RuntimeException(e);
	        }
	        return halls;

	    }

	    private void writeHallList(List<Hall> halls, Connection con, PreparedStatement pstmt) throws SQLException {
	        ResultSet rs;
	        rs = pstmt.executeQuery();

	        while (rs.next()){
	        	String sortation = rs.getString("sortation");
				String name = rs.getString("name");
				String start_date = rs.getString("start_date");
				String end_date = rs.getString("end_date");
				String country = rs.getString("country");
				String place = rs.getString("place");
				String price = rs.getString("price");
				String Inquiry = rs.getString("Inquiry");
				String homepage = rs.getString("homepage");
	            Hall hall =new Hall(sortation, name, start_date, end_date, country, place,price, Inquiry, homepage);
	            halls.add(hall);
	        }
	        dbConnect.closeAll(rs, pstmt, con);
	    }
	
	
}
