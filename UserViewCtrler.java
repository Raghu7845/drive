package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserViewCtrler
 */
@WebServlet("/UserViewCtrler")
public class UserViewCtrler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserViewCtrler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		if(session.getAttribute("login")!=null){
		System.out.println("in UserViewCtrler");
		String id=request.getParameter("user_id");
		System.out.println(id);
		DBQuery db=new DBQuery();
		
			try {
				response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
				response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
				response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
				response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
				ResultSet rs=db.getUserDetails(id);
				if(rs.next()){
					UserViewModel usm=new UserViewModel();
				usm.setMobile(db.getMobile(id));
				System.out.println(db.getMobile(id));
				System.out.println(request.getParameter("type"));
				String type=request.getParameter("type");
				request.setAttribute("mobile", db.getMobile(id));				
				usm.setAddress(rs.getString("address"));
				usm.setDob(rs.getString("dob"));
				usm.setHra(rs.getInt("hra"));
				usm.setIT(rs.getInt("IT"));
				usm.setBasicPay(rs.getInt("basic_pay"));
				usm.setBonus(rs.getInt("bonus"));
				usm.setCghs(rs.getInt("CGHS"));
				usm.setDa(rs.getInt("da"));
				usm.setEmail(rs.getString("email_id"));
				usm.setFatherName(rs.getString("father_name"));
				usm.setFirstName(rs.getString("first_name"));
				usm.setGender(rs.getString("gender"));
				request.setAttribute("gender", rs.getString("gender"));
				usm.setGpf(rs.getInt("gpf"));
				usm.setLastName(rs.getString("last_name"));
				usm.setMiscAllowance(rs.getInt("misc_allowance"));
				usm.setMotherName(rs.getString("mother_name"));
				usm.setNetSalary(rs.getInt("net_salary"));
				usm.setUserId(rs.getInt("user_id"));
				request.setAttribute("usm", usm);
				if(type.equals("admin")){
					System.out.println("in admin");
				RequestDispatcher rd=request.getRequestDispatcher("user_view.jsp");
				rd.forward(request, response);
				}
				else if(type.equals("employee")){
					System.out.println("in employee");
					RequestDispatcher rd=request.getRequestDispatcher("Employee_users_view.jsp");
					rd.forward(request, response);
				}
				else{
					RequestDispatcher rd=request.getRequestDispatcher("Users_master.jsp");
					rd.forward(request, response);
				}
				}
				else{
					System.out.println("it is null");
				}
			} catch (SQLException|NullPointerException e) {
				// TODO Auto-generated catch block
				e.getMessage();	
			
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
