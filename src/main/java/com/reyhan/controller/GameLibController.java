package com.reyhan.controller;

import java.util.List;

import com.reyhan.model.Game;
import com.reyhan.service.GameLibService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;


@RestController
public class GameLibController {

    @Autowired
    GameLibService gameLibService;  //Service which will do all data retrieval/manipulation work



    @RequestMapping(value = "/game/", method = RequestMethod.GET)
    public ResponseEntity<List<Game>> showLibrary() {
        List<Game> games = gameLibService.findAllGames();
        if(games.isEmpty()){
            return new ResponseEntity<List<Game>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
        }
        return new ResponseEntity<List<Game>>(games, HttpStatus.OK);
    }




    @RequestMapping(value = "/game/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Game> getGame(@PathVariable("id") long id) {
        System.out.println("Retrieving Game with id " + id);
        Game game = gameLibService.findById(id);
        if (game == null) {
            System.out.println("Game with id " + id + " not found");
            return new ResponseEntity<Game>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Game>(game, HttpStatus.OK);
    }




    @RequestMapping(value = "/game/", method = RequestMethod.POST)
    public ResponseEntity<Void> addGame(@RequestBody Game game, UriComponentsBuilder ucBuilder) {
        System.out.println("Adding Game " + game.getTitle());

        if (gameLibService.doesGameExist(game)) {
            System.out.println("The following game: " + game.getTitle() + " is already in this library.");
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }

        gameLibService.addGame(game);

        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/game/{id}").buildAndExpand(game.getId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }




    @RequestMapping(value = "/game/{id}", method = RequestMethod.PUT)
    public ResponseEntity<Game> updateGame(@PathVariable("id") long id, @RequestBody Game game) {
        System.out.println("Updating Game: " + id);

        Game currentGame = gameLibService.findById(id);

        if (currentGame ==null) {
            System.out.println("The game with id " + id + " can not be found");
            return new ResponseEntity<Game>(HttpStatus.NOT_FOUND);
        }

        currentGame.setTitle(game.getTitle());
        currentGame.setYear(game.getYear());
        currentGame.setRating(game.getRating());

        gameLibService.updateGame(currentGame);
        return new ResponseEntity<Game>(currentGame, HttpStatus.OK);
    }




    @RequestMapping(value = "/game/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Game> deleteGame(@PathVariable("id") long id) {
        System.out.println("Retrieving Game with id " + id);

        Game game = gameLibService.findById(id);
        if (game == null) {
            System.out.println("Unable to delete. Game with id " + id + " not found");
            return new ResponseEntity<Game>(HttpStatus.NOT_FOUND);
        }

        gameLibService.deleteGameById(id);
        return new ResponseEntity<Game>(HttpStatus.NO_CONTENT);
    }




    @RequestMapping(value = "/game/", method = RequestMethod.DELETE)
    public ResponseEntity<Game> deleteAllGames() {
        System.out.println("Deleting All Games");

        gameLibService.deleteAllGames();
        return new ResponseEntity<Game>(HttpStatus.NO_CONTENT);
    }

}