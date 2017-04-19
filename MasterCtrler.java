package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

/**
 * Servlet implementation class MasterCtrler
 */
@WebServlet("/MasterCtrler")
public class MasterCtrler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MasterCtrler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
		response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
		String userId=request.getParameter("user_id");
		System.out.println("userId");
		DBQuery db=new DBQuery();
		int user=db.countUsers();
		int emp=db.countDept();
		System.out.println(user);
		System.out.println(emp);
		HttpSession session=request.getSession();
		System.out.println(session.getAttribute("login"));
		if(session.getAttribute("login")!=null){
		session.setAttribute("login", userId);
		session.setAttribute("user", user);
		session.setAttribute("emp", emp);
		String type=db.getType(userId);
		//ResultSet rs=db.statastic();
//		List<Map<String,String>> listOfMaps = db.statastic();
		Gson gson=new Gson();
		RequestDispatcher rd=null;
		if(type.equalsIgnoreCase("admin")){
			request.setAttribute("type", type);
			request.setAttribute("user", user);
			request.setAttribute("emp", emp);
			
			response.encodeURL("type=\"ADMIN\"");
			rd=request.getRequestDispatcher("admin_master.jsp?type=\"ADMIN\"");
			rd.forward(request, response);
		}
		else if(type.equalsIgnoreCase("department")){
			request.setAttribute("type",type);
			request.setAttribute("user", user);
			request.setAttribute("emp", emp);
			
			rd=request.getRequestDispatcher("employee_master.jsp?type=\"EMPLOYEE\"");
			rd.forward(request, response);
			
		}
		else{
			request.setAttribute("type", type);
			rd=request.getRequestDispatcher("UserViewCtrler?type=users&user_id="+userId);
			rd.forward(request, response);
		}
	}
		else{
			response.sendRedirect("index.jsp");
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
