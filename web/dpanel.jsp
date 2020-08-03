<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
HttpSession existingSession = request.getSession(false);
if (existingSession == null || (!existingSession.getAttribute("type").equals("doctor"))){
        //already logged in
         String site = new String("dlogin.jsp");
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

<div class="container">
<div class="panel panel-default">
 <div class="panel-heading"><h2>Doctor's Portal</h2></div>
    <div class="panel-body">
        <div id="heading"><h4>Edit Channels</h4></div>
        <form action="add_appointment.jsp" method="post">
            <style>.opt{padding:10px;width: 32%};</style>
            <table align="center" width="100%">
                <tr>
                    <td align="center" class="opt"><input type="radio" name="option" value="channel" onclick="loadChannel();" checked="true">Edit Channel</td>
                    <td align="center" class="opt"><input type="radio" name="option" value="all_apt" onclick="loadUpcoming();">View All Upcoming Appointments</td>
                    <td align="center" class="opt"><input type="radio" name="option" value="tod_apt" onclick="loadToday();">Todays Appointments</td>
                    
                </tr>
            </table><br/>
            <div id="opt_body"></div>
        </form>
    </div>
<div>
</div>
</body>
<script>
    document.onload(loadChannel());
function loadChannel() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("opt_body").innerHTML =this.responseText;
    }
  };
  xhttp.open("POST", "get_dr_channels.jsp", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send();
}

function loadUpcoming() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("opt_body").innerHTML =this.responseText;
    }
  };
  xhttp.open("POST", "get_upcoming_channels.jsp", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send();
}

function loadToday() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("opt_body").innerHTML =this.responseText;
    }
  };
  xhttp.open("POST", "get_today_channels.jsp", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send();
}

function cancelChannel(ch_id,cancelled) {
    var k= cancelled!="true"?"Cancel":"Re-enable";
    if (!confirm('Are you sure you want to '+k+' this Channel?')) {
        return;
    }
    
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        loadChannel();
    }
  };
  xhttp.open("POST", "cancel_channel.jsp", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("cancelled="+cancelled+"&ch_id="+ch_id);
}

</script>
</html>
