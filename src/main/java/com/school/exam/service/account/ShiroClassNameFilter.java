package com.school.exam.service.account;

import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * Created by baiqunwei on 16/3/21.
 */
public class ShiroClassNameFilter extends FormAuthenticationFilter {
    @Override
    protected AuthenticationToken createToken(String username, String password, boolean rememberMe, String host) {
        return super.createToken(username, password, rememberMe, host);
    }

    @Override
    protected AuthenticationToken createToken(String username, String password, ServletRequest request, ServletResponse response) {
        UsernamePasswordToken authenticationToken = (UsernamePasswordToken)super.createToken(username, password, request, response);

        UsernamePasswordClassNameToken usernamePasswordClassNameToken = new UsernamePasswordClassNameToken(authenticationToken, WebUtils.getCleanParam(request, "className"));

        return usernamePasswordClassNameToken;
    }
}
