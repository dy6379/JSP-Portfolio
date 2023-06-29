package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hall.Hall;
import hall.HallService;
import library.Library;
import library.LibraryService;

@WebServlet(name = "LibraryServlet", value = "/library", initParams = {@WebInitParam(name="page", value = "1")})
public class LibraryServlet extends HttpServlet {
	
	LibraryService libraryService = new LibraryService();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String stringPage = request.getParameter("page");
	        int page ;

	        if(stringPage==null){
	            page = Integer.parseInt(this.getInitParameter("page"));
	        }else {
	            page = Integer.parseInt(stringPage);
	        }


	        // 1페이지당 10개.
	        page -= 1; // first page =

	        int totalCount = libraryService.getCount();
	        List<Library> pagelibrarys = libraryService.getPageLibrarys(page);
	        
	        int totalPages = (int) Math.ceil((double) totalCount / 10);
	        request.setAttribute("totalPages",totalPages);
	        request.setAttribute("sendPageNum",page+1);
			request.setAttribute("halls", pagelibrarys);
		request.getRequestDispatcher("/WEB-INF/views/library.jsp").forward(request, response);
	}

}
