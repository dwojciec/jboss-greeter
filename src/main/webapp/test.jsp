<%@page contentType="text/html"
 import="java.util.*,javax.naming.*,javax.sql.DataSource,java.sql.*"
 %>
 <%
   
  DataSource ds = null;
  Connection con = null; 
  PreparedStatement pr = null; 
  InitialContext ic; 
  try {
  ic = new InitialContext();
  ds = (DataSource)ic.lookup( "java:jboss/datasources/my_oracle" );
  con = ds.getConnection(); 
  pr = con.prepareStatement("SELECT USERNAME, FIRSTNAME, LASTNAME FROM \"xe\".USERS");
  ResultSet rs = pr.executeQuery();
  while (rs.next()) {
  out.println("<br> " +rs.getString("USERNAME") + " | " +rs.getString("FIRSTNAME") + " | " + rs.getString("LASTNAME")); 
  }
  rs.close();
  pr.close();
  }catch(Exception e){
  out.println("Exception thrown " +e); 
  }finally{
  if(con != null){
  con.close();
 }      
} %> 
