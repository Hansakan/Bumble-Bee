



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"  %> 

<%   

if(request.getParameter("submit")!= null)
{

    String name = request.getParameter("cname");
     String Product = request.getParameter("Product");
     String Loan   = request.getParameter("Loan ");
     
     Connection con;
     PreparedStatement pst;
     ResultSet rs;
     
     Class.forName("com.mysql.jdbc.Driver");
     con = DriverManager.getConnection("jdbc:localhost/Bumblebee","root","");
     pst = con.prepareStatement("insert into records(Cname,Product,Loan)value(?,?,?)");
     
     pst.setString(1, name);
     pst.setString(2, Product);
     pst.setString(3, Loan);
     
     pst.executeUpdate();
     
     %>
     
     
     <script> 
     
     alert("Record Adedddd");
     
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
        <h1>Bumblebee Admin Panel</h1>
         </br>
          </br>
        
        <div class="row">
            <div class="col-sm-4">
                <form class="" method="post" action="#">
                    <div alight="left">
                        <label class="form-label">Customer Name </label>
                        <input type="text" class="form-control" placeholder="Customer Name" name="cname" id="cname" required >
                    </div>
                    
                    <div alight="left">
                        <label class="form-label">Product </label>
                        <input type="text" class="form-control" placeholder="Product" name="product" id="product" required >
                    </div>
                    
                    <div alight="left">
                        <label class="form-label">Loan Amount </label>
                        <input type="text" class="form-control" placeholder="Loan Amount" name="Loan Amount" id="Loan Amount" required >
                    </div>
                    
                    </br>
                    
                     <div alight="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                          <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                       
                    </div>
                    
                    
                    
                </form>
              
            </div> 
            
            <div class="col-sm-8">
                <div class="panel-body">
                    <table id="tb1-Customer" class="table-responsive table-bordered" cellpadding="0" width ="100%">
                        <thead>
                            <tr> 
                                <th>Customer Name</th>
                                <th>Product</th>
                                <th>Loan Amount</th>
                                <th>Edit</th>
                                <th>Delete</th>
                                
                            </tr>
                            
                            
                            <%
                            
            Connection con;
            PreparedStatement pst;
            ResultSet rs;

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:localhost/Bumblebee","root","");
            
                String query = "select* from records";
                Statement st = con.createStatement();
                
                        rs = st.executeQuery(query);
                        
while(rs.next())
{
                 String id = rs.getString("id");
                            
                            
                            
                            
                            
                            %>
                            
                    
                            
                            <tr>
                                <td><%=rs.getString("cname") %></td>
                                <td><%=rs.getString("product") %></td>
                                <td><%=rs.getString("Loan") %></td>
                                <td><a href="update.jsp?id=<%=id%>"Edit</a></td>
                                <td><a href="Delete.jsp?id=<%=id%>"Delete</a></td>
                                
                                
                                
                            </tr>
                            
                            
                            
                            <%
                                }
                            %>
                            
                        </thead> 
                        
                        
                    </table>
                    
                    
                    
                </div>
                
                
                
                
                
                
                
                
            </div> 
            
            
            
            
        
        </div>
        
        
        
        
        
        
        
        
    </body>
</html>
