package com.school.exam.service.account;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * Created by baiqunwei on 16/3/21.
 */
public class UsernamePasswordClassNameToken extends UsernamePasswordToken{
    public UsernamePasswordClassNameToken(String className) {
        this.className = className;
    }

    public UsernamePasswordClassNameToken(String username, char[] password, String className) {
        super(username, password);
        this.className = className;
    }

    public UsernamePasswordClassNameToken(String username, String password, String className) {
        super(username, password);
        this.className = className;
    }

    public UsernamePasswordClassNameToken(String username, char[] password, String host, String className) {
        super(username, password, host);
        this.className = className;
    }

    public UsernamePasswordClassNameToken(String username, String password, String host, String className) {
        super(username, password, host);
        this.className = className;
    }

    public UsernamePasswordClassNameToken(String username, char[] password, boolean rememberMe, String className) {
        super(username, password, rememberMe);
        this.className = className;
    }

    public UsernamePasswordClassNameToken(String username, String password, boolean rememberMe, String className) {
        super(username, password, rememberMe);
        this.className = className;
    }

    public UsernamePasswordClassNameToken(String username, char[] password, boolean rememberMe, String host, String className) {
        super(username, password, rememberMe, host);
        this.className = className;
    }

    public UsernamePasswordClassNameToken(String username, String password, boolean rememberMe, String host, String className) {
        super(username, password, rememberMe, host);
        this.className = className;
    }

    private String className;

    public UsernamePasswordClassNameToken(UsernamePasswordToken authenticationToken, String className) {
        this.setHost(authenticationToken.getHost());
        this.setPassword(authenticationToken.getPassword());
        this.setUsername(authenticationToken.getUsername());
        this.setClassName(className);
        this.setRememberMe(authenticationToken.isRememberMe());
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }
}
