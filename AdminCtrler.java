package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Servlet implementation class AdminCtrler
 */
@WebServlet("/AdminCtrler")
public class AdminCtrler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCtrler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 response.setContentType("application/json");
		 response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		 response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
		 response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		 response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
		 //Gson gson = new GsonBuilder().setPrettyPrinting().create();
		 HttpSession session=request.getSession();
		 if(session.getAttribute("login")!=null){
		    DBQuery db=new DBQuery();
		    ResultSet rs=db.getDetails();
		    List<Profile> ls=new ArrayList<>();
		    try {
		    	
				while(rs.next()){
				//String json="{ \"demo\":[[\""+rs.getString("email_id")+"\",\""+rs.getString("first_name")+"\",\""+rs.getString("last_name")+"\",\""+rs.getString("address")+"\"]}";
					Profile obj=new Profile();
					obj.setId(rs.getInt("user_id"));
					obj.setEmail(rs.getString("email_id"));
					obj.setFirstname(rs.getString("first_name"));
					obj.setMobile(rs.getLong("mobile_no"));
					obj.setStatus(rs.getString("status"));
				ls.add(obj);		
				}
				JsonObject jsonObject = new JsonObject();
				jsonObject.setiTotalDisplayRecords(ls.size());
			    jsonObject.setiTotalRecords(ls.size());
			    jsonObject.setAaData(ls);
			    Gson gson1 = new GsonBuilder().setPrettyPrinting().create();
			    String json2 = gson1.toJson(jsonObject);
				response.getWriter().print(json2);
		    	
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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
