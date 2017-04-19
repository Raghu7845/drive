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
 * Servlet implementation class AddSalary
 */
@WebServlet("/AddSalary")
public class AddSalary extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSalary() {
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
		System.out.println("add salary");
		//UserViewModel usm=(UserViewModel)request.getAttribute("usm");
		DBQuery db=new DBQuery();
		Gson gson=new Gson();
		long basic_pay, hra, da, gpf, it, misc_allowance, cghs, bonus, user_id;
		basic_pay=Long.parseLong(request.getParameter("basic_pay"));
		System.out.println(basic_pay);
		hra=Long.parseLong(request.getParameter("hra"));
		System.out.println(hra);
		da=Long.parseLong(request.getParameter("da"));
		System.out.println(da);
		gpf=Long.parseLong(request.getParameter("gpf"));
		System.out.println(gpf);
		it=Long.parseLong(request.getParameter("it"));
		System.out.println(it);
		misc_allowance=Long.parseLong(request.getParameter("misc"));
		System.out.println(misc_allowance);
		cghs=Long.parseLong(request.getParameter("cghs"));
		System.out.println(cghs);
		bonus=Long.parseLong(request.getParameter("bonus"));
		System.out.println(bonus);
		System.out.println("upto bonus");
		System.out.println("user_id problem");
		user_id=Long.parseLong(request.getParameter("user_id"));
		System.out.println(user_id);
		response.getWriter().print(gson.toJson(db.updateToEmployeeMaster(basic_pay, hra, da, gpf, it, misc_allowance, cghs, bonus, user_id)));
		}
		else{
			
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
