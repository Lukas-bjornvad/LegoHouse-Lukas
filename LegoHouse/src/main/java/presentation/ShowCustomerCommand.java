/*
 */

package presentation;

import data.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Command Class for redirecting to "UserShow".jsp and several error .jsp pages
 * Necessary when showing basic user info and showing error messages.
 * Used by Front Controller.
 */
public class ShowCustomerCommand extends Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = null;

        try {
            user = (User) session.getAttribute("User");
            String username = user.getEmail();
            if (username == null) {
                request.setAttribute("errormessage", "User not logged in...");
                request.getRequestDispatcher("/UserLoginCheck.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println("Error occured in CustomerPage");
            request.getRequestDispatcher("/LegoHouse/c/login").forward(request, response);
        }

        System.out.println("user in customerPage: " + user);
        request.getRequestDispatcher("/UserPage.jsp").forward(request, response);
    }

}
