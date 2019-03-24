

<%@page import="data.User"%>
<%@page import="data.LegoHouseDAO"%>
<%
    try {
        User userLoggedIn = (User) session.getAttribute("User");
        if (userLoggedIn == null) {
            request.setAttribute("errormessage", "User not logged in...");
            response.sendRedirect("index.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

