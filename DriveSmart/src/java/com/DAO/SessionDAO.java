package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Model.SessionBean;

public class SessionDAO {

    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost:3306/drivesmart_db";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_SESSION_SQL =
            "INSERT INTO Training_Sessions (student_name, branch_location, lesson_type, status) VALUES (?, ?, ?, ?)";
    private static final String SELECT_ALL_SESSIONS_SQL =
            "SELECT * FROM Training_Sessions ORDER BY branch_location ASC";

    public SessionDAO() {
    }

    protected Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(
                    jdbcURL,
                    jdbcUsername,
                    jdbcPassword
            );
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC driver not found. Check mysql-connector-j in WEB-INF/lib.", e);
        }
    }

    public void bookSession(SessionBean session) throws SQLException {
        System.out.println(INSERT_SESSION_SQL);
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SESSION_SQL)) {

            preparedStatement.setString(1, session.getStudent_name());
            preparedStatement.setString(2, session.getBranch_location());
            preparedStatement.setString(3, session.getLesson_type());
            preparedStatement.setString(4, session.getStatus()); // Default: "Booked"

            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    // Method to retrieve all sessions ordered by branch_location (5 Marks)
    public List<SessionBean> getAllSessions() throws SQLException {
        List<SessionBean> sessions = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SESSIONS_SQL)) {

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int sessionId = rs.getInt("session_id");
                String studentName = rs.getString("student_name");
                String branchLocation = rs.getString("branch_location");
                String lessonType = rs.getString("lesson_type");
                String status = rs.getString("status");

                sessions.add(new SessionBean(sessionId, studentName, branchLocation, lessonType, status));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return sessions;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
            }
        }
    }
}
