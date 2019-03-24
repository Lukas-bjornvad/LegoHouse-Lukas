/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package presentation;

import data.LegoHouseDAO;
import data.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lukas Bjørnvad
 */
public class FinalizeCommand extends Command {
    
      @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LegoHouseDAO dao = new LegoHouseDAO();
        User user = (User) request.getSession().getAttribute("User");
        String details = request.getParameter("length")+"," + request.getParameter("width") +","+ request.getParameter("height");
        try {
        dao.addOrder(details, user);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("/LegoHouse/MainPage.jsp");
    } 
}
