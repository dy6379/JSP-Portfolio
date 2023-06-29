package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	//추상메서드 XXXAction.java 생성가능
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException;
}
