import java.sql.*;

public class NewClass {
    public static void main(String[] args) {
        // JDBC URL, username, and password of Oracle database
        String url = "jdbc:oracle:thin:@csdb.csc.villanova.edu:1521:orcl";
        String user = "dbteam3";
        String password = "F23dbteam3H";

        // SQL query to fetch data from the Hospital table
        String sql = "SELECT * FROM Hospital";

        try (Connection connection = DriverManager.getConnection(url, user, password);
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {

            // Iterate through the result set and print the data
            while (resultSet.next()) {
                int hospitalId = resultSet.getInt("Hospital_ID");
                String hospitalName = resultSet.getString("Hospital_Name");
                String hospitalAddress = resultSet.getString("Hospital_Address");
                String hospitalPhone = resultSet.getString("Hospital_Phone");

                System.out.println("Hospital ID: " + hospitalId);
                System.out.println("Hospital Name: " + hospitalName);
                System.out.println("Hospital Address: " + hospitalAddress);
                System.out.println("Hospital Phone: " + hospitalPhone);
                System.out.println("-----------------------------------");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
