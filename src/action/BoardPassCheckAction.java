package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardVO;

public class BoardPassCheckAction implements Action {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// passCheck에서 num,pass가져와 DB에 저장된 것과 비교			
		String num = request.getParameter("num");
		String pass = request.getParameter("pass");
		
		String message = "비밀번호가 맞지않습니다.";
		
		BoardVO vo = BoardDAO.getInstance().selectBoardByNum(num);
		
		String url = "";
		if(vo.getPass().equals(pass)) {
			url="/WEB-INF/views/sucessCheck.jsp";
		} else {
			request.setAttribute("message", message);
			url = "/WEB-INF/views/passCheck.jsp";
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
