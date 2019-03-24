<%-- 
    Document   : UserPage
    Created on : 24-03-2019, 15:26:21
    Author     : Lukas Bjørnvad
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="data.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
     <jsp:include page="siteheader.jsp" />

        <form method="post">
            <table border = "1">
                <tr>
                    <td>order_number</td>
                    <td>username</td>
                    <td>...</td>
                </tr>
                <%
                    try {
                        User user = (User) request.getSession().getAttribute("User");
                        LegoHouseDAO dao = new LegoHouseDAO();
                        HashMap<Integer, String> orders = dao.getAllOrdersSimple(user.getId());

                        for (Map.Entry<Integer, String> entry : orders.entrySet()) {
                %>
                <tr>
                    <td><%=entry.getKey()%></td>
                    <td><%=entry.getValue()%></td>
                    <td>

                        <a href="/LegoHouse/InvoiceDetails.jsp?idorder=<%=entry.getKey()%>" >
                            <div style="height:100%;width:100%">
                                <!--<input type="radio" name="radio1" onclick="handleClick(this.id);" id="customerId" />-->
                                view
                            </div>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
            <%
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </form>
    </body>
</html>
