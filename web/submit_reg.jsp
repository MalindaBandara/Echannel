<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%
   if(request.getParameter("un")==null){
       String site = new String("login.jsp");
         response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", site);
   } 
    
   Enumeration paramNames = request.getParameterNames();
   String[] values=new String[8]; 
   int i=0;
   while(paramNames.hasMoreElements()) {
      String paramName = paramNames.nextElement().toString();
     //out.print("<b>" + paramName + ":</b>");
      values[i++] = request.getParameter(paramName);
      //out.println(values[i++]+"<br/>");
   }
%>
<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/echannel"
         user = "root"  password = ""/>
         <sql:update dataSource = "${snapshot}" var = "result">
             INSERT INTO patient VALUES (NULL,'<%=values[0]%>','<%=values[1]%>','<%=values[2]%>','<%=values[3]%>',SHA('<%=values[4]%>'),'<%=values[6]%>','<%=values[7]%>');
</sql:update>
             
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
      <!--<li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>-->
      
      <!--<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>-->
    </ul>
  </div>
</nav>

<div class="container">
<div class="panel panel-default">
    <div class="panel-heading"><h2>Registration Successful</h2></div>
        <div class="panel-body">
            <p>You may now proceed to <a href="login.jsp">Login</a></p>  
        </div>
<div>


</div>

</body>
</html>