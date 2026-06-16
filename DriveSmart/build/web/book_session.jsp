<%-- 
    Document   : book_session
    Created on : 16 Jun 2026, 2:59:09 PM
    Author     : MP3 LECT
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DriveSmart - Book a Session</title>
        <link rel="stylesheet" type="text/css" href="style.css">  
    </head>
    <body>
        <%@ include file="header.html" %>
        <h1>Book a Driving Session</h1>

        <!-- Display error message if present -->
        <% if (request.getAttribute("errorMessage") != null) { %>
            <p style="color:red;"><%= request.getAttribute("errorMessage") %></p>
        <% } %>

        <!-- Booking Form -->
        <form action="BookSessionServlet" method="POST">
            <table>
                <tr>
                    <td><label for="student_name">Student Name:</label></td>
                    <td><input type="text" id="student_name" name="student_name" 
                               placeholder="e.g. Ali" required></td>
                </tr>
                <tr>
                    <td><label for="branch_location">Branch Location:</label></td>
                    <td>
                        <!-- Changed from select to text input -->
                        <input type="text" id="branch_location" name="branch_location" 
                               placeholder="e.g. Kuala Lumpur, Penang, Johor" required>
                    </td>
                </tr>
                <tr>
                    <td><label for="lesson_type">Lesson Type:</label></td>
                    <td>
                        <select id="lesson_type" name="lesson_type" required>
                            <option value="">-- Select Lesson Type --</option>
                            <option value="Manual Car">Manual Car</option>
                            <option value="Automatic Car">Automatic Car</option>
                            <option value="Motorcycle">Motorcycle</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Book Session">
                    </td>
                </tr>
            </table>
        </form>

        <br>
        <a href="index.jsp">Back to Home</a>
        <%@ include file="footer.jsp" %>
    </body>
</html>