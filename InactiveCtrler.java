package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class InactiveCtrler
 */
@WebServlet("/InactiveCtrler")
public class InactiveCtrler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InactiveCtrler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
		response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
		HttpSession session=request.getSession();
		if(session.getAttribute("login")!=null){
		String id=request.getParameter("id");
		DBQuery db=new DBQuery();
		db.activeInactive(id);
		String type=request.getParameter("type");
		System.out.println(type);;
		RequestDispatcher rd=null;
		if(type.equalsIgnoreCase("admin")){
			request.setAttribute("type", type);
			rd=request.getRequestDispatcher("admin_master.jsp?type=\"ADMIN\"");
			rd.forward(request, response);
		}
		else if(type.equalsIgnoreCase("employee")){
			request.setAttribute("type",type);
			rd=request.getRequestDispatcher("employee_master.jsp?type=\"EMPLOYEE\"");
			rd.forward(request, response);
			
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
