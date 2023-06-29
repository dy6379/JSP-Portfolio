package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connectdb.ConnectionDB;

public class BoardDAO {
		ConnectionDB dbConnect = new ConnectionDB();

		private BoardDAO() {
			
		}
		
		private static BoardDAO instance = new BoardDAO(); 
		
		public static BoardDAO getInstance() {
			return instance;
		}
		//가져오기
		public List<BoardVO> selectAllBoards () {
			String sql = "select * from board";
			
			List<BoardVO> list = new ArrayList<BoardVO>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				Connection con = dbConnect.getCon();
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					BoardVO bVo = new BoardVO();
					bVo.setNum(rs.getInt("num"));
					bVo.setPass(rs.getString("pass"));
					bVo.setName(rs.getString("name"));
					bVo.setEmail(rs.getString("email"));
					bVo.setTitle(rs.getString("title"));
					bVo.setContent(rs.getString("content"));
					bVo.setReadCount(rs.getInt("readcount"));
					bVo.setWriteDate(rs.getTimestamp("writedate"));
					list.add(bVo);
				}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				dbConnect.closeAll(rs, pstmt, conn);
			}
			return list;
		}
		
		//게시글쓰기
		public void insertBoard(BoardVO bVo) {
			String sql = "insert into board(pass,name,email,title,content) values(?,?,?,?,?)";
			Connection conn = null;
			PreparedStatement pstmt = null;
			try {
				Connection con = dbConnect.getCon();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, bVo.getPass());
				pstmt.setString(2, bVo.getName());
				pstmt.setString(3, bVo.getEmail());
				pstmt.setString(4, bVo.getTitle());
				pstmt.setString(5, bVo.getContent());
				pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				dbConnect.close(pstmt, conn);
			}		
		}
		
		//parameter로 num을 받아 num과 같은 데이터가져오기
		public BoardVO selectBoardByNum(String num) {
			String sql = "select * from board where num = ?";
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			BoardVO bVo = null;
			try {
				Connection con = dbConnect.getCon();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,num);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					bVo = new BoardVO();
					bVo.setNum(rs.getInt("num"));
					bVo.setName(rs.getString("name"));
					bVo.setPass(rs.getString("pass"));
					bVo.setTitle(rs.getString("title"));
					bVo.setEmail(rs.getString("email"));
					bVo.setContent(rs.getString("content"));
					bVo.setReadCount(rs.getInt("readcount"));
					bVo.setWriteDate(rs.getTimestamp("writedate"));
				}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				dbConnect.closeAll(rs, pstmt, conn);
			}
			return bVo;
		}
		
		//조회수(readCount)를 증가시키는 메서드
		public void readCountPlus(String num) {
			String sql = "update board set readcount = readcount+1 where num = ?";
			Connection conn = null;
			PreparedStatement pstmt = null;
			try {
				Connection con = dbConnect.getCon();
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(num));
				pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				dbConnect.close(pstmt, conn);
			}
		}
		
		//비밀번호 체크
		public boolean checkPass(String pass, String num) {
			String sql = "select pass from board where num = ?";
			boolean PassOk = false;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				Connection con = dbConnect.getCon();
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(num));
				rs = pstmt.executeQuery();
				while(rs.next()) {
					if(pass.equals(rs.getString("pass"))) {
						PassOk = true;
					} else {
						PassOk = false;
					}
				}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				dbConnect.closeAll(rs, pstmt, conn);
			}
			return PassOk;
		}
		
		//수정
		public void updateBoard(BoardVO bVo) {
			String sql = "update board set name = ?, pass = ?, email = ?, title = ?, content = ? where num = ?";
			Connection conn = null;
			PreparedStatement pstmt = null;
			try {
				Connection con = dbConnect.getCon();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, bVo.getName());
				pstmt.setString(2, bVo.getPass());
				pstmt.setString(3, bVo.getEmail());
				pstmt.setString(4, bVo.getTitle());
				pstmt.setString(5, bVo.getContent());
				pstmt.setInt(6, bVo.getNum());
				pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				dbConnect.close(pstmt, conn);
			}
		}
		
		//삭제
		public void deleteBoard(String num) {
			String sql = "delete from board where num = ?";
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				Connection con = dbConnect.getCon();
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(num));
				pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				dbConnect.close(pstmt, conn);
			}
		}
		
}
