<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
HttpSession existingSession = request.getSession(false);
if (existingSession == null || existingSession.getAttribute("un") == null){
        //already logged in
         String site = new String("login.jsp");
         response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", site); }
%>
<!DOCTYPE html>
<html>
    <head>
  <title>Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <meta charset="utf-8">
  <link href="<c:url value='/template/bootstrap.min.css'/>" rel="stylesheet" type="text/css" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="template/bootstrap.min.css">
  <script src="template/jquery-3.2.1.js"></script>
  <script src="template/bootstrap.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
    <a class="navbar-brand"><img src="red.jpg" class="img-rounded" height="60"></a>
      <a class="navbar-brand">E-CHANNEL ASSISTANT</a>
    </div>
    <ul class="nav navbar-nav">
      <!--<li class="active"><a href="Home.php">Home</a></li>
      <li><a href="#">Channel Details</a></li>-->
   
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      
      <!--<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>-->
    </ul>
  </div>
</nav>
    <script>
        function validate(form) {
            return isRadioChecked(form);
            
         }
         
         function isRadioChecked(form){
             var btns = form.channel;
            for (var i=0; el=btns[i]; i++) {
              if (el.checked) return true;
            }
            form.channel[0].focus();
            document.getElementById("option").innerHTML="<font color='red'>Please select a time slot from the Table</font>";
            return false;
         }
    </script>
    
    
<div class="container">
<div class="panel panel-default">
 <div class="panel-heading"><h2>Appointment Status</h2></div>
    <div class="panel-body">
            <%
                String apt_date=request.getParameter("apt_date");
                String pid=(String)session.getAttribute("pid");
                String ch_id=request.getParameter("channel");
                //get current date
                Calendar cal=new GregorianCalendar();
                SimpleDateFormat format1 = new SimpleDateFormat("MM/dd/yyyy");
                String cur_date = format1.format(cal.getTime());
                
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/echannel","root","");
                    Statement stmt = con.createStatement();
                    String query="INSERT INTO appointment VALUES(NULL,'"+apt_date+"','"+cur_date+"',NULL,'"+pid+"','"+ch_id+"')";
                    int rs=stmt.executeUpdate(query);
                    out.print("<div id='status'><h5>Appointment was Successfully Added!</h5></div>");
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                } catch(SQLException q){
                    out.print("<div id='status'><h5>Sorry, but you have already placed an appointment for this time slot</h5></div>");
                }
                out.print(" <a href='home.jsp'>Go Back</a>");
            %>
    </div>
<div>
</div>
</body>
</html>
