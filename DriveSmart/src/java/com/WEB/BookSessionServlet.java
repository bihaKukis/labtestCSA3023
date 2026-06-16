package com.WEB;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.SessionDAO;
import com.Model.SessionBean;

/**
 * Servlet implementation for booking a new training session.
 * Handles POST request from book_session.jsp and redirects to ScheduleServlet.
 */
@WebServlet("/BookSessionServlet")
public class BookSessionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SessionDAO sessionDAO;

    @Override
    public void init() throws ServletException {
        // Initialize DAO
        sessionDAO = new SessionDAO();
    }

    /**
     * Handles the HTTP POST request to book a session.
     * Retrieves form parameters, creates SessionBean with default status "Booked",
     * saves it via DAO, and redirects to ScheduleServlet.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve form parameters
        String studentName = request.getParameter("student_name");
        String branchLocation = request.getParameter("branch_location");
        String lessonType = request.getParameter("lesson_type");

        // Create SessionBean with default status "Booked"
        SessionBean session = new SessionBean();
        session.setStudent_name(studentName);
        session.setBranch_location(branchLocation);
        session.setLesson_type(lessonType);
        session.setStatus("Booked");

        try {
            // Save booking to database
            sessionDAO.bookSession(session);
            // Redirect to ScheduleServlet to view the updated schedule
            response.sendRedirect("ScheduleServlet");
        } catch (SQLException e) {
            // Log error and forward to error page or rethrow
            e.printStackTrace();
            // Optionally send error message to the user
            request.setAttribute("errorMessage", "Booking failed: " + e.getMessage());
            request.getRequestDispatcher("book_session.jsp").forward(request, response);
        }
    }
}