
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import=" jakarta.servlet.*" %>
<%@page import="  jakarta.servlet.http.*" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login check</title>
    </head>
    <body>
        <%
            //conn c1=new conn();
           Class.forName("com.mysql.jdbc.Driver");
            String u = request.getParameter("mobile1");
            String p = request.getParameter("password1");
            
            String bhang = request.getParameter("bhang"); // worker or contractor
            String fin="";
            if ("work".equals(bhang)) {
            	 fin="Y";
            }
            else{
            	 fin="N";
            }
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/wtl5","root", "Shreyu@123");
           String q="Select *from Login where mobile='"+u+"'and pass='"+p+"'and rad3='"+fin+"'";
               PreparedStatement pst = c.prepareStatement(q);
               ResultSet rs=pst.executeQuery();
              boolean status = rs.next();
               if(status){
            
            	   
                   if ("work".equals(bhang)) {
                	   response.sendRedirect("../CONTRACTOR/ListOfCont.jsp");
                     }
                   else{
                	   response.sendRedirect("../CONTRACTOR/cont.html");
                          
                   }
            }else{
            	request.setAttribute("errorMessage", "Invalid user or password");
            	request.getRequestDispatcher("login.html").forward(request, response);
               // javax.swing.JOptionPane.showMessageDialog(null, "Invaild Login");
                //response.sendRedirect("login.html");
            }
            
            
            %>
    </body>
</html>
