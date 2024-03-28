package com.reyhan.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomePageController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getIndexPage() {
        return "HomePage";
    }

    @RequestMapping(value = "/library", method = RequestMethod.GET)
    public String getLibraryPage() {return "GameLibrary"; }

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String getTestPage() {return "TwoPage";}
}