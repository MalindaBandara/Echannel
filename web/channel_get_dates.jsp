<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%!
    int channelDay(String cid){
        if(cid.contains("mon"))
            return Calendar.MONDAY;
        else if(cid.contains("tue"))
            return Calendar.TUESDAY;
        else if(cid.contains("wed"))
            return Calendar.WEDNESDAY;
        else if(cid.contains("thu"))
            return Calendar.THURSDAY;
        else if(cid.contains("fri"))
            return Calendar.FRIDAY;
        else
            return -1;
    } 
%>
<%  
    String cid=request.getParameter("channel");
    Calendar cal = new GregorianCalendar();
    int i=0;
    String date="";
    String dateFormatter;
    out.print("Select Date of Appointment : ");
    out.print("<select id='sel_count' name='apt_date' onchange='getCount();'>");
    while(i<4){
        if( cal.get( Calendar.DAY_OF_WEEK ) == channelDay(cid) ){
            date=cal.getTime().toString();
            SimpleDateFormat format1 = new SimpleDateFormat("MM/dd/yyyy");
            String formatted = format1.format(cal.getTime());
            dateFormatter=date.substring(0, 10)+", "+date.substring(24, 28);
            
            out.print("<option value='"+formatted+"'>"+dateFormatter+"</option>");
            i++;
        }
        cal.add(Calendar.DATE,1);
    }
    out.print("</select>");    
%>

      
