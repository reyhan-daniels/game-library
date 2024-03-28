<page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Game Library</title>
    <style>
        body {
            background-color: #f8f8f8;
            background: linear-gradient(to right, #f0f2f5, #cccccc);
            font-family: Arial, sans-serif;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #81abde;
        }
        tr {
            background-color: #b6c2d1;
        }
        .btn {
            background-color: #10376e;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }
        .btn:hover {
            background-color: #92ade0;
        }
        form-container {
            border-radius: 5px;
            background-color: #f2f2f2;
            padding: 20px;
            width: 50%;
            margin: auto;
        }
        input[type=text], input[type=number] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        input[type=submit] {
            width: 100%;
            background-color: #10376e;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type=submit]:hover {
            background-color: #92ade0;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
    <script src="/static/js/app.js"></script>
    <script src="/static/js/service/gamelib_service.js"></script>
    <script src="/static/js/controller/gamelib_controller.js"></script>

</head>
<body ng-app="myApp" ng-controller="GameLibController as ctrl">
    <h2>Game Library</h2>
    <div class="form-container">
        <form name="myForm" ng-submit="ctrl.submit()">
            <input type="hidden" ng-model="ctrl.game.id">
            <label for="title">Title:</label>
            <input type="text" ng-model="ctrl.game.title" required><br>
            <label for="year">Year:</label>
            <input type="text" ng-model="ctrl.game.year"><br>
            <label for="rating">Rating:</label>
            <input type="text" ng-model="ctrl.game.rating" required><br>
            <input type="submit" ng-value="ctrl.game.id ? 'Edit Game' : 'Add Game'">
            <input type="button" value="Reset" ng-click="ctrl.reset()">
        </form>
    </div>
    <table>
        <tr>
            <th>Title</th>
            <th>Year</th>
            <th>Rating</th>
        </tr>
        <tr ng-repeat="game in ctrl.games">
            <td ng-bind="game.title"></td>
            <td ng-bind="game.year"></td>
            <td ng-bind="game.rating"></td>
            <td>
                <button class="btn" ng-click="ctrl.edit(game.id)">Edit</button>
                <button class="btn" ng-click="ctrl.remove(game.id)">Delete</button>
            </td>
        </tr>
    </table>

</body>
</html>