/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package presentation;

import data.*;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lukas Bjørnvad
 */
public class SetSendtCommand extends Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            if(request.getParameter("orderid") != null){
            int orderid = Integer.parseInt(request.getParameter("orderid"));
            LegoHouseDAO p = new LegoHouseDAO();
            p.orderSent(orderid);}
        } catch (Exception ex) {
           ex.printStackTrace();
        }
        response.sendRedirect("/LegoHouse/AdminPage.jsp");
    }

}
