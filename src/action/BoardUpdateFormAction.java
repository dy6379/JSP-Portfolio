package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardVO;

public class BoardUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String num = request.getParameter("num");
		BoardDAO bDao = BoardDAO.getInstance();
		bDao.readCountPlus(num);
		
		BoardVO bVo = bDao.selectBoardByNum(num);
		
		request.setAttribute("board", bVo);
		request.getRequestDispatcher("/WEB-INF/views/boardUpdate.jsp").forward(request, response);
	}
}
