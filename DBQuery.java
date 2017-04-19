package controller;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DBQuery {
	Map<String,String> checkLogin(String email,String password) throws ClassNotFoundException, SQLException{
        
		Connection conn =Common.getConnection();
		System.out.println("in login query....");
		Map<String,String> status=new HashMap<>();
		 PreparedStatement ps=conn.prepareStatement("select * from users where email_id=?;");
		 ps.setString(1, email);
		 ResultSet rs=ps.executeQuery();
		 if(rs.next()){
			 ps=conn.prepareStatement("select * from users where email_id=? and password=?;");
			 ps.setString(1, email);
			 ps.setString(2, password);
			 rs=ps.executeQuery();
			 if(rs.next()){
				 int id1=rs.getInt("id");
				 String id=id1+"";
				 if(rs.getString("status").equalsIgnoreCase("ACTIVE")){
				 status.put("status", "SUCCESS");
				 status.put("user_id", id);
				 status.put("type", rs.getString("type"));
				 status.put("message", "Success.... Redirecting");
				 }
			 else{
				 status.put("status", "FAIL");
				 status.put("message", "Not an active User");
				 }
				 
			 }
			 else{
				 status.put("status", "FAIL");
				 status.put("message", "Password is wrong");
				 
			 }
		 }
		 else{
			 status.put("status", "FAIL");
			 status.put("message", "Email is wrong");
			 
		 }
		 return status;
		 
	}
	Map<String,String> checkEmail(String email){
		Map<String,String> status=new HashMap<>();
		try{
			Connection conn =Common.getConnection();
		 PreparedStatement ps=conn.prepareStatement("select * from users where email_id=?;");
		 ps.setString(1, email);
		 ResultSet rs=ps.executeQuery();
		 if(rs.next()){
			 status.put("status", "SUCCESS");
		   }
		 else{
			 status.put("status", "FAIL");
		 }
		}
		catch(ClassNotFoundException|SQLException e){
			System.out.println(e.getMessage());
			 status.put("status", "FAIL");
		}
		return status;
		
	}
	int insertToUsersDB(String email,String password,String number){
		
		try {
			Connection conn=Common.getConnection();
			PreparedStatement ps=conn.prepareStatement("insert into users(email_id,password,mobile_no,type) values(?,?,?,'USER')");
			ps.setString(1, email);
			password=Common.generateHash(password);
			ps.setString(2, password);
			ps.setLong(3, Long.parseLong(number));
			ps.executeUpdate();
			ps=conn.prepareStatement("select * from users where email_id=?;");	
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				return rs.getInt("id");
			}
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			return 0;
		}
		
		return 0;
	}
