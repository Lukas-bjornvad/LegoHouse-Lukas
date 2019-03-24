

<%@page import="data.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css.css">
        <link rel="stylesheet" type="text/css" href="altcss.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">       
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>

    <body>
        <jsp:include page="siteheader.jsp" />

        <% 
            try{
            User user = (User) request.getSession().getAttribute("User");
            String email = user.getEmail();
            Boolean admin = user.getAdmin();

            out.println("<h1>Welcome back    : " + email + "</h1>");
        %>

        <p><a href="/LegoHouse/OrderHouse.jsp"> Order a house! </a></p>
        <p><a href="/LegoHouse/c/showuser"> Customer page </a></p>
        <%
            if (admin == true) {
                out.println("<p><a href=\"/LegoHouse/AdminPage.jsp\"> Admin </a></p>");
            }}catch(NullPointerException e){

}
        %>
        <p><a href="/LegoHouse/SessionExit.jsp"> Logout</a></p>

    </body>
</html>
