<%-- 
    Document   : parameters
    Created on : 21 Mar, 2019, 3:37:13 PM
    Author     : user
--%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="javax.net.ssl.HttpsURLConnection"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.httpclient.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean class="DBConnection.connections" id="obj"></jsp:useBean>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <form name="frm">
           
          
           
        <h1> URLS</h1>
         <table border="1">
             <tr>
                 
                 <th>URL</th>
             </tr>
         
         <% 
   String u="",d="";
    System.out.print(u);
   int i=1;
   String str="select ID,URL from tbl_dummyurl";
   ResultSet rs=obj.select(str);
   System.out.print(rs);
    while(rs.next())
   {
       d=rs.getString("ID");
    u=rs.getString("URL");
     out.println("#####"+u);
     
   
     {
         %>
         <tr>
           <td><%=u%></td>
         </tr>
             
           <%
        i++;
     }
      }
     %>
             <tr>
                 <td align="center"><input type='submit' name="btnurl" value="Get Parameters"></td>
             </tr>
     </table>
       <% 
        if(request.getParameter("btnurl")!=null)
        {
             out.println("#####@"+u);
           URL aURL = new URL(u );
           //HttpURLConnection con = (HttpURLConnection) obj.openConnection();
      //  HttpsURLConnection con = (HttpsURLConnection )aURL.openConnection();
      //HttpSession gurusession = con.getSession(); 
        String file = aURL.getFile(); 
          String protocol = aURL.getProtocol();
          String authority = aURL.getAuthority(); 
          String host = aURL.getHost();
          int port = aURL.getPort(); 
          String methods = request.getMethod(); 
       //  HttpStatus.getStatusText(response.getStatus());
         int status=response.getStatus();
        //String ref=aURL.getRef();
          
       // response.sendError(404, "Page not found error");
        // response.sendError(407, "Need authentication!!!" );
        // response.sendError(200,"success");
   
          out.println("@@!@@"+file+""+protocol+""+authority+""+host+""+port+""+methods+""+status+"");
          String ins="insert into tbl_response1(files,protocol,authority,host,port,methods,code)values('"+file+"','"+protocol+"','"+authority+"','"+host+"','"+port+"','"+ methods+"','"+status+"')";
          out.println(ins);
          boolean b=obj.insert(ins);
          if(b)
          {
              out.println("inserted");
          }
          else
          {
              out.println("not inserted");
          }
           
          // response.sendRedirect("../insertUrl.jsp");
        }            
               
         %>
        
          
     
        </form>
    
    </body>
</html>
