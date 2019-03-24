

<%@page import="logic.Calc"%>
<%@page import="data.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="logic.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Details</title>    
        <link rel="stylesheet" type="text/css" href="altcss.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">       
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>
    <body>
             <jsp:include page="siteheader.jsp" />

        <form method="post">
            <table border = "2">
                <h1>Ulige lag</h1>
         <tr>
                  <th>Type</th>
                  <th>Side 1</th>
                  <th>Side 2</th>
                  <th>Side 3</th>
                  <th>Side 4</th>
                  <th>Ialt</th>
                  <th>Ialt x højde</th>
              
              </tr>
                <%
                    int orderid;
                    try {
                        Calc k = new Calc();
                        orderid= Integer.parseInt(request.getParameter("idorder")); 
                        DBConnector connector = new DBConnector();
                        Connection c = connector.getConnection();
                        Statement stmt = c.createStatement();
                        ResultSet rs = stmt.executeQuery(
                                "SELECT *"
                                + " FROM orders"
                                + " LEFT JOIN users "
                                + "using (userid) "
                                + " WHERE orderid = " +orderid+ ";"); 
                        boolean x = false;
                        
                        while (rs.next()) {
                            x = rs.getBoolean("sent");
                            String details = rs.getString("details");
                            String[] p = details.split(",");
                            int height = Integer.parseInt(p[2]);
                            int length = Integer.parseInt(p[0]);
                            int width = Integer.parseInt(p[1]);
                            int[][] arr = k.get(length, width, height, true);
                            int sum1 = arr[0][0] + arr[0][1] + arr[0][2] + arr[0][3];
                            int sum2 = arr[1][0] + arr[1][1] + arr[1][2] + arr[1][3];
                            int sum3 = arr[2][0] + arr[2][1] + arr[2][2] + arr[2][3];

                            out.println("<tr>" + "<td>2x4</td>" + "<td>" + arr[0][0] + "</td>" + "<td>" + arr[0][1] + "</td>" + "<td>" + arr[0][2] + "</td>"
                                    + "<td>" + arr[0][3] + "</td>" + "<td>" + sum1 + "</td>" + "<td>" + sum1 * height + "</td>"
                                    + "</tr>");
                            out.println("<tr>" + "<td>2x2</td>" + "<td>" + arr[1][0] + "</td>" + "<td>" + arr[1][1] + "</td>" + "<td>" + arr[1][2] + "</td>"
                                    + "<td>" + arr[1][3] + "</td>" + "<td>" + sum2 + "</td>" + "<td>" + sum2 * height + "</td>"
                                    + "</tr>");
                            out.println("<tr>" + "<td>2x1</td>" + "<td>" + arr[2][0] + "</td>" + "<td>" + arr[2][1] + "</td>" + "<td>" + arr[2][2] + "</td>"
                                    + "<td>" + arr[2][3] + "</td>" + "<td>" + sum3 + "</td>" + "<td>" + sum3 * height + "</td>"
                                    + "</tr> </table>");
                        }   out.println("<h1>Sendt: "+x+"</h1>");
                    rs.close();
                    stmt.close();
                    c.close();
                  
                } catch (Exception e) {
                    e.printStackTrace();
                }

                %>
                 <table border = "2">
                     <h1>Lige lag</h1>
         <tr>
                  <th>Type</th>
                  <th>Side 1</th>
                  <th>Side 2</th>
                  <th>Side 3</th>
                  <th>Side 4</th>
                  <th>Ialt</th>
                  <th>Ialt x højde</th>
              
              </tr>
                <%

                    try {
                        Calc k = new Calc();
                        orderid= Integer.parseInt(request.getParameter("idorder")); 
                        DBConnector connector = new DBConnector();
                        Connection c = connector.getConnection();
                        Statement stmt = c.createStatement();
                        ResultSet rs = stmt.executeQuery(
                                "SELECT *"
                                + " FROM orders"
                                + " LEFT JOIN users "
                                + "using (userid) "
                                + " WHERE orderid = " +orderid+ ";"); 
                        boolean x = false;
                        
                        while (rs.next()) {
                            x = rs.getBoolean("sent");
                            String details = rs.getString("details");
                            String[] p = details.split(",");
                            int height = Integer.parseInt(p[2]);
                            int length = Integer.parseInt(p[0]);
                            int width = Integer.parseInt(p[1]);
                            int[][] arr = k.get(length, width, height, true);
                            int sum1 = arr[0][0] + arr[0][1] + arr[0][2] + arr[0][3];
                            int sum2 = arr[1][0] + arr[1][1] + arr[1][2] + arr[1][3];
                            int sum3 = arr[2][0] + arr[2][1] + arr[2][2] + arr[2][3];

                            out.println("<tr>" + "<td>2x4</td>" + "<td>" + arr[0][0] + "</td>" + "<td>" + arr[0][1] + "</td>" + "<td>" + arr[0][2] + "</td>"
                                    + "<td>" + arr[0][3] + "</td>" + "<td>" + sum1 + "</td>" + "<td>" + sum1 * height + "</td>"
                                    + "</tr>");
                            out.println("<tr>" + "<td>2x2</td>" + "<td>" + arr[1][0] + "</td>" + "<td>" + arr[1][1] + "</td>" + "<td>" + arr[1][2] + "</td>"
                                    + "<td>" + arr[1][3] + "</td>" + "<td>" + sum2 + "</td>" + "<td>" + sum2 * height + "</td>"
                                    + "</tr>");
                            out.println("<tr>" + "<td>2x1</td>" + "<td>" + arr[2][0] + "</td>" + "<td>" + arr[2][1] + "</td>" + "<td>" + arr[2][2] + "</td>"
                                    + "<td>" + arr[2][3] + "</td>" + "<td>" + sum3 + "</td>" + "<td>" + sum3 * height + "</td>"
                                    + "</tr> </table>");
                        }   out.println("<h1>Sendt: "+x+"</h1>");
                    rs.close();
                    stmt.close();
                    c.close();
                  
                } catch (Exception e) {
                    e.printStackTrace();
                }

                %>
                <input type="hidden" name="orderid" value="<%=request.getParameter("idorder")%>">
                <button formAction="/LegoHouse/c/setSend">Is sent</button>
        </form>
    </body>
</html>


