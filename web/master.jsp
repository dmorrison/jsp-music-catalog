<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>

<%
String status = "";
if (session.getAttribute("status") != null) {
    status = session.getAttribute("status").toString();
    session.removeAttribute("status");
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>XYZ Entertainment</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <link href="images/favicon.ico" rel="shortcut icon" />
</head>
<body>
<div id="container">
    <!-- header -->
    <div id="logo"><a href="index.jsp">XYZ Entertainment</a></div>
    <div id="menu">
        <a href="master.jsp?pageName=addartist.jsp">Add Artist</a> |
        <a href="master.jsp?pageName=addalbum.jsp">Add Album</a> |
        <a href="master.jsp?pageName=addsong.jsp">Add Song</a> |
        <span id="status"><%= status %></span> <br />
        <form name="search-form" action="search" method="post">
            <input type="text" id="search-terms" name="search-terms" />
            <input type="submit" value="Search" id="search-button"
                name="search-button" />
        </form>
    </div>
    <!--end header -->

    <!-- main -->
    <div id="main">
        <!--<div id="sidebar">
            <ul>
                <li><a href="#">sidebar link 1</a></li>
                <li><a href="#">sidebar link 2</a></li>
                <li><a href="#">sidebar link 3</a></li>
                <li><a href="#">sidebar link 4</a></li>
                <li><a href="#">sidebar link 5</a></li>
            </ul>
        </div>-->
        <div id="text">
            <jsp:include page='<%= request.getParameter("pageName") %>' />
        </div>
    </div>
    <!-- end main -->

    <!-- footer -->
    <div id="footer">
        <div id="menu_footer">
            Built for COMP 6006 @ Auburn University
        </div>
        <div id="left_footer">
            &copy; Copyright <%= new GregorianCalendar().get(Calendar.YEAR) %>
            <strong>Derek Morrison</strong>
        </div>
        <div id="right_footer">
            Design by
            <a href="http://www.realitysoftware.ca" title="Web Design">
                <strong>Reality Software</strong>
            </a> &amp;
            <a href="http://www.flashmp3player.org" title="Free Flash MP3 Player">
                <strong>Flash Music Player</strong>
            </a>
        </div>
    </div>
    <!-- end footer -->
</div>
</body>
</html>