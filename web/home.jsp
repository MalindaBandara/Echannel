<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
HttpSession existingSession = request.getSession(false);
if (existingSession == null || (!existingSession.getAttribute("type").equals("patient"))){
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
 <div class="panel-heading"><h2>Channel Times</h2></div>
    <div class="panel-body">
        <h4>Select your preferred Channel Time</h4><br/>
        <form action="add_appointment.jsp" method="post" onsubmit='return validate(this);'>

            <style>.details{padding:10px};</style>
            <table class="table-bordered" align="center" width="90%">
            <style>.details,th{text-align:center;width:17%}; .select{padding:10px;};</style>
            <tr><th colspan="2">Monday</th>
                <th colspan="2" >Tuesday</th>
                <th colspan="2">Wednesday</th>
                <th colspan="2">Thursday</th>
                <th colspan="2">Friday</th>
            </tr>
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/echannel","root","");
                    Statement stmt = con.createStatement();
                    String query="SELECT c.*,d.name FROM channel c LEFT JOIN doctor d ON d.d_id=c.d_id ORDER BY FIELD(start_time,'8.00 A.M.','10.00 A.M.','2.00 P.M.','4.00 P.M.'),FIELD(day, 'MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY', 'SUNDAY')";
                    ResultSet rs=stmt.executeQuery(query);
                    for(int i=0;i<3;i++){
                        out.print("<tr>");
                        for(int j=0;j<5;j++){
                            rs.next();
                            String color=rs.getString("cancelled").equalsIgnoreCase("true")?"color:red;":"";
                            out.print("<td class='select' align='center'><input type='radio' onchange='loadDates();' name='channel' value='"+rs.getString("ch_id")+"' "+((rs.getString("cancelled").equalsIgnoreCase("true")|| rs.getString("d_id")==null)?"style='visibility:hidden;'":"true")+">");
                            out.print("<td style='"+color+"' class='details'>"+rs.getString("start_time")+"-"+rs.getString("end_time")+"</br>");
                            out.print((rs.getString("name")==null)?"-":rs.getString("name")+"</td>");
                        }
                        out.println("</tr>");
                    }
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }   
            %>
        </table>
       
        <table align="center">
            <tr>
                <td align="center"><br/><br/>
                    <block id="option"></block><br/><br/>
                    <block id="no_of"></block><block id="count"></block>
                    <br/><br/>
                </td>
            </tr>    
            <tr><td align="center"><input type="submit" value="Add Apointment"/></td></tr>
        </table>
        </form>
    </div>
<div>
</div>
</body>
<script>
function loadDates() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("option").innerHTML =this.responseText;
      getCount();
    }
  };
  xhttp.open("POST", "channel_get_dates.jsp", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("channel="+getRadioValue("channel"));
}

function getCount() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        document.getElementById("count").innerHTML =this.responseText;
        document.getElementById("no_of").innerHTML="Number of Appointments on selected date : "; 
    }
  };
  xhttp.open("POST", "channel_get_count.jsp", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var e = document.getElementById("sel_count");
    var strUser = e.options[e.selectedIndex].value;
  xhttp.send("channel="+getRadioValue("channel")+"&apt_date="+strUser);
}

function getRadioValue(theRadioGroup)
{
    var elements = document.getElementsByName(theRadioGroup);
    for (var i = 0, l = elements.length; i < l; i++)
    {
        if (elements[i].checked)
        {
            return elements[i].value;
        }
    }
}
</script>
</html>
