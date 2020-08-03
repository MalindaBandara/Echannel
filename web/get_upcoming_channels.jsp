<%@page import="java.sql.*"%>
<%
            HttpSession existingSession = request.getSession(false);
            if (existingSession == null || existingSession.getAttribute("type") == null){
                //already logged in
                 String site = new String("dlogin.jsp");
                 response.setStatus(response.SC_MOVED_TEMPORARILY);
                 response.setHeader("Location", site); }
%>

<table class="table-bordered" align="center" width="80%" style="text-align:center;">
            <style>th{text-align:center;width:18%}; .select{padding:10px;}; td{padding:10px}</style>
            <tr>
                <th>Appointment Date</th>
                <th>Patient Name</th>
                <th>Appointment Time</th>
            </tr>

            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/echannel","root","");
                    Statement stmt = con.createStatement();
                    
                        String query="SELECT a.apt_date,CONCAT(p.fn,' ',p.ln) AS pt_name,CONCAT(c.start_time,'-',c.end_time) AS time FROM appointment a,channel c,doctor d,patient p WHERE c.d_id="+session.getAttribute("d_id")+" AND c.ch_id=a.ch_id AND c.d_id=d.d_id AND p.pid=a.pid AND a.apt_date> DATE_FORMAT(SYSDATE(),'%m/%d/%y')";
                        ResultSet rs=stmt.executeQuery(query);  
                            if (!rs.isBeforeFirst() ) {    
                            out.print("<tr><td colspan='3' align='center'>You have no upcoming appointments</td></tr>");
                            }
                            while(rs.next()){
                                out.print("<tr>");
                                out.print("<td align='center'>"+rs.getString("apt_date")+"</td>");
                                out.print("<td align='center'>"+rs.getString("pt_name")+"</td>");
                                out.print("<td align='center'>"+rs.getString("time")+"</td>");
                                out.print("</tr>");
                            }   
                    }
                 catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }   
            %>
        </table>