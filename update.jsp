

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@page import="java.sql.*"  %> 

<%   

if(request.getParameter("submit")!= null)
{
        String id = request.getParameter("id");
    String name = request.getParameter("cname");
     String Product = request.getParameter("Product");
     String Loan   = request.getParameter("Loan ");
     
     Connection con;
     PreparedStatement pst;
     ResultSet rs;
     
     Class.forName("com.mysql.jdbc.Driver");
     con = DriverManager.getConnection("jdbc:localhost/Bumblebee","root","");
     pst = con.prepareStatement("update records set cname = ?,Product =?, loan =?, where id = ?");
     
     pst.setString(1, name);
     pst.setString(2, Product);
     pst.setString(3, Loan);
     pst.setString(4, id);
     
     pst.executeUpdate();
     
     %>
     
     
     <script> 
     
     alert("Record Updateddddd");
     
     </script>
     
      
<%


}



%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        <h1>Update data</h1>
        
        <div class="row">
             <div class="col-sm-4">
                <form class="" method="post" action="#">
                    
                    
                    <%
                        
                     Connection con;
                        PreparedStatement pst;
                        ResultSet rs;

                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:localhost/Bumblebee","root","");

                    String id = request.getParameter("id");
                    
                        pst = con.prepareStatement("select * from record where id = ?");
                        pst. setString(1, id);
                        rs = pst.executeQuery();
                        
                            while(rs.next())
                            {
                        
                        
                    
                    
                    %>
                    
                    
                    
                    
                    <div alight="left">
                        <label class="form-label">Customer Name </label>
                        <input type="text" class="form-control" placeholder="Customer Name" value="<%= rs.getString("cname") %>" name="cname" id="cname" required >
                    </div>
                    
                    <div alight="left">
                        <label class="form-label">Product </label>
                        <input type="text" class="form-control" placeholder="Product"value="<%= rs.getString("Product") %> name="product" id="product" required >
                    </div>
                    
                    <div alight="left">
                        <label class="form-label">Loan Amount </label>
                        <input type="text" class="form-control" placeholder="Loan Amount" value="<%= rs.getString("Loan") %>name="Loan Amount" id="Loan Amount" required >
                    </div>
                    
                    
                    <% } %>
                        
                    </br>
                    
                     <div alight="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                          <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                       
                    </div>
                    
                    <div align="right">
                        
                        <p> <a herf="index.jsp">Click Back to Page </a></p>
                    </div>
                    
                </form>
              
            </div> 
            
            
        </div>
        
        
        
    </body>
</html>
