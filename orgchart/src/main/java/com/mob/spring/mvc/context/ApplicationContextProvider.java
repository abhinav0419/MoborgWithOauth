package com.mob.spring.mvc.context;


import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class ApplicationContextProvider implements ApplicationContextAware {
    private static ApplicationContext context = null;

    public static ApplicationContext getApplicationContext() {
        return context;
    }
    @Autowired
    public void setApplicationContext(ApplicationContext ctx) throws BeansException {
        context = ctx;
    }
}