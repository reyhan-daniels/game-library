'use strict';
 
angular.module('myApp').factory('GameLibService', ['$http', '$q', function($http, $q){
 
    var REST_SERVICE_URI = 'http://localhost:8080/game/';
 
    var factory = {
        fetchAllGames: fetchAllGames,
        addGame: addGame,
        updateGame: updateGame,
        deleteGame: deleteGame
    };
 
    return factory;
 
    function fetchAllGames() {
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while retrieving Game Library');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
 
    function addGame(game) {
        var deferred = $q.defer();
        $http.post(REST_SERVICE_URI, game)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error adding this game to Library');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
 
 
    function updateGame(game, id) {
        var deferred = $q.defer();
        $http.put(REST_SERVICE_URI+id, game)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while editing game information');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
 
    function deleteGame(id) {
        var deferred = $q.defer();
        $http.delete(REST_SERVICE_URI+id)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while deleting game');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
 
}]);