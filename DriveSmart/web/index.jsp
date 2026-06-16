<%-- 
    Document   : index
    Created on : 16 Jun 2026, 3:02:38 PM
    Author     : MP3 LECT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DriveSmart Home</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <!-- Include static header -->
        <%@ include file="header.html" %>

        <!-- Navigation menu -->
        <h2>Central Navigation Menu</h2>
        <nav>
            <ul>
                <li><a href="book_session.jsp">📅 Book a Training Session</a></li>
                <li><a href="ScheduleServlet">📋 View Centralized Schedule</a></li>
            </ul>
        </nav>

        <!-- Include dynamic footer -->
        <%@ include file="footer.jsp" %>
    </body>
</html>