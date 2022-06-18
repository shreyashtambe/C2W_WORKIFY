<%@page import="java.sql.*"%>
<%@page import="java.sql.CallableStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm</title>
    </head>
    <body>

            <%
            try{
            Class.forName("com.mysql.jdbc.Driver");
            String mob = request.getParameter("mob2");
            String pass = request.getParameter("pass2"); // 1st password name on signup
            String verifypass = request.getParameter("pass3");  // 2nd password name on signup
           
            if(pass.equals(verifypass)){
                        	
            String name = request.getParameter("name2");
            String city = request.getParameter("city2");
            String lang = request.getParameter("lang");
                       
            if ("Official".equals(lang)) {
                // Official selected
           
            	String rad3="Y";
            	String rad4="N";
            	
            	Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/wtl5","root", "Shreyu@123");

            	String q ="INSERT INTO login VALUES('"+mob+"','"+pass+"','"+name+"','"+city+"','"+rad3+"','"+rad4+"');";
              
                PreparedStatement pst = c.prepareStatement(q);
                pst.executeUpdate();
              	
                     
                javax.swing.JOptionPane.showMessageDialog(null, "Record Inserted");
                        response.sendRedirect("../CONTRACTOR/DBINFO.jsp");
            }
             else if ("all".equals(lang)) {
            	 
            	 String rad3="N";
            	 String rad4="Y";
            	 
                 Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/wtl5","root", "Shreyu@123");
				
                 String q ="INSERT INTO login VALUES('"+mob+"','"+pass+"','"+name+"','"+city+"','"+rad3+"','"+rad4+"');";
                   
                    PreparedStatement pst = c.prepareStatement(q);
                    pst.executeUpdate();
                   
                          
                     javax.swing.JOptionPane.showMessageDialog(null, "Record Inserted");
                             response.sendRedirect("../CONTRACTOR/cont.html");
                
            }
            }
            
            
            
            else{
            	out.println("MISS-MATCH password :( ");
            }
            
            }catch(Exception ae){
                out.println("The error is"+ae);
            }
      		  
       

        %>
        
    
        
    </body>
</html>
