package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardVO;

public class BoardViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 조회수(readCount) 증가(readCountPlus)시킨후 bDao에서 상세정보보기(selectBoardByNum) 가져온다
		String num = request.getParameter("num");
		// 조회수 증가시킨후 DB저장
		BoardDAO.getInstance().readCountPlus(num);
		//num에 해당하는 게시글 가져온다
		BoardVO bVo = BoardDAO.getInstance().selectBoardByNum(num);
		
		request.setAttribute("boardone", bVo);
		request.getRequestDispatcher("/WEB-INF/views/boardView.jsp").forward(request,response);
	}
}
