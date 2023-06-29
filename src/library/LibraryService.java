package library;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connectdb.ConnectionDB;

public class LibraryService {
	ConnectionDB dbConnect = new ConnectionDB();

	public int getSearchCount(String searchKeyword, String searchTarget) {
        int count = 0;

        try {
            Connection con = dbConnect.getCon();
            String sql = "";

            if(searchTarget.equals("name")){
                sql = "SELECT COUNT(*) FROM library WHERE name LIKE ? ";
            } else if (searchTarget.equals("address")) {
                sql = "SELECT COUNT(*) FROM library WHERE ADDRESS LIKE ?";
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
	
	public List<Library> getLibrarys() {
		List<Library> librarys = new ArrayList<>();

		try {
			Connection con = dbConnect.getCon();
			String sql = "SELECT * FROM library";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			dbConnect.closeAll(rs, pstmt, con);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return librarys;
	}
		
	public List<Library> getPageLibrarys(int pageNum){
		
		Connection con = dbConnect.getCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<Library> librarys = new ArrayList<>();
		//pageNum부터 amount까 
		String sql = "select * from library limit ?,10";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pageNum*10);
			
			rs = pstmt.executeQuery();
			
			
			writeLibraryList(librarys,con,pstmt);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return librarys;
	}
	
	public int getCount() {
		int count = 0;
		String sql = "select count(*) from library";
		
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
	
	 public Library getOneLibrary(String zipcode){
	        Library library = new Library();
	        try {
	            Connection con = dbConnect.getCon();
	            String sql = "SELECT * FROM library WHERE address= ?";
	            PreparedStatement pstmt = null;
	            ResultSet rs = null;

	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1,zipcode);
	            rs = pstmt.executeQuery();
	            
	            while(rs.next()) {
					String name = rs.getString("name");
					String type = rs.getString("type");
					Integer count = rs.getInt("count");
					String address = rs.getString("address");
					String phoneNum = rs.getString("phoneNum");
					String homePage = rs.getString("homePage");
					library.setName(name);
					library.setType(type);
					library.setCount(count);
					library.setAddress(address);
					library.setPhoneNum(phoneNum);
					library.setHomePage(homePage);
				}
	            dbConnect.closeAll(rs, pstmt, con);
	        } catch (SQLException e) {
	            throw new RuntimeException(e);
	        }

	        return library;
	    }

	    public List<Library> getSpecificLibrarys(String searchKeyword, String searchTarget, int page) {
	        List<Library> librarys = new ArrayList<>();


	        try {
	            Connection con = dbConnect.getCon();
	            String sql = "";

	            if(searchTarget.equals("name")){
	                sql = "SELECT * FROM library WHERE NAME LIKE ? LIMIT ?,10";
	            } else if (searchTarget.equals("address")) {
	                sql = "SELECT * FROM library WHERE ADDRESS LIKE ? LIMIT ?,10";
	            } 

	            PreparedStatement pstmt = null;
	            ResultSet rs = null;

	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1,"%"+searchKeyword+"%");
	            pstmt.setInt(2,page*10);


	            writeLibraryList(librarys, con, pstmt);
	        } catch (SQLException e) {
	            throw new RuntimeException(e);
	        }
	        return librarys;

	    }



	    private void writeLibraryList(List<Library> librarys, Connection con, PreparedStatement pstmt) throws SQLException {
	        ResultSet rs;
	        rs = pstmt.executeQuery();

	        while (rs.next()){
				String name = rs.getString("name");
				String type = rs.getString("type");
				int count = rs.getInt("count");
				String address = rs.getString("address");
				String phoneNum = rs.getString("phoneNum");
				String homePage = rs.getString("homePage");
				Library library = new Library();
	            librarys.add(library);
	        }
	        dbConnect.closeAll(rs, pstmt, con);
	    }
	
	
}
