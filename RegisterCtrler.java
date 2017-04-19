package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
/**
 * Servlet implementation class RegisterCtrler
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/RegisterCtrler" })
public class RegisterCtrler extends HttpServlet {
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
	  DBQuery db=new DBQuery();
	  String email=request.getParameter("email");
	  String password=request.getParameter("password");
	  String number=request.getParameter("number");
	  String father=request.getParameter("father");
	  String mother=request.getParameter("mother");
	  String fname=request.getParameter("fname");
	  String lname=request.getParameter("lname");
	  String sex=request.getParameter("sex");	  
	  String addr=request.getParameter("addr");
	  String dob=request.getParameter("dob");
	  System.out.println(sex);
	  System.out.println(dob);
	  System.out.println(addr);
	  System.out.println(lname);
	  System.out.println(fname);
	  System.out.println(mother);
	  System.out.println(father);
	  System.out.println(number);
	  System.out.println(password);
	  System.out.println(email);
	  if(password==null||number==null){
		  Gson gson=new Gson();
		  response.getWriter().println(gson.toJson(db.checkEmail(email)));
		  
	  }
	  else{
	  Gson gson=new Gson();
	int id=db.insertToUsersDB(email,password,number);
	System.out.println(id);
	
	if(id!=0){
	
		String registerResponse=gson.toJson(db.insertProfile(id,email,fname,lname,addr,dob,sex,father,mother));
		response.getWriter().print(registerResponse);
		}
		else{
			Map<String, String> status=new HashMap<>();
			status.put("status", "FAIL already exists");
			 String registerResponse=gson.toJson(status);
			 response.getWriter().print(registerResponse);
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
