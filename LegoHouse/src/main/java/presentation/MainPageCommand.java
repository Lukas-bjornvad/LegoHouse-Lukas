/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package presentation;

import data.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Command Class for handling the main page of the website.
 * Necessary when displaying current balance of the user defined on the session.
 * Retrieves parameters from the user defined on the session.
 * Used by Front Controller.
 *
 */
public class MainPageCommand extends Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LegoHouseDAO dao = new LegoHouseDAO();

        try {
            User user = (User) request.getSession().getAttribute("User");
            String email = user.getEmail();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("/MainPage.jsp").forward(request, response);
    }

}
