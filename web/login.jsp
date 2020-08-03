<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "echannel";
String userId = "root";
String password = "";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
    <head>
  <title>Login</title>
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
      <!--<li><a href="register.jsp"><span class="glyphicon glyphicon-user glyphicon glyphicon-user"></span> Sign Up</a></li>
      
      <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>-->
    </ul>
  </div>
</nav>
<% 
HttpSession existingSession = request.getSession(false);
if (existingSession != null && existingSession.getAttribute("un") != null){
        //already logged in
         String site = new String("home.jsp");
         response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", site); }
    
if((request.getParameter("un") == null)?false:true){
    // process form
    connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
    String sql = "SELECT * FROM patient WHERE un=? AND pwd=SHA(?) LIMIT 1";
    PreparedStatement pstmt= connection.prepareStatement(sql);
    pstmt.setString(1,request.getParameter("un"));
    pstmt.setString(2,request.getParameter("pwd"));
    resultSet = pstmt.executeQuery();
    
    if(!resultSet.next()){
        //invalid credentials
        out.println("<script>alert('Invalid Login!');</script>");
    } else if (session.getAttribute("Username") == null || session.getAttribute("Username").equals("")){
        //valid login with no session set
        session.setAttribute("un",(String)resultSet.getString("un"));
        session.setAttribute("pid",(String)resultSet.getString("pid"));
        session.setAttribute("type","patient");
        out.println("Session set for"+session.getAttribute("un"));
        // New location to be redirected
         String site = new String("home.jsp");
         response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", site); 
    }
    else{
        //seesion exists redirect to home page
        String site = new String("home.jsp");
         response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", site); 
    }
}
else{
    if (session.getAttribute("Username") == null || session.getAttribute("Username").equals("")){
        //freshly loaded page
    }
    else{
        //already logged redirect
        out.println("Session set for"+session.getAttribute("un"));
    }
}
%>
<div class="container">
<div class="panel panel-default">
 <div class="panel-heading"><h2>User Login</h2></div>
    <div class="panel-body">
  <form class="form-horizontal" action="<%=request.getRequestURI()%>" method="post">
    <div class="form-group">
      <label class="control-label col-sm-2" for="name">Username:</label>
      <div class="col-sm-10">
        <input type="name" class="form-control" id="un" placeholder="Enter Username" name="un">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Password:</label>
      <div class="col-sm-10">          
        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <div class="checkbox">
          <label><input type="checkbox" name="remember"> Remember me</label>
        </div>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default">Login</button>
      </div>
    </div>
  </form>
</div>
<div>
<p align=center>Not registered? <a href="register.jsp">Register Here!</a>.</p>


</div>

</body>
</html>
