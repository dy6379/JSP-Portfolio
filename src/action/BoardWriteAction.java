package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardVO;

public class BoardWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// BoardVO객체에 입력값들을 전달받고 vo에 저장
		BoardVO bVo = new BoardVO();
		bVo.setPass(request.getParameter("pass"));
		bVo.setName(request.getParameter("name"));
		bVo.setEmail(request.getParameter("email"));
		bVo.setTitle(request.getParameter("title"));
		bVo.setContent(request.getParameter("content"));
		
		//BoardDAO에 넣는다
		BoardDAO bDao = BoardDAO.getInstance();
		//DB저장
		bDao.insertBoard(bVo);
		//입력후 게시글리스트에 이동한다
		response.sendRedirect("BoardServlet?command=board_list");
	}
}