Map<String,String> insertToEmployeesDB(String email,String password,String number,String fname,String sex){
		Map<String,String> status=new HashMap<>();
		try {
			Connection conn=Common.getConnection();
			PreparedStatement ps=conn.prepareStatement("insert into users(email_id,password,mobile_no,type) values(?,?,?,'DEPARTMENT')");
			ps.setString(1, email);
			password=Common.generateHash(password);
			ps.setString(2, password);
			ps.setLong(3, Long.parseLong(number));
			ps.executeUpdate();
			
			ps=conn.prepareStatement("select * from users where email_id=?;");	
			ps.setString(1, email);
			int id=0;
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				id=rs.getInt(1);
			}
			System.out.println("inserted to users"+id);
			ps=conn.prepareStatement("insert into profiles(user_id,email_id,first_name,gender,address,last_name,father_name,mother_name) values(?,?,?,?,'  ','  ','  ','  ');");
			ps.setInt(1, id);
			ps.setString(2, email);
			ps.setString(3, fname);
			ps.setString(4, sex);
			ps.executeUpdate();
			System.out.println("into profiles");
			ps=conn.prepareStatement("select * from users where email_id=?;");	
			ps.setString(1, email);
			rs=ps.executeQuery();
			if(rs.next()){
				status.put("status", "SUCCESS");
			}
			 else{
				 status.put("status", "FAIL");
			 }
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
			status.put("status", "FAIL");
		}
		
		return status;
	}
	int getID(String email){
		try(Connection conn=Common.getConnection();){
		
		PreparedStatement ps=conn.prepareStatement("select id from users where email_id=?");
		ps.setString(1, email);
		
		ResultSet rs=ps.executeQuery();
		if(rs.next()){
			return rs.getInt("id");
		}
		else
			return -1;
				
	}catch(ClassNotFoundException| SQLException e){
	 System.out.println(e.getMessage());	
	 return -1;
	  }
	}
	Map<String,String> insertProfile(int id,String email,String fname,String lname,String addr,String dob,String sex,String father,String mother){
		Map<String,String> status=new HashMap<>();
		System.out.println("\n\n\n"+sex);
		  System.out.println(dob);
		  System.out.println(addr);
		  System.out.println(lname);
		  System.out.println(fname);
		  System.out.println(mother);
		  System.out.println(father);
		  System.out.println(email);
		  System.out.println(id);
		try{
			Connection conn=Common.getConnection();
			PreparedStatement ps=conn.prepareStatement("insert into profiles(user_id,email_id,first_name,last_name,address,dob,gender,father_name,mother_name) values(?,?,?,?,?,?,?,?,?);");
			ps.setInt(1, id);
			ps.setString(2, email);
			ps.setString(3, fname);
			ps.setString(4, lname);
			ps.setString(5, addr);
			ps.setString(6, dob);
			ps.setString(7, sex);
			ps.setString(8, father);
			ps.setString(9, mother);
			int i=ps.executeUpdate();
		    System.out.println(i);	
			if(i==1){
				status.put("status", "SUCCESS");
			}
			else
				status.put("status", "FAIL To insert into profile");
		}	catch(Exception e){
			status.put("status", "FAIL due to exception");
			System.out.println(e.getMessage());
		}	
		return status;
	}
	
 Map<String,String> forgotCheck(String email,String mobile){
	 Map<String,String> status=new HashMap<>();   
	 try{
		Connection conn =Common.getConnection();
		System.out.println("in Forgot query....");
		System.out.println(email);
		System.out.println(Long.parseLong(mobile));
		 PreparedStatement ps=conn.prepareStatement("select * from users where email_id=? and mobile_no=?;");
		 
		 ps.setString(1, email);
		 ps.setLong(2, Long.parseLong(mobile));
		 ResultSet rs=ps.executeQuery();
		 if(rs.next()){
		  status.put("status", "SUCCESS");
		 }
		 else
			 status.put("status", "FAIL");
		 }catch( ClassNotFoundException|SQLException e){
			 status.put("status", "FAIL");
		 }		 
		 return status;
 
 	}
 Map<String,String> updatePassword(String email,String password){
	 Map<String,String> status=new HashMap<>();   
	 try{
		Connection conn =Common.getConnection();
		password=Common.generateHash(password);
		
		 PreparedStatement ps=conn.prepareStatement("update users set password=? where email_id=?;");
		 ps.setString(2, email);
		 ps.setString(1, password);
		 ps.executeUpdate();
		 status.put("status", "SUCCESS");
		 	 }catch( ClassNotFoundException|SQLException e){
			 status.put("status", "FAIL");
		 }		 
		 return status;
 
 	}
 String getType(String userId){
	 try{
			Connection conn =Common.getConnection();			
			 PreparedStatement ps=conn.prepareStatement("select type from users where id=?;");
			 ps.setInt(1, Integer.parseInt(userId));
			 
			 ResultSet rs=ps.executeQuery();
			 if(rs.next()){
				 return rs.getString("type");			 }
			  }catch( ClassNotFoundException|SQLException e){
				 return "none";
			 }		 
			 return "none";
	  
	 
 }
 ResultSet getDetails(){
	 Connection conn=null;
	 ResultSet rs=null;
	 try{
		 conn=Common.getConnection();
		 PreparedStatement ps=conn.prepareStatement("select * from profiles p,users u where p.user_id=u.id and u.type like 'USER';");
		 rs=ps.executeQuery();
		 return rs;
	 }catch(Exception e){
		 System.out.println(e.getMessage());
		 return rs;
	 }
	 
 }
 
 ResultSet getEMPDetails(){
	 Connection conn=null;
	 ResultSet rs=null;
	 try{
		 conn=Common.getConnection();
		 PreparedStatement ps=conn.prepareStatement("select * from profiles p,users u where p.user_id=u.id and u.type like 'DEPARTMENT';");
		 rs=ps.executeQuery();
		 return rs;
	 }catch(Exception e){
		 System.out.println(e.getMessage());
		 return rs;
	 }
	 
 }
 
 ResultSet getUserDetails(String id){
	 try{
		 System.out.println("in try block");
		Connection conn=Common.getConnection();
		PreparedStatement ps=conn.prepareStatement("select * from profiles p left join salary_slips s on p.user_id=s.user_id where p.user_id=?;");
		 ps.setInt(1, Integer.parseInt(id));
		 ResultSet rs=ps.executeQuery();
		return rs;
	 }catch(Exception e){
		 System.out.println("in catch block");
		 e.printStackTrace();
		 return null; 
	 }	 
 }
 
 String getMobile(String id){
	 
	 try{
		 Connection conn=Common.getConnection();
			PreparedStatement ps=conn.prepareStatement("select mobile_no from users where id=?;");
			 ps.setLong(1,Long.parseLong(id));
			 ResultSet rs=ps.executeQuery();
			 if(rs.next()){
				 String mob=rs.getString("mobile_no");
				 System.out.println(mob);
			 return mob;
			 }
	 }catch(Exception e){
		return null; 
	 }
	return null;
	 
 }
 String getUserStatus(String id){
	 
	 try{
		 Connection conn=Common.getConnection();
			PreparedStatement ps=conn.prepareStatement("select status from users where id=?;");
			 ps.setLong(1,Long.parseLong(id));
			 ResultSet rs=ps.executeQuery();
			 if(rs.next()){
				 String status=rs.getString("status");
				 System.out.println(status);
			 return status;
			 }
	 }catch(Exception e){
		return null; 
	 }
	return null;
	 
 }
 boolean checkSalaryId(String id){
	 System.out.println("in checkSalaryID");
	 try{
		 Connection conn=Common.getConnection();
			PreparedStatement ps=conn.prepareStatement("select * from salary_slips where user_id=?;");
			 ps.setLong(1,Integer.parseInt(id));
			 ResultSet rs=ps.executeQuery();
			 if(rs.next()){
				 System.out.println("it is true");
				 return true;
				 }
		}catch(Exception e){
			System.out.println("it is false");
			return false;
		}
	 System.out.println("it is false");
	 return false;
 }
 
