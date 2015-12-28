<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<!--[if lte IE 9]> <html class="lte-ie9" lang="en"> <![endif]-->
<!--[if gt IE 9]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Remove Tap Highlight on Windows Phone IE -->
    <meta name="msapplication-tap-highlight" content="no" />
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <meta http-equiv="Cache-Control" content="no-store" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <title>在线考试系统:<sitemesh:title/></title>

    <link rel="icon" type="image/png" href="${ctx}/static/altair/assets/img/favicon-16x16.png" sizes="16x16" />
    <link rel="icon" type="image/png" href="${ctx}/static/altair/assets/img/favicon-32x32.png" sizes="32x32" />

    <!-- additional styles for plugins -->
    <!-- weather icons -->
    <link rel="stylesheet" href="${ctx}/static/altair/bower_components/weather-icons/css/weather-icons.min.css" media="all" />
    <!-- metrics graphics (charts) -->
    <link rel="stylesheet" href="${ctx}/static/altair/bower_components/metrics-graphics/dist/metricsgraphics.css" />
    <!-- chartist -->
    <link rel="stylesheet" href="${ctx}/static/altair/bower_components/chartist/dist/chartist.min.css" />
    <!-- uikit -->
    <link rel="stylesheet" href="${ctx}/static/altair/bower_components/uikit/css/uikit.almost-flat.min.css" media="all" />
    <!-- flag icons -->
    <link rel="stylesheet" href="${ctx}/static/altair/assets/icons/flags/flags.min.css" media="all" />
    <!-- altair admin -->
    <link rel="stylesheet" href="${ctx}/static/altair/assets/css/main.min.css" media="all" />
    <!-- matchMedia polyfill for testing media queries in JS -->
    <!--[if lte IE 9]>
    <script type="text/javascript" src="${ctx}/static/altair/bower_components/matchMedia/matchMedia.js"></script>
    <script type="text/javascript" src="${ctx}/static/altair/bower_components/matchMedia/matchMedia.addListener.js"></script>
    <![endif]-->



    <sitemesh:head/>
</head>

<body class="sidebar_main_open sidebar_main_swipe">

<%@ include file="/WEB-INF/layouts/header.jsp"%>
<%@ include file="/WEB-INF/layouts/left.jsp"%>



<!-- common functions -->
<script src="${ctx}/static/altair/assets/js/common.min.js"></script>
<!-- uikit functions -->
<script src="${ctx}/static/altair/assets/js/uikit_custom.min.js"></script>
<!-- altair common functions/helpers -->
<script src="${ctx}/static/altair/assets/js/altair_admin_common.min.js"></script>
<!-- page specific plugins -->
<!-- d3 -->
<script src="${ctx}/static/altair/bower_components/d3/d3.min.js"></script>
<!-- metrics graphics (charts) -->
<script src="${ctx}/static/altair/bower_components/metrics-graphics/dist/metricsgraphics.min.js"></script>
<!-- chartist (charts) -->
<script src="${ctx}/static/altair/bower_components/chartist/dist/chartist.min.js"></script>
<!-- maplace (google maps) -->
<%--<script src="http://maps.google.com/maps/api/js?sensor=true"></script>--%>
<%--<script src="${ctx}/static/altair/bower_components/maplace.js/src/maplace-0.1.3.js"></script>--%>
<!-- peity (small charts) -->
<script src="${ctx}/static/altair/bower_components/peity/jquery.peity.min.js"></script>
<!-- easy-pie-chart (circular statistics) -->
<script src="${ctx}/static/altair/bower_components/jquery.easy-pie-chart/dist/jquery.easypiechart.min.js"></script>
<!-- countUp -->
<script src="${ctx}/static/altair/bower_components/countUp.js/countUp.min.js"></script>
<!-- handlebars.js -->
<script src="${ctx}/static/altair/bower_components/handlebars/handlebars.min.js"></script>
<script src="${ctx}/static/altair/assets/js/custom/handlebars_helpers.min.js"></script>
<!-- CLNDR -->
<script src="${ctx}/static/altair/bower_components/clndr/src/clndr.js"></script>
<!-- fitvids -->
<script src="${ctx}/static/altair/bower_components/fitvids/jquery.fitvids.js"></script>

<!-- page specific plugins -->
<!-- kendo UI -->
<script src="${ctx}/static/altair/assets/js/kendoui_custom.min.js"></script>
<!--  kendoui functions -->
<script src="${ctx}/static/altair/assets/js/pages/kendoui.min.js"></script>


<!-- datatables -->
<script src="${ctx}/static/altair/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<!-- datatables colVis-->
<script src="${ctx}/static/altair/bower_components/datatables-colvis/js/dataTables.colVis.js"></script>
<!-- datatables tableTools-->
<script src="${ctx}/static/altair/bower_components/datatables-tabletools/js/dataTables.tableTools.js"></script>
<!-- datatables custom integration -->
<script src="${ctx}/static/altair/assets/js/custom/datatables_uikit.min.js"></script>
<!--  datatables functions -->
<script src="${ctx}/static/altair/assets/js/pages/plugins_datatables.min.js"></script>


<script>
    // load parsley config (altair_admin_common.js)
    altair_forms.parsley_validation_config();
</script>

<script src="${ctx}/static/altair/bower_components/parsleyjs/dist/parsley.min.js"></script>
<!-- inputmask-->
<script src="${ctx}/static/altair/bower_components/jquery.inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>

<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap.min.js" type="text/javascript"></script>
<%--<script src="${ctx}/static/jquery-validation/1.11.1/messages_bs_zh.js" type="text/javascript"></script>--%>
<script src="${ctx}/static/js/template.js" type="text/javascript"></script>
<div id="page_content">
    <div id="page_content_inner">
        <sitemesh:body/>
    </div>

</div>

</body>
</html>