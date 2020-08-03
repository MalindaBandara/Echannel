<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="<c:url value='/template/bootstrap.min.css'/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value='/template/bootstrap.min.js'/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value='/template/jquery-3.2.1.js'/>" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="template/bootstrap.min.css">
        <script src="template/jquery-3.2.1.js"></script>
        <script src="template/bootstrap.min.js"></script>
    </head>

   

<script>
      function no_val(){
                var form=document.getElementsByTagName("form")[0];
                if(isNaN(form.no.value)){
                    form.no.focus();
                    document.getElementById("no_val").innerHTML="*Please enter a valid number";
                    return false;
                }else{
                    document.getElementById("no_val").innerHTML="";
                }
            }
    
    
    </script>


    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand"><img src="red.jpg" class="img-rounded" height="60"></a>
                    <a class="navbar-brand">E-CHANNEL ASSISTANT</a>
                </div>
                <ul class="nav navbar-nav">
                </ul>
                <ul class="nav navbar-nav navbar-right">

                </ul>
            </div>
        </nav>


        <div class="container">
            <div class="panel panel-default">
                <div class="panel-heading"><h2>Pathology</h2></div>
                <div class="panel-body">


                    <form class="form-horizontal" name="form1" action="description.jsp" method="POST" onsubmit='return validate(this);'>
                        <div class="form-group row col-sm-10">
                            <div id="val" style="color:red;padding-left:50px;padding-top:5px;padding-bottom:20px;"></div>


                            <label class="control-label col-sm-2" for="ln">Patient ID:</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="id" id="ln">
                            </div>

                            <div class="col-sm-3">
                                <button type="submit" name="ser" class="btn btn-default">Search</button>
                            </div>
                        </div>
                    </form>


                    <form class="form-horizontal" name="form1" action="description.jsp" method="POST" onsubmit='return validate(this);'>

                        <div>
                            <div class="form-group row col-sm-10">
                                <label class="control-label col-sm-2" for="name">Name:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="name" id="name">
                                </div>
                            </div>


                            <div>
                                <div class="form-group row col-sm-10">
                                    <label class="control-label col-sm-2" for="age">Age:</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" name="age" id="age">
                                    </div>
                                </div>


                                <div class="form-group row 	col-sm-10">
                                    <label class="control-label col-sm-2" for="gender">Gender:</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" name="gender" id="gender">
                                    </div></div>



                                <div class="form-group row col-sm-10">
                                    <label class="control-label col-sm-2" for="dignosis">Diagnosis:</label>
                                    <div class="col-sm-8">          
                                        <textarea rows="5"  class="form-control" name="dignosis" id="diagnosis" ></textarea>
                                    </div>
                                </div>
                                
                                
                                
                                <div class="form-group row col-sm-10">
                                    <label class="control-label col-sm-2" for="medicine">Medicine:</label>
                                    <div class="col-sm-8">          
                                        <textarea rows="5"  class="form-control" name="medicine" id="medicine" ></textarea>
                                    </div>
                                </div>
                                
                                
                                
                                <div class="form-group row col-sm-10">
                                    <label class="control-label col-sm-2" for="decription">Other:</label>
                                    <div class="col-sm-8">          
                                        <textarea rows="5"  class="form-control" name="decription" id="decription" ></textarea>
                                    </div>
                                </div>
                                
                                
                                
                                

                                
                                <div class="form-group row col-sm-10">        
                                    <div class="col-sm-offset-2 ">
                                        <button type="submit" class="btn btn-default">Save</button>
                                    
                                        <button  type="reset" class="btn btn-default">Cancel</button>
                                     </div>
                                </div>  
                                     
                                        
                                 
                                </form>
                    <div>
                    
                    <%
                       
                        String pid = request.getParameter("pid");
                        String name = request.getParameter("name");
                        String age = request.getParameter("age");
                        String gender = request.getParameter("gender");
                        String diagnosis = request.getParameter("diagnosis");
                        String medicine = request.getParameter("medicine");
                        String decription = request.getParameter("decription");
                        
                        
                   try{
                        Class.forName("com.mysql.jdbc.Driver");
                        String url="jdbc:mysql://localhost:3306/echannel";
                        Connection con = DriverManager.getConnection(url,"root" , "");

     
                    Statement stmt = con.createStatement();
                    int a = stmt.executeUpdate("insert into pathology values (pid,name,age,gender,diagnosis,medicine,decription)");
                   if(a>1){
                    out.println("<p> Successfully saved to the system. </p>");
                                     }
                   }catch(Exception e){
                          out.println("<p> ERROR: " + e.getMessage() + "</p>");
                      }




%>
                    
             </div>       
                    
            </div>
               </div>
                </div>

                </body>
                </html>