
<%@page import="java.sql.*"  %> 

<%   


        String id = request.getParameter("id");
    
     Connection con;
     PreparedStatement pst;
     ResultSet rs;
     
     Class.forName("com.mysql.jdbc.Driver");
     con = DriverManager.getConnection("jdbc:localhost/Bumblebee","root","");
     pst = con.prepareStatement("Delete from records where id = ?");
     
     
     pst.setString(1, id);
     
     pst.executeUpdate();
     
     %>
     
     
     <script> 
     
     alert("Record Deleteddddd");
     
     </script>
     
      
