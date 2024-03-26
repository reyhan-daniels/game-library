package com.reyhan.service;
import java.util.List;

import com.reyhan.model.Game;



public interface GameLibService {

    Game findById(long id);

    Game findByName(String name);

    void addGame(Game game);

    void updateGame(Game game);

    void deleteGameById(long id);

    List<Game> findAllGames();

    void deleteAllGames();

    public boolean doesGameExist(Game game);

}
