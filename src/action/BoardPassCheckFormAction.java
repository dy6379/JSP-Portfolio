package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardPassCheckFormAction implements Action {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 비밀번호 확인페이지로 포워딩
		request.getRequestDispatcher("/WEB-INF/views/passCheck.jsp").forward(request,response);
	}
}
