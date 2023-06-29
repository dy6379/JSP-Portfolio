package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;

public class BoardDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 삭제 
		BoardDAO bDao = BoardDAO.getInstance();
		bDao.deleteBoard(request.getParameter("num")); // Integer로 파싱하여 전달합니다.
	     response.sendRedirect("BoardServlet?command=board_list");
	}

}
