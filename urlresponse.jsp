<%-- 
    Document   : Registsrtion
    Created on : 25 Mar, 2019, 3:05:18 PM
    Author     : user
--%>

<%@page import="java.net.HttpURLConnection"%>
<%@page import="javax.net.ssl.HttpsURLConnection"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean class="DBConnection.connection" id="obj"></jsp:useBean>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <input type="text" name="txt1">
        <input type="submit" name="btn">
        <table border="1">
<tr>
<th>guru header</th><th>guru header Value(s)</th>
    </tr>
     <%
	HttpSession gurusession = request.getSession(); 
	out.print("<tr><td>Session Name is </td><td>" +gurusession+ "</td.></tr>");
	Locale gurulocale = request.getLocale ();
	out.print("<tr><td>Locale Name is</td><td>" +gurulocale + "</td></tr>");
	String path = request.getPathInfo(); 
	out.print("<tr><td>Path Name is</td><td>" +path+ "</td></tr>"); 
	// lpath = request.getClass();
	//out.print("<tr><td>Context path is</td><td>" +lpath + "</td></tr>"); 
	String servername = request.getServerName(); 
	out.print("<tr><td>Server Name is </td><td>" +servername+ "</td></tr>");
	int portname = request.getServerPort(); 
	out.print("<tr><td>Server Port is </td><td>" +portname+ "</td></tr>");
	Enumeration hnames = request.getHeaderNames();
	while(hnames.hasMoreElements()) { 
		String paramName = (String)hnames.nextElement();
		out.print ("<tr><td>" + paramName + "</td>" );
		
		String paramValue = request.getHeader(paramName);
		out.println("<td> " + paramValue + "</td></tr>");
	}
        if(request.getParameter("btnurl")!=null)
        {
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
        }
 
%>
        </table>
  
    </body>
</html>
