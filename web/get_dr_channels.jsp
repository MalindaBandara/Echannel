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
                <th>Day</th>
                <th>Time</th>
                <th>Status</th>
                <th>Enable/Disable</th>
            </tr>

            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/echannel","root","");
                    Statement stmt = con.createStatement();
                    
                        String query="SELECT * FROM channel WHERE d_id='"+session.getAttribute("d_id")+"'";
                        ResultSet rs=stmt.executeQuery(query);            
                            while(rs.next()){
                                out.print("<tr>");
                                out.print("<td align='center'>"+rs.getString("day")+"</td>");
                                out.print("<td >"+rs.getString("start_time")+"-"+rs.getString("end_time")+"</td>");
                                out.print("<td style='color:"+((rs.getString("cancelled").equals("true"))?"red'>Cancelled":"green'>Available")+"</td>");
                                out.print("<td align='center'><input type='button' onclick='cancelChannel(\""+rs.getString("ch_id")+"\",\""+rs.getString("cancelled")+"\");' value='change'></td>");
                                out.print("</tr>");
                            }   
                    }
                 catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }   
            %>
        </table>