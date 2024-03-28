<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><html>
<head>
    <meta charset="UTF-8">
    <title>Game Library</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    <style>
        body {
            background-color: #f8f8f8;
            background: linear-gradient(to right, #7991b3, #cccccc);
            padding-top: 50px
        }
        .container {
            max-width: 600px;
            margin: auto;
            text-align: center;
        }
        h1 {
            font-size: 36px;
            margin-bottom: 20px;
        }
        p {
            font-size: 18px;
            margin-bottom: 20px;
        }
        a.btn {
            font-size: 18px;
            background-color: #10376e;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>GAME LIBRARY</h1>
        <h3>NJO Project by Reyhan Daniels</h3>
        <a href="<c:url value='/library' />" class="btn btn-primary btn-log">GO TO LIBRARY</a>
    </div>
</body>
