<%-- 
    Document   : signup
    Created on : Nov 25, 2018, 11:16:23 PM
    Author     : Harry Mann
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           String email=request.getParameter("email");
           String psw=request.getParameter("password");
           String id=request.getParameter("id");
           String name=request.getParameter("name");
           Connection conn=null;
           Statement st=null;
           ResultSet rs=null;
           try
             {
                String myUrl="jdbc:mysql://localhost/online student";
		Class.forName("com.mysql.jdbc.Driver");      		
		conn=DriverManager.getConnection(myUrl,"root","");
                st=conn.createStatement();
                st.executeUpdate("insert into user values('"+name+"','"+email+"','"+psw+"','"+id+"')");              
                out.println("<script>window.location.href='login.html';</script>");
            }
            catch(Exception e)
            {                
                out.println(e);   
            }
        %>
    </body>
</html>
