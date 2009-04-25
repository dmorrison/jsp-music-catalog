<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="org.*" %>

<%
Repository repo = new Repository(application.getRealPath("music.sqlite"));
%>

<h1>Catalog Overview</h1>

<% for (Artist artist : repo.getArtists()) { %>
    <h2><%= artist.getFirstName() + " " + artist.getLastName() %></h2>
    <% for (Album album : repo.getArtistAlbums(artist.getId())) { %>
        <h3>
            <a href="master.jsp?pageName=details.jsp&detailsType=album&albumId=<%= album.getId() %>">
                <%= album.getName() %>
            </a>
        </h3>
        <ol>
            <% for (Song song : repo.getAlbumSongs(album.getId())) { %>
                <li><%= song.getName() %></li>
            <% } %>
        </ol>
    <% } %>
<% } %>