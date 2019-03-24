
package data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Random;
import logic.DBConnector;

/**
 *
 * @author Lukas Bjørnvad
 */
public class LegoHouseDAO {
     final static boolean DEBUG = true;

    // DOES NOT USE PREPARESTATEMENT YET
    //Creates new user object
    /**
     *
     * @param user
     * @throws Exception
     */
    public void createUser(User user) throws Exception {
        PreparedStatement preparedStmt;
        DBConnector connector = new DBConnector();
        Connection c = connector.getConnection();
        String query
                = " insert into users (  email, password, role) VALUES(?,?,?)";
        preparedStmt = c.prepareStatement(query);
        preparedStmt.setString(1, user.getEmail());
        preparedStmt.setString(2, user.getPassword());
        preparedStmt.setBoolean(3, user.getAdmin());
        preparedStmt.execute();

        preparedStmt.close();
        c.close();
    }

    /**
     *
     * @param email
     * @return
     * @throws Exception
     */
    public User getUser(String email) throws Exception {
        User user = null;

        DBConnector connector = new DBConnector();
        Connection c ;
        String query = "select * from users where email = '" + email + "';";
        c = connector.getConnection();
        Statement stmt = c.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        
        int id = 0;
        String password = "";
        email = "";
        Boolean admin = false;
        while (rs.next()) {
            password = rs.getString("password");
            email = rs.getString("email");
            admin = rs.getBoolean("role");
            id = rs.getInt("userid");
        }
        if (email != null && !email.isEmpty()) {
            user = new User(password, email, admin, id);
        }
        stmt.close();
        rs.close();
        c.close();
        return user;
    }

    /**
     *
     * @param user
     * @throws Exception
     */
    public void updateUser(User user) throws Exception {
        PreparedStatement preparedStmt;
        DBConnector connector = new DBConnector();
        Connection c = connector.getConnection();
        String query
                = "UPDATE users "
                + "SET "
                + "email = ?, "
                + "password =  ?, "
                + "role = ? ";
        preparedStmt = c.prepareStatement(query);
        preparedStmt.setString(1, user.getEmail());
        preparedStmt.setString(2, user.getPassword());
        preparedStmt.setBoolean(3, user.getAdmin());
        preparedStmt.executeUpdate();
        preparedStmt.close();
        c.close();
    }

    /** 
     *
     * @param user
     * @throws Exception
     */
    public void deleteUser(User user) throws Exception {
        PreparedStatement preparedStmt;
        DBConnector connector = new DBConnector();
        Connection c = connector.getConnection();
        String query
                = "DELETE FROM users "
                + "WHERE email = '" + user.getEmail() + "';";
        preparedStmt = c.prepareStatement(query);
        preparedStmt.execute();
        preparedStmt.close();
        c.close();
    }
       
    public void addOrder(String details, User user) throws Exception {
        PreparedStatement preparedStmt;
        DBConnector connector = new DBConnector();
        Connection c = connector.getConnection();
        String query
                = " insert into orders (details, userid) VALUES(?,?)";
        preparedStmt = c.prepareStatement(query);
        preparedStmt.setString(1, details);
        preparedStmt.setInt(2, user.getId());
        preparedStmt.execute();
        preparedStmt.close();
        c.close();
    }

    /**
     *
     * @param id
     * @return ordernumber + customer name
     * @throws Exception
     */
    public HashMap<Integer, String> getAllOrdersSimple(int id) throws Exception {
        HashMap<Integer, String> result = new HashMap<>();

        DBConnector connector = new DBConnector();
        Connection c = connector.getConnection();
        Statement stmt = c.createStatement();
        StringBuilder query = new StringBuilder("SELECT * FROM orders LEFT JOIN users using (userid)");
        if (id != 0) {
            query.append(" WHERE userid = ").append(id);
        }
        query.append(";");
        ResultSet rs = stmt.executeQuery(query.toString());

        while (rs.next()) {
            int no = rs.getInt("orderid");
            String customer = rs.getString("email");
            result.put(no, customer);
        }

        rs.close();
        stmt.close();
        c.close();
        return result;
    }
     public void orderSent(int orderid) throws Exception {
        PreparedStatement preparedStmt;
        DBConnector connector = new DBConnector();
        Connection c = connector.getConnection();
        String query
                = "UPDATE orders "
                + "SET "
                + "sent = ? "
                + "where orderid ="+orderid;
        preparedStmt = c.prepareStatement(query);
        preparedStmt.setInt(1, 1);
        preparedStmt.executeUpdate();
        preparedStmt.close();
        c.close();
    }
    
}
