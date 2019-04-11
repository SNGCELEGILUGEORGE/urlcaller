
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
//import javax.swing.JOptionPane;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author user
 */
public class SelectClass {
    public static void main(String args[]) {
    SelectClass obj=new SelectClass();
        obj.theQuery();
}
    
 public void theQuery() {
        Connection cn=null;
    Statement st=null;
    
    try{
         cn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;"+"databaseName=urlcaller_db;user=root;password=root");            
         st=cn.createStatement();         
         System.out.println("connected");
         
         ArrayList <String> getu= new ArrayList<>();
          //select date
         ArrayList <String> getdate= new ArrayList<>();
         String q1 = "select URL from tbl_url";            
         ResultSet rs = st.executeQuery(q1);  
         
         
         while(rs.next()) 
         {     
            //String id=rs.getString("ID");
             
            String u=rs.getString("URL");
            System.out.println(u);
            getu.add(u);
            System.out.println("s::::"+u); 
         
                String d1 = "select SENDDATE from tbl_url where URL='"+getu+"' "; 
                System.out.println(d1);
                ResultSet rsd = st.executeQuery(d1);
                System.out.println("jvnkj" + rsd);
                while(rsd.next()) 
                {    
                 String date=rsd.getString(1);
                 getdate.add(date);
                 System.out.println("dd::::"+date); 
                  
                }
                      
       for (String a: getu) { 
           // System.out.println(a); 

            URL url=new URL(a);  
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            String  Protocol= url.getProtocol();  
            String HostName=url.getHost();  
            int PortNumber=url.getPort();  
            String FileName=url.getFile();          
            String rsdate=  (new java.util.Date()).toLocaleString();
            int responseCode = con.getResponseCode();
            String method=con.getRequestMethod();
            System.out.println(responseCode);
            System.out.println(method);
          String status="0";
          String op="0";
         
           String q2="insert into tbl_response(OUTPUT,STATUS,SENDDATE,RESPONSE_DATE,PROTOCOL,HOSTNAME)values('"+op+"','"+responseCode+"','"+getdate+"','"+rsdate+"','"+Protocol+"','"+HostName +"')";        
           st.executeUpdate(q2); 
     System.out.print(q2);
          }    
            
         } }   catch (IOException ex) {
            Logger.getLogger(SelectClass.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SelectClass.class.getName()).log(Level.SEVERE, null, ex);
        }
           }
    
  } 
            
            
      
 
