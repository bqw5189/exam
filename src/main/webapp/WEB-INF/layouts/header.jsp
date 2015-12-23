<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!-- main header -->
<header id="header_main">
    <div class="header_main_content">
        <nav class="uk-navbar">
            <!-- main sidebar switch -->
            <a href="#" id="sidebar_main_toggle" class="sSwitch sSwitch_left"> <span class="sSwitchIcon"></span> </a>
            <div class="uk-navbar-flip">
                <ul class="uk-navbar-nav user_actions">

                    <li data-uk-dropdown="{mode:'click'}"> <a href="#" class="user_action_image"><img class="md-user-image" src="${ctx}/static/altair/assets/img/avatars/user@2x.png" alt="" /></a>
                        <div class="uk-dropdown uk-dropdown-small uk-dropdown-flip">
                            <ul class="uk-nav js-uk-prevent">
                                <li><a href="${ctx}/student">首页</a></li>
                                <li><a href="${ctx}/profile">修改密码</a></li>
                                <li><a href="${ctx}/logout">退出</a></li>
                            </ul>
                        </div> </li>
                </ul>
            </div>
        </nav>
    </div>
</header>
<!-- main header end -->