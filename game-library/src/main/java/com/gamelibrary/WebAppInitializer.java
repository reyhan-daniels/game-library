package com.gamelibrary;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class WebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return null;
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[]{WebAppConfig.class};
    }


    public static void main(String[] args) {
    }

    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }
}