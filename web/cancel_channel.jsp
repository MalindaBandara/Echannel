<%@page import="java.sql.*"%>
<%
            HttpSession existingSession = request.getSession(false);
            if (existingSession == null || existingSession.getAttribute("type") == null){
                //already logged in
                 String site = new String("dlogin.jsp");
                 response.setStatus(response.SC_MOVED_TEMPORARILY);
                 response.setHeader("Location", site); }
%>
<%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/echannel","root","");
                    Statement stmt = con.createStatement();
                    
                    String cancelled=request.getParameter("cancelled");
                    cancelled=((cancelled.equals("true"))?"false":"true");    
                    
                        String query="UPDATE channel SET cancelled='"+cancelled+"' WHERE ch_id='"+request.getParameter("ch_id")+"'";
                        int rs=stmt.executeUpdate(query);
                        
                    }
                 catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }   
            %>