/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DBConnection;

import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class connections {
       // public static void main(String[] args) {
     Connection cn=null;
    ResultSet rs=null;
    Statement st=null; 
    {
     try{
           System.out.println("connect start");
   // Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
           System.out.println("Driver start");
  // Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
     cn=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=urlcaller_db;user=root;password=root");         
    if(cn!=null)
    {
         System.out.println("ok");
    }
     System.out.println("connect");
         
        } 
     catch (Exception e) {
            System.out.println(e);
            e.printStackTrace();
        }
    }
      //  }
        
         public boolean insert(String str){
        boolean b=false;
        try {
            st=cn.createStatement();
            st.executeUpdate(str);
            b=true;            
        } catch (Exception e) {
        }
        return b;    
    }
    public ResultSet select(String selQry)
    {
        try {
            st=cn.createStatement();
            rs=st.executeQuery(selQry);            
        } catch (Exception e) {
        }
        return rs;        
    }            

    ResultSet selectCommand(String songQry) {
        throw new UnsupportedOperationException("Not supported yet.");
        //To change body of generated methods, choose Tools | Templates.
    }
    

}
