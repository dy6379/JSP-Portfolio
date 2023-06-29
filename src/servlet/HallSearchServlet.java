package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hall.Hall;
import hall.HallService;


@WebServlet(name="hallSearchServlet", value="/hall/search")
public class HallSearchServlet extends HttpServlet{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HallService hallService = new HallService();
		
        String searchKeyword = request.getParameter("search_keyword");
        String searchTarget = request.getParameter("search_target");
        // 1페이지당 10개.
        int page = Integer.parseInt(request.getParameter("page"));
        page -= 1; // first page =  0

        int totalSearchCount = hallService.getSearchCount(searchKeyword,searchTarget);
        List<Hall> halls = hallService.getSpecificHalls(searchKeyword, searchTarget,page);

     // 총 페이지 갯수

        int totalPages = (int) Math.ceil((double) totalSearchCount / 10);

        request.setAttribute("searchKeyword", searchKeyword);
        request.setAttribute("searchTarget", searchTarget);
        request.setAttribute("totalPages",totalPages);
        request.setAttribute("sendPageNum",page+1);
        request.setAttribute("halls", halls);

        request.getRequestDispatcher("/WEB-INF/views/hall-search.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
}
