<%-- 
    Document   : schedule
    Created on : 16 Jun 2026, 2:59:47 PM
    Author     : MP3 LECT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DriveSmart – Centralized Schedule</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <style>
            table { width:100%; border-collapse: collapse; margin-top:20px; }
            th, td { border:1px solid #ddd; padding:8px; text-align:left; }
            th { background-color:#f2f2f2; }
            tr:nth-child(even) { background-color:#f9f9f9; }
        </style>
    </head>
    <body>
        <%@ include file="header.html" %>
        <h2>Centralized Training Schedule</h2>

        <c:choose>
            <c:when test="${not empty sessionList}">
                <table>
                    <thead>
                        <tr>
                            <th>Session ID</th>
                            <th>Student Name</th>
                            <th>Branch Location</th>
                            <th>Lesson Type</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="session" items="${sessionList}">
                            <tr>
                                <td><c:out value="${session.session_id}" /></td>
                                <td><c:out value="${session.student_name}" /></td>
                                <td><c:out value="${session.branch_location}" /></td>
                                <td><c:out value="${session.lesson_type}" /></td>
                                <td><c:out value="${session.status}" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <p>No training sessions found.</p>
            </c:otherwise>
        </c:choose>

        <br>
        <a href="index.jsp">Back to Home</a>
        <%@ include file="footer.jsp" %>
    </body>
</html>