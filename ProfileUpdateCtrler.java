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
 * Servlet implementation class ProfileUpdateCtrler
 */
@WebServlet("/ProfileUpdateCtrler")
public class ProfileUpdateCtrler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileUpdateCtrler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		if(session.getAttribute("login")!=null){
		System.out.println("in profile update ctrler");
		String firstName=request.getParameter("first_name");
		String lastName=request.getParameter("last_name");
		String dob=request.getParameter("dob");
		
		String mobile=request.getParameter("mobile");
		
		String fatherName=request.getParameter("father_name");
		String motherName=request.getParameter("mother_name");
		String addr=request.getParameter("address");
		String id=request.getParameter("id");
		DBQuery db=new DBQuery();
		Gson gson=new Gson();
		System.out.println(mobile+firstName+lastName+dob+fatherName+addr+motherName+id);
		response.getWriter().println(gson.toJsonTree(db.updateUserProfile(firstName, lastName, dob, mobile, fatherName, motherName, addr, id)));
		System.out.println("out of profile update ctrler");
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