Map<String,String> updateToSalary(String hra,String da,String it,String gpf,String misc,String cghs,String bonus,String netSalary,String basicPay,String id){
	System.out.println("in update salary slip");
	Map<String,String> status=new HashMap<>();
	try{
		 Connection conn=Common.getConnection();
			PreparedStatement ps=conn.prepareStatement("update salary_slips set basic_pay=?,bonus=?,CGHS=?,da=?,gpf=?,hra=?,IT=?,misc_allowance=?,net_salary=? where user_id=?;");
			
			 ps.setLong(1,Long.parseLong(basicPay));
			 ps.setLong(2, Long.parseLong(bonus));
			 ps.setLong(3, Long.parseLong(cghs));
			 ps.setLong(4,Long.parseLong(da));
			 ps.setLong(5, Long.parseLong(gpf));
			ps.setLong(6, Long.parseLong(hra));
			ps.setLong(7, Long.parseLong(it));
			ps.setLong(8, Long.parseLong(misc));
			ps.setLong(9, Long.parseLong(netSalary));
			ps.setInt(10, Integer.parseInt(id));
			int i=ps.executeUpdate();
			if(i==1){
				System.out.println("updated");
				status.put("status","SUCCESS");
				status.put("message", "Value is added");
			}
			else{
				System.out.println("it is not updated");
				status.put("status","FAIL");
				status.put("message", "Value is not added");
				
			}
		}catch(Exception e){
			System.out.println("it is not updated");
			status.put("status","FAIL");
			status.put("message", "Value is not added");
		}
	return status;
}
Map<String,String> insertToSalary(String hra,String da,String it,String gpf,String misc,String cghs,String bonus,String netSalary,String basicPay,String id){
	Map<String,String> status=new HashMap<>();
	try{
		 Connection conn=Common.getConnection();
			PreparedStatement ps=conn.prepareStatement("insert into salary_slips (basic_pay,bonus,CGHS,da,gpf,hra,IT,misc_allowance,net_salary,user_id) values(?,?,?,?,?,?,?,?,?,?);");
			
			 ps.setLong(1,Long.parseLong(basicPay));
			 ps.setLong(2, Long.parseLong(bonus));
			 ps.setLong(3, Long.parseLong(cghs));
			 ps.setLong(4,Long.parseLong(da));
			 ps.setLong(5, Long.parseLong(gpf));
			ps.setLong(6, Long.parseLong(hra));
			ps.setLong(7, Long.parseLong(it));
			ps.setLong(8, Long.parseLong(misc));
			ps.setLong(9, Long.parseLong(netSalary));
			ps.setInt(10, Integer.parseInt(id));
			int i=ps.executeUpdate();
			if(i==1){
				System.out.println("it is Inserted");
				status.put("status","SUCCESS");
				status.put("message", "Value is added");
			}else{
				System.out.println("it is not Inserted");
			status.put("status","FAIL");
			status.put("message", "Value is not added");}
		}catch(Exception e){
			System.out.println("it is not Inserted");
			status.put("status","FAIL");
			status.put("message", "Value is not added");
		}
	return status;
}
boolean activeInactive(String id){
	try(Connection conn=Common.getConnection();){
		System.out.println("in active Inactive");
		PreparedStatement ps=conn.prepareStatement("select status from users where id=?");
		PreparedStatement ps1=conn.prepareStatement("update users set status=? where id=?");
		ps.setInt(1, Integer.parseInt(id));
		ResultSet rs=ps.executeQuery();
		String status=null;;
		if(rs.next()){
			status=rs.getString("status");
			System.out.println(status);
		}
		if(status.equalsIgnoreCase("active")){
			ps1.setString(1,"INACTIVE");
			ps1.setInt(2,Integer.parseInt(id));
			ps1.executeUpdate();
			return true;
		}
		else{
			ps1.setString(1, "ACTIVE");
			ps1.setInt(2,Integer.parseInt(id));
			ps1.executeUpdate();
			return true;
		}
		
		
	}catch(Exception e){
		System.out.println(e.getMessage());
		System.out.println("error");
		return false;
	}
}

