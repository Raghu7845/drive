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
 * Servlet implementation class ForgotCtrler
 */
@WebServlet("/ForgotCtrler")
public class ForgotCtrler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotCtrler() {
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
		
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String password=request.getParameter("password");
		DBQuery db=new DBQuery();
		Gson gson=new Gson();
		if(password==null){
			
			response.getWriter().print(gson.toJson(db.forgotCheck(email, mobile)));
		}
		else{
			System.out.println("in password");
			response.getWriter().print(gson.toJson(db.updatePassword(email, password)));
		}
		
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPut(req, resp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
