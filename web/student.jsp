<%-- 
    Document   : student
    Created on : Nov 25, 2018, 11:16:01 PM
    Author     : Harry Mann
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
    </head>
    <body>
        <%
            String uname=request.getParameter("email");
           String pwd=request.getParameter("password");
           Connection conn = null;
           Statement st=null;
           ResultSet rs=null;
           try{
	
                String myUrl="jdbc:mysql://localhost/online student";
		Class.forName("com.mysql.jdbc.Driver");      		
		conn=DriverManager.getConnection(myUrl,"root","");
                st=conn.createStatement();
                String query="Select Email,Password from user where Email= '"+uname+"' and Password='"+pwd+"'";
		//step 3:
		st=conn.createStatement();
		//step 4:
		rs =st.executeQuery(query);
		if(rs.next()){
			String redirectURL = "home/home.html";
                        response.sendRedirect(redirectURL);

		}  
                else
                {
                    String redirectURL = "home/home.html";
                        response.sendRedirect(redirectURL);
                }
               // out.println("Invalid username or password");
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
