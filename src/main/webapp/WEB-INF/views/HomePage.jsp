<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>AngularJS $http Example</title>
    <style>
      .title.ng-valid {
          background-color: lightgreen;
      }
      .title.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .title.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      }

      .year.ng-valid {
          background-color: lightgreen;
      }
      .year.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .year.ng-dirty.ng-invalid-email {
          background-color: yellow;
      }

    </style>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
     <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
  </head>
  <body ng-app="myApp" class="ng-cloak">
      <div class="generic-container" ng-controller="GameLibController as ctrl">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Game Information </span></div>
              <div class="formcontainer">
                  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                      <input type="hidden" ng-model="ctrl.game.id" />
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="uname">Name</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.game.title" id="title" class="title form-control input-sm" placeholder="Enter Game Title" required ng-minlength="3"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.title.$error.required">This is a required field</span>
                                      <span ng-show="myForm.title.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.title.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>


                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="address">Year</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.game.year" id="year" class="form-control input-sm" placeholder="Enter the game's release year. [This field is validation free]"/>
                              </div>
                          </div>
                      </div>

                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="rating">Rating</label>
                              <div class="col-md-7">
                                  <input type="rating" ng-model="ctrl.game.rating" id="rating" class="rating form-control input-sm" placeholder="Enter your Rating for this game" required/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.rating.$error.required">This is a required field</span>
                                      <span ng-show="myForm.rating.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>

                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.game.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
                          </div>
                      </div>
                  </form>
              </div>
          </div>
          <div class="panel panel-default">
                <!-- Default panel contents -->
              <div class="panel-heading"><span class="lead">Game Library List: </span></div>
              <div class="tablecontainer">
                  <table class="table table-hover">
                      <thead>
                          <tr>
                              <th>ID.</th>
                              <th>Title</th>
                              <th>Year</th>
                              <th>Rating</th>
                              <th width="20%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="g in ctrl.games">
                              <td><span ng-bind="g.id"></span></td>
                              <td><span ng-bind="g.title"></span></td>
                              <td><span ng-bind="g.year"></span></td>
                              <td><span ng-bind="g.rating"></span></td>
                              <td>
                              <button type="button" ng-click="ctrl.edit(g.id)" class="btn btn-success custom-width">Edit</button>  <button type="button" ng-click="ctrl.remove(g.id)" class="btn btn-danger custom-width">Remove</button>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
      </div>

      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
      <script src="<c:url value='/static/js/app.js' />"></script>
      <script src="<c:url value='/static/js/service/gamelib_service.js' />"></script>
      <script src="<c:url value='/static/js/controller/gamelib_controller.js' />"></script>
  </body>
</html>