<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

            <%
                String cid=request.getParameter("channel");
                String apt_date=request.getParameter("apt_date");
                
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/echannel","root","");
                    Statement stmt = con.createStatement();
                    String query="SELECT COUNT(apt_date) AS date FROM appointment WHERE  ch_id='"+cid+"' AND apt_date='"+apt_date+"'";
                    ResultSet rs=stmt.executeQuery(query);
                    rs.next();
                    String date=rs.getString("date");
                    out.print("<font style='color:"+((Integer.parseInt(date)>9)?"red":"green")+";'>"+date+"/10</font>");

                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }   
            %>
      
