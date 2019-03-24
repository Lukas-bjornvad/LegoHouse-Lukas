<%-- 
    Document   : orderDetails
    Created on : 24-03-2019, 12:14:23
    Author     : Lukas Bjørnvad
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Detail</title>
    </head>
    <body>
          <jsp:include page="siteheader.jsp" />
          <table style="width:100%">
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
            int[][] info = (int[][]) request.getSession().getAttribute("Info");
           int[][] arr = info;
           // out.println("<h1>Adding: " + qty + " " + cupcake.getTopping().getTopping_name() + " cupcakes with " + cupcake.getBottom().getBottom_Name() + " bottom" + "</h1>");
           int sum1 = arr[0][0]+arr[0][1]+arr[0][2]+arr[0][3];
           int sum2 = arr[1][0]+arr[1][1]+arr[1][2]+arr[1][3];
           int sum3 = arr[2][0]+arr[2][1]+arr[2][2]+arr[2][3];
           int height = Integer.parseInt(request.getParameter("height"));
           String length = (String)request.getParameter("length");
           String width = (String)request.getParameter("width");
            out.println("<tr>"+ "<td>2x4</td>" + "<td>"+arr[0][0]+"</td>" + "<td>"+arr[0][1]+"</td>" + "<td>"+arr[0][2]+"</td>" 
                    + "<td>"+arr[0][3]+"</td>" + "<td>"+sum1+"</td>" +"<td>"+sum1*height+"</td>"
                    + "</tr>");
            out.println("<tr>"+ "<td>2x2</td>" + "<td>"+arr[1][0]+"</td>" + "<td>"+arr[1][1]+"</td>" + "<td>"+arr[1][2]+"</td>" 
                    + "<td>"+arr[1][3]+"</td>" + "<td>"+sum2+"</td>" +"<td>"+sum2*height+"</td>"
                    + "</tr>");
            out.println("<tr>"+ "<td>2x1</td>" + "<td>"+arr[2][0]+"</td>" + "<td>"+arr[2][1]+"</td>" + "<td>"+arr[2][2]+"</td>" 
                    + "<td>"+arr[2][3]+"</td>" + "<td>"+sum3+"</td>" +"<td>"+sum3*height+"</td>"
                    + "</tr>");
        %></table>
    <form action = "/LegoHouse/c/finalize">
        <input type="hidden" value="<%=length%>" name ="length">
        <input type="hidden" value="<%=height%>" name ="height">
        <input type="hidden" value="<%=width%>" name ="width">
        <input type="submit" value="Finalize">           
    </form>
    </body>
</html>
