<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        String site;    
            
         if(session.getAttribute("type")=="doctor"){
             site = new String("dlogin.jsp");
         }
         else {
             site = new String("login.jsp");
         }
            
         session.invalidate();
         request.getSession(false);
         response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", site);     
        %>
    </body>
</html>
