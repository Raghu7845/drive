package controller;



import controller.Common;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;



/**
 * Servlet implementation class LoginCtrler
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/LoginCtrler" })
public class LoginCtrler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
		response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
		response.setContentType("text/html");
		String email=request.getParameter("email").trim();
		String password=request.getParameter("password").trim();
		 password=Common.generateHash(password).trim();
		 DBQuery loginDBCheck=new DBQuery();
		 try {
			 Gson gson=new Gson();
			 request.setAttribute("email", email);
			 String loginResponse=gson.toJson(loginDBCheck.checkLogin(email, password));
			 response.getWriter().print(loginResponse);

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

			}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
