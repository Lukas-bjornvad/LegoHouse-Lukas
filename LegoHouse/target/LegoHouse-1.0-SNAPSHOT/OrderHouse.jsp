<%-- 
    Document   : OrderHouse
    Created on : 22-03-2019, 14:10:17
    Author     : Lukas Bjørnvad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OrderHouse</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">       
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="/LegoHouse/css.css">
        <link rel="stylesheet" type="text/css" href="/LegoHouse/housebackground.css">
    </head>

    <body>
        <h1> Order </h1>
        <form action="/LegoHouse/c/house" method=POST>
            Length:<br> <input type=text name=length style="color: black"> <br> 
            Width: <br> <input type=text name=width style="color: black"> <br> 
            Height: <br> <input type=text name=height style="color: black"> <br> 
            <div id="submitbutton1">
                <br> <input type=submit>
            </div>
        </form>

        <%
            String errormessage = (String) request.getAttribute("errormessage");
            if (errormessage == null || errormessage.isEmpty()) {
                errormessage = "";
            }
            out.println(errormessage);
        %>
    </body>
</html>
