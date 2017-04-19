 package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

/**
 * Servlet implementation class SalaryUpdateCtrler
 */
@WebServlet("/SalaryUpdateCtrler")
public class SalaryUpdateCtrler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalaryUpdateCtrler() {
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
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		if(session.getAttribute("login")!=null){
		System.out.println("in salary update ctrler");
		PrintWriter out=response.getWriter();
		String basicPay=request.getParameter("basic_pay");
		
		String misc=request.getParameter("misc");

		String id=request.getParameter("id");
		String hra,da,it,gpf,cghs,bonus,netSalary;
			int tot=Integer.parseInt(basicPay)+Integer.parseInt(misc);
			System.out.println(tot);
    	 it=String.valueOf((long)(tot*0.2));
    	 cghs=String.valueOf((long)(tot*0.02));
    	 hra=String.valueOf((long)(tot*0.05));
    	 da=String.valueOf((long)(tot*0.05));
    	 bonus=String.valueOf((long)(tot*0.05));
    	 gpf=String.valueOf((long)(tot*0.1));
		 netSalary=String.valueOf(tot+Long.parseLong(bonus)+Long.parseLong(da)+Long.parseLong(hra)-Long.parseLong(it)-Long.parseLong(cghs)-Long.parseLong(gpf));
		DBQuery db=new DBQuery();
		System.out.println(hra+" "+da+" "+it+" "+ gpf+" "+ misc+" "+ cghs+" "+ bonus+" "+ netSalary+" "+ basicPay+" "+ id);
		 Gson gson=new Gson();
		if(db.checkSalaryId(id)){
			
			String registerResponse=gson.toJson(db.updateToSalary(hra, da, it, gpf, misc, cghs, bonus, netSalary, basicPay, id));
			out.println(registerResponse);
		}
		else{
			String registerResponse=gson.toJson(db.insertToSalary(hra, da, it, gpf, misc, cghs, bonus, netSalary, basicPay, id));
			out.println(registerResponse);
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
