

<%@page import="data.LegoHouseDAO"%>
<%@page import="data.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register User</title>
        <link rel="stylesheet" type="text/css" href="altcss.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>  
        <link rel="stylesheet" type="text/css" href="/LegoHouse/css.css">
        <link rel="stylesheet" type="text/css" href="/LegoHouse/housebackground.css">
    </head>
    <body>
        <div id="topmenu">
            <select onChange="window.location.href = this.value">   
                <option value = "/LegoHouse/c/registration"> Create new user </option>
                <option value = "/LegoHouse/c/login"> Login </option>
            </select>
        </div>
        <h1> Create new user </h1>
        <form action="/LegoHouse/c/registration" method=POST>
            Email: <br> <input type=text name=email style="color: black"> <br> 
            Password: <br> <input type= password name=password style="color: black"> <br> 
            <div id="submitbutton1">
                <br> <input type=submit>
            </div>
        </form>
    </body>
</html>