Map<String,String> updateToEmployeeMaster(long basic_pay,long hra,long da,long gpf,long it,long misc_allowance,long cghs,long bonus,long user_id){
	Map<String,String> status=new HashMap<>();
	try(Connection conn=Common.getConnection();){
		
		PreparedStatement ps=conn.prepareStatement("insert into employee_master(basic_pay,hra,da,gpf,it,misc_allowance,cghs,bonus,year,month,user_id) values(?,?,?,?,?,?,?,?,?,?,?);");
		ps.setLong(1, basic_pay);
		ps.setLong(2, hra);
		ps.setLong(3, da);
		ps.setLong(4, gpf);
		ps.setLong(5, it);
		ps.setLong(6, misc_allowance);
		ps.setLong(7, cghs);
		ps.setLong(8, bonus);
		Calendar now = Calendar.getInstance();
		System.out.println(now.get(Calendar.YEAR));
		System.out.println(now.get(Calendar.MONTH)+1);
		ps.setLong(9, now.get(Calendar.YEAR));
		ps.setLong(10, now.get(Calendar.MONTH)+1);
		ps.setLong(11, user_id);
		
		if(ps.executeUpdate()!=1){
			throw new Exception("couldnt insert");
		}
		else{
			status.put("status", "SUCCESS");
			status.put("message", "Success");
		}
	}catch(Exception e){
		e.getMessage();
		status.put("status", "FAIL");
		status.put("message", "Already salary crefited for this month");
	}
	return status;
}

