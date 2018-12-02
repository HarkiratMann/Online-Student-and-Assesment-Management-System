
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class RecordCheck extends HttpServlet {  
public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html");  
PrintWriter out = response.getWriter();  
          
String n=request.getParameter("fname");  
String p=request.getParameter("email");  
String e=request.getParameter("unmame");  
String c=request.getParameter("password");  
String d=request.getParameter("id"); 
          
try{  
String myurl="jdbc:mysql://localhost:3306/project";
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection(myurl,"root","");  
  
PreparedStatement ps=conn.prepareStatement(  
"insert into user values(?,?,?,?,?)");  
  
ps.setString(1,n);  
ps.setString(2,p);  
ps.setString(3,e);  
ps.setString(4,c);
ps.setString(5,d);
          
int i=ps.executeUpdate();  
if(i>0)  
out.print("You are successfully registered...");  
else
    out.print("Some Error occured...");  

          
}catch (Exception e2) {
    out.print("Error aaya hai..."+e2);  
System.out.println(e2);}  
          
out.close();  
}  
  
}