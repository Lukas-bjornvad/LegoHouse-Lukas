package presentation;


import data.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Command class for registering new users. Admin status must be applied manually in SQL database.
 * Retrieves user parameters on input and adds to database.
 * Does not redirect the main menu. User is redirected to login site on creation.
 * Used by Front Controller.
 */
public class RegistrationCommand extends Command {
/**
 * Registration command, needs username, password and email which it then tries to use
 * to create a new user in the database.
 * It then forwards you based on whether the creation was succesful or not.
 * @param request
 * @param response
 * @throws ServletException
 * @throws IOException 
 */
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        final LegoHouseDAO dao = new LegoHouseDAO();

      
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        try {
            if (email != null && password != null) {
                User user = dao.getUser(email);
                if (user == null) {
                    dao.createUser(new User(email, password));
                    request.getRequestDispatcher("/NewUser.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("/FailedCreation.jsp").forward(request, response);
                }
            } else {
                request.getRequestDispatcher("/RegisterUser.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
