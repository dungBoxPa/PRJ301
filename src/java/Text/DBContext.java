package Text;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {

    /*USE BELOW METHOD FOR YOUR DATARASE CONNECTION FOR BOTH SINGLE AND MULTILPE SQr. SERVER INSTANCE (8) */
    /*DO NOT EDIT THE BELOW MBTHOD, YOU MUST USE ONLY THIS ONE FOR YOUR DATABASE CONNECTION*/
    public Connection getConnection() throws Exception {
        String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
    }
    /*Insert your other code right after this comment*/
    /*Change/update information of your database connection, DO NOT change name of instance variables in this class*/
    private final String serverName = "localhost";
    private final String dbName = "PRJ301_Assignment_OnlineShop";
    private final String portNumber = "1433";
    private final String userID = "sa";
    private final String password = "123";
    
    public static void main(String[] args) {
        DBContext dbContext = new DBContext();
        try {
            if(dbContext.getConnection()!=null){
                System.out.println("Connect DB successfully");
            }else{
                System.out.println("Fail to connect");
            }
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
