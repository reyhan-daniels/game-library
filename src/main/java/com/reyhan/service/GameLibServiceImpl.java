package com.reyhan.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

import com.reyhan.model.Game;
import org.springframework.stereotype.Service;


@Service("gameLibService")
public class GameLibServiceImpl implements GameLibService {

    private static final AtomicLong counter = new AtomicLong();

    private static List<Game> games = new ArrayList<Game>();

    /*static {
        games = populateExampleGames();
    }
*/
    private static List<Game> populateExampleGames() {
        List<Game> games = new ArrayList<Game>();
        games.add(new Game(counter.incrementAndGet(), "Pokemon Yellow", "1999", "10"));
        games.add(new Game(counter.incrementAndGet(), "Goldeneye 007", "1997", "9.5"));
        games.add(new Game(counter.incrementAndGet(), "Tetris", "1985", "10"));
        return games;
    }

    public List<Game> findAllGames() {
        return games;
    }

    public Game findById(long id) {
        for(Game game : games){
            if(game.getId() == id){
                return game;
            }
        }
        return null;
    }

    public Game findByName(String name) {
        for(Game game : games){
            if(game.getTitle().equalsIgnoreCase(name)){
                return game;
            }
        }
        return null;
    }

    public void addGame(Game game) {
        game.setId(counter.incrementAndGet());
        games.add(game);
    }

    public void updateGame(Game game) {
        int index = games.indexOf(game);
        games.set(index, game);
    }

    public void deleteGameById(long id) {

        for (Iterator<Game> iterator = games.iterator(); iterator.hasNext(); ) {
            Game game = iterator.next();
            if (game.getId() == id) {
                iterator.remove();
            }
        }
    }

    public boolean doesGameExist(Game game) {
        return findByName(game.getTitle())!=null;
    }

    public void deleteAllGames(){
        games.clear();
    }



}
