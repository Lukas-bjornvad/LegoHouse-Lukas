

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="SessionExit">
    <%     
        session.invalidate();
        RequestDispatcher rd = request.getRequestDispatcher("/c/login");        
        rd.forward(request, response);  
    %>
</div>
