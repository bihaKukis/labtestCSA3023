<%-- 
    Document   : error
    Created on : 16 Jun 2026, 3:07:32 PM
    Author     : MP3 LECT
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>DriveSmart – Error</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <center>
        <h1>Oops! Something went wrong.</h1>
        <h2><%= exception.getMessage() %></h2>
        <br/>
        <a href="index.jsp">Return to Home</a>
    </center>
</body>
</html>