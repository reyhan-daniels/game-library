'use strict';
 
angular.module('myApp').controller('GameLibController', ['$scope', 'GameLibService', function($scope, GameLibService) {
    var self = this;
    self.game={id:null,title:'',year:'',rating:''};
    self.games=[];
 
    self.submit = submit;
    self.edit = edit;
    self.remove = remove;
    self.reset = reset;
 
 
    fetchAllGames();
 
    function fetchAllGames(){
        GameLibService.fetchAllGames()
            .then(
            function(d) {
                self.games = d;
            },
            function(errResponse){
                console.error('Error while retrieving Game Library');
            }
        );
    }
 
    function addGame(game){
        GameLibService.addGame(game)
            .then(
            fetchAllGames,
            function(errResponse){
                console.error('Error while adding Game');
            }
        );
    }
 
    function updateGame(game, id){
        GameLibService.updateGame(game, id)
            .then(
            fetchAllGames,
            function(errResponse){
                console.error('Error while updating Game');
            }
        );
    }
 
    function deleteGame(id){
        GameLibService.deleteGame(id)
            .then(
            fetchAllGames,
            function(errResponse){
                console.error('Error while deleting Game');
            }
        );
    }
 
    function submit() {
        if(self.game.id===null){
            console.log('Adding New Game', self.game);
            addGame(self.game);
        }else{
            updateGame(self.game, self.game.id);
            console.log('Game updated with id ', self.game.id);
        }
        reset();
    }
 
    function edit(id){
        console.log('id to be edited', id);
        for(var i = 0; i <= self.games.length; i++){
            if(self.games[i].id === id) {
                self.game = angular.copy(self.games[i]);
                break;
            }
        }
    }
 
    function remove(id){
        console.log('id to be deleted', id);
        if(self.game.id === id) {
            reset();
        }
        deleteGame(id);
    }
 
 
    function reset(){
        self.game={id:null,title:'',year:'',rating:''};
        $scope.myForm.$setPristine();
    }
 
}]);