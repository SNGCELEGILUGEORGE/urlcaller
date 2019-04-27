<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean class="DBConnection.connection" id="obj"></jsp:useBean>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TimeTable</title>
    </head>
    <body>
        <form method="post" name="frm3">
        <h1>Time Table</h1>
        <% 
       /* String u=request.getRequestURI();
        String Data="timetable";
        
        Date date1=new Date();
        DateFormat timeFormat1=new SimpleDateFormat("dd/MM/yyyy");
        String sdate=timeFormat1.format(date1);
        
         String ins="insert into tbl_url(URL,DATA)values('"+u+"','"+Data+"')";
      
          boolean b=obj.insert(ins);
          if(b)
          {
              out.println("inserted");
          }
          else
          {
              out.println("not inserted");
          } */
        %>
        </form>  
    </body>
</html>