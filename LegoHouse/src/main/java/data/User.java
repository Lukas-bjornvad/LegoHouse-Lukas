/*
 */

package data;



/**
 * Help class for the User object. Holds relevance when handling the SQL database user table.
 * @author Lukas Bjornvad
 */
public class User {

    private final String password;
    private final String email;
    private Boolean admin = false;
    private int id;

    /**
     *User class constructor without the admin parameter.
     *Implemented for functions where admin status doesn't have any relevance.
     * 
     * @param password
     * @param email
     */
    public User( String email, String password) {
        this.password = password;
        this.email = email;
    }   

    /**
     *User class constructor with the admin parameter.
     *Implemented for functions where admin status has relevance.
     *
     * @param password
     * @param email
     * @param admin
     */
    public User( String password, String email, Boolean admin, int id) {
        this.password = password;
        this.email = email;
        this.admin = admin;
        this.id = id;
    }

    public int getId() {
        return id;
    }

  
    public Boolean getAdmin() {
        return admin;
    }

   
    public void setAdmin(Boolean admin) {
        this.admin = admin;
    }
   
    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    @Override
    public String toString() {
        return "User{"  + "password=" + password + ", email=" + email + ", admin=" + admin + '}';
    }

}
