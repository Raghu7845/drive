package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

/**
 * Servlet implementation class NewEmployeeCtrler
 */
@WebServlet("/NewEmployeeCtrler")
public class NewEmployeeCtrler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

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
		HttpSession session=request.getSession();
		if(session.getAttribute("login")!=null){
		  DBQuery db=new DBQuery();
		  String email=request.getParameter("email");
		  String password=request.getParameter("password");
		  String number=request.getParameter("number");
		  String fname=request.getParameter("fname");
		  String sex=request.getParameter("sex");
		  
		  if(password==null||number==null){
			  Gson gson=new Gson();
			  response.getWriter().println(gson.toJson(db.checkEmail(email)));
			  
		  }
		  else{
		  Gson gson=new Gson();
		  String registerResponse =gson.toJson(db.insertToEmployeesDB(email,password,number,fname,sex));
		  response.getWriter().println(registerResponse);
		}
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
