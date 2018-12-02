<%-- 
    Document   : admin
    Created on : Nov 25, 2018, 11:15:36 PM
    Author     : Harry Mann
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
    </head>
    <body>
        <%
            String uname=request.getParameter("email");
           String pwd=request.getParameter("password");
           try{
	
               String myUrl="jdbc:mysql://localhost/online student";
		//step 1:
		Class.forName("com.mysql.jdbc.Driver");
      		//step 2:
		Connection conn=DriverManager.getConnection(myUrl,"root","");
                String query="Select Email,Password from user where email= '"+uname+"' and password='"+pwd+"'";
		//step 3:
		Statement st=conn.createStatement();
		//step 4:
		ResultSet rs =st.executeQuery(query);
		if(rs.next()){
			String redirectURL = "home.html";
                        response.sendRedirect(redirectURL);
		}  
                else
                out.println("Invalid username or password");
		//step 5
		st.close();
		}
		catch(Exception e){
			System.out.println("Got an exception! ");
			System.out.println(e.getMessage());
		}
           
        %>

    </body>
</html>