ResultSet getPaySlip(String id){
	ResultSet rs=null;
	try(Connection conn=Common.getConnection();){
		PreparedStatement ps=conn.prepareStatement("select * from employee_master where user_id=?");
		ps.setInt(1, Integer.parseInt(id));
		rs=ps.executeQuery();
	}catch(Exception e){
		e.getMessage();
	}
	return rs;
}
int countUsers(){
	try(Connection conn=Common.getConnection();){
		PreparedStatement ps=conn.prepareStatement("select count(*) as asd from users where type like 'USER'");
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		return rs.getInt(1);
	}catch(Exception e){
		
	}
	return 0;
}

int countDept(){
	try(Connection conn=Common.getConnection();){
		PreparedStatement ps=conn.prepareStatement("select count(*) as asd   from users where type like 'DEPARTMENT'");
		ResultSet rs=ps.executeQuery();
		if (rs.next())
			return rs.getInt(1);
	}catch(Exception e){
		
	}
	return 0;
}
Map<String,String> updateUserProfile(String firstName,String lastName,String dob,String mob,String fatherName,String motherName,String addr,String id){
	Map<String,String> status=new HashMap<>();
	try(Connection conn=Common.getConnection();){
		System.out.println("in update profile query");		
		PreparedStatement ps=conn.prepareStatement("update users set mobile_no=? where id=?");
		System.out.println("mobile"+mob+"                    "+Long.parseLong(mob));
		ps.setLong(1, Long.parseLong(mob));
		System.out.println("id");
		ps.setInt(2, Integer.parseInt(id));
		if(ps.executeUpdate()!=1){
		 throw new Exception("couldnt update in user table");	
		}
		ps=conn.prepareStatement("update profiles set first_name=?,last_name=?,address=?,dob=?,father_name=?,mother_name=? where user_id=?");
		ps.setString(1, firstName);
		ps.setString(2, lastName);
		ps.setString(3, addr);
		ps.setString(4,dob);
		ps.setString(5, fatherName);
		ps.setString(6, motherName);
		System.out.println("in profile id");
		ps.setInt(7, Integer.parseInt(id));
		if(ps.executeUpdate()!=1){
			throw new Exception("couldn't update in profile table");
		}		
		status.put("status", "SUCCESS");
		status.put("message", "Updated Profile");
		
		
	}
	catch(Exception e){
		status.put("status", "FAIL");
		status.put("message", e.getMessage());
		e.printStackTrace();
	}
	return status;
}
List<Map<String,String>> statastic(){
	ResultSet rs=null;
	List<Map<String,String>> listOfMaps = new ArrayList<Map<String,String>>();
	System.out.println("statastic");
	try(Connection conn=Common.getConnection();){
		PreparedStatement ps=conn.prepareStatement("select sum(it),year from employee_master group by year");
		rs=ps.executeQuery();
		while(rs.next()){
			
			Map<String,String> obj=new HashMap<>();
			obj.put("net_it", rs.getString(1));
			obj.put("year", rs.getString(2));
			System.out.println(rs.getInt(1)+"       "+ rs.getInt(2));
			listOfMaps.add(obj);
			
		}
	}catch(Exception e){
		
	}
	return listOfMaps;
}
Map<String,String> getBarChartData(String year){
	ResultSet rs=null;
	Map<String,String> data=new HashMap<>();
	try(Connection conn=Common.getConnection();){
		PreparedStatement ps=conn.prepareStatement("select month,sum(it),sum(basic_pay+hra+da+gpf+misc_allowance+cghs+bonus) from employee_master WHERE year=? group by month");
		ps.setString(1, year);
		rs=ps.executeQuery();
		while(rs.next()){
			data.put("it"+rs.getString(1),rs.getString(2));
			data.put("netsalary"+rs.getString(1),rs.getString(3));
		}
		data.put("status", "SUCCESS");
	}catch(Exception e){
		data.put("status", "FAIL");
		data.put("message", e.getMessage());
	}
	return data;
}
ArrayList<String> getBarChartYear(){
	ResultSet rs=null;
	ArrayList<String> data=new ArrayList<String>();
	try(Connection conn=Common.getConnection();){
		PreparedStatement ps=conn.prepareStatement("SELECT year FROM `employee_master` GROUP by year desc");
		rs=ps.executeQuery();
		int i=0;
		while(rs.next()){
			data.add(rs.getString(1));	
			i++;
		}
	
	}catch(Exception e){

	}
	return data;
}

}
