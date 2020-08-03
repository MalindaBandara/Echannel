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
<body>
    <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
    <a class="navbar-brand"><img src="red.jpg" class="img-rounded" height="60"></a>
      <a class="navbar-brand">E-CHANNEL ASSISTANT</a>
    </div>
    <ul class="nav navbar-nav">
     <!-- <li class="active"><a href="Home.php">Home</a></li>
      <li><a href="#">Channel Details</a></li>-->
   
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <!--<li><a href="register.jsp"><span class="glyphicon glyphicon-user glyphicon glyphicon-user"></span> Sign Up</a></li>
      
      <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>-->
    </ul>
  </div>
</nav>


<div class="container">
<div class="panel panel-default">
 <div class="panel-heading"><h2>Create an account</h2></div>
    <div class="panel-body">

        <script>
            function pwd_val(){
                var form=document.getElementsByTagName("form")[0];
                     if(form.pwd.value!=form.rpwd.value){
                    //form.rpwd.focus();
                    document.getElementById("pwd_val").innerHTML="*Passwords do not match";
                    return false;
                }else{
                    document.getElementById("pwd_val").innerHTML="";
                }
            }
            
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
            
            function validate(form){
                var valid=true;
                var tags=form.getElementsByTagName("input");
                for(var i=0;i<tags.length;i++){
                    if(tags[i].value==""){
                        tags[i].focus();
                        document.getElementById("val").innerHTML="*Please fill out all fields";
                        return false;
                    }
                }
                
                if(isNaN(form.no.value)){
                    form.no.focus();
                    document.getElementById("no_val").innerHTML="*Please enter a valid number";
                    return false;
                }else{
                    document.getElementById("no_val").innerHTML="";
                }
                
                if(form.pwd.value!=form.rpwd.value){
                    //form.rpwd.focus();
                    document.getElementById("pwd_val").innerHTML="*Passwords do not match";
                    return false;
                }else{
                    document.getElementById("pwd_val").innerHTML="";
                }
                
                if(valid){
                    document.getElementById("val").innerHTML="";
                    return true;
                }
            }
        </script>
  
  <form class="form-horizontal" name="form1" action="submit_reg.jsp" method="POST" onsubmit='return validate(this);'>
    <div class="form-group row col-sm-10">
        <div id="val" style="color:red;padding-left:50px;padding-top:5px;padding-bottom:20px;"></div>
      <label class="control-label col-sm-2" for="fn">First Name:</label>
      <div class="col-sm-3">
        <input type="text" class="form-control" name="fn" id="fn">
      </div>
      <label class="control-label col-sm-2" for="ln">Last Name:</label>
      <div class="col-sm-3">
          <input type="text" class="form-control" name="ln" id="ln">
      </div>
    </div>
    <div>
        <div class="form-group row col-sm-10">
      <label class="control-label col-sm-2" for="ln">Address:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" name="ad" id="ad">
      </div>
      </div>
       <div class="form-group row 	col-sm-10">
      <label class="control-label col-sm-2" for="fn">Username:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" name="un" id="un">
      </div></div>
    <div class="form-group row col-sm-10">
      <label class="control-label col-sm-2" for="pwd">Create a Password:</label>
      <div class="col-sm-8">          
        <input type="password" minlength="5" onblur="pwd_val();" class="form-control" name="pwd" id="pwd" placeholder="Enter password">
      </div>
      </div>
          <div class="form-group row col-sm-10">
      <label class="control-label col-sm-2" for="rpwd">Confirm your Password:</label>
      <div class="col-sm-8">          
          <input type="password" minlength="5" onblur="pwd_val();" class="form-control" name="rpwd" id="rpwd" placeholder="Reenter password"> <div id="pwd_val" style="color:red;"></div>
      </div></div>
       <div class="form-group row col-sm-10">
      <label class="control-label col-sm-2" for="fn">Contact No:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" maxlength="10" name="no" onblur="no_val();" id="no"><div id="no_val" style="color:red;"></div>
      </div></div>
      <div class="form-group row col-sm-10">
      <label class="control-label col-sm-2" for="email">Email:</label>
      <div class="col-sm-8">
        <input type="email" class="form-control" name="email"  onblur="validate(this);" id="email">
      </div>

    </div>
    <div class="form-group row col-sm-10">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default">Register</button>
      </div>
    </div>
  </form></div></div>
</div>

</body>
</html>