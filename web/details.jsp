<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.*" %>

<%
Repository repo = new Repository(application.getRealPath("music.sqlite"));

String detailsType = request.getParameter("detailsType");
%>

<%
if (detailsType.equals("album")) {
    int albumId = Integer.parseInt(request.getParameter("albumId"));
    Album album = repo.getAlbum(albumId);
    Artist artist = repo.getArtist(album.getArtistId());
%>
<h2>Album Details</h2>
<table>
    <tr>
        <td>Name</td>
        <td><%= album.getName() %></td>
    </tr>
    <tr>
        <td>Artist</td>
        <td>
            <a href="master.jsp?pageName=details.jsp&detailsType=artist&artistId=<%= artist.getId() %>">
                <%= artist.getFirstName() + " " + artist.getLastName() %>
            </a>
        </td>
    </tr>
    <tr>
        <td>Genre</td>
        <td><%= album.getGenre() %></td>
    </tr>
    <tr>
        <td>Year</td>
        <td><%= album.getYear() %></td>
    </tr>
    <tr>
        <td>Price</td>
        <td>$<%= album.getPrice() %></td>
    </tr>
    <tr>
        <td>Is Available?</td>
        <td><%= album.getIsAvailable() ? "Yes" : "No" %></td>
    </tr>
</table>

<h4>Track Listing</h4>
<ol>
    <% for (Song song : repo.getAlbumSongs(album.getId())) { %>
        <li><%= song.getName() %></li>
    <% } %>
</ol>

<% } %>


<%
if (detailsType.equals("artist")) {
    int artistId = Integer.parseInt(request.getParameter("artistId"));
    Artist artist = repo.getArtist(artistId);
    List<Album> albums = repo.getArtistAlbums(artistId);
%>

<h1>Artist Albums - <%= artist.getFirstName() + " " + artist.getLastName() %></h1>

<% for (Album album : albums) { %>
<h2><%= album.getName() %></h2>
<table>
    <tr>
        <td>Genre</td>
        <td><%= album.getGenre() %></td>
    </tr>
    <tr>
        <td>Year</td>
        <td><%= album.getYear() %></td>
    </tr>
    <tr>
        <td>Price</td>
        <td>$<%= album.getPrice() %></td>
    </tr>
    <tr>
        <td>Is Available?</td>
        <td><%= album.getIsAvailable() ? "Yes" : "No" %></td>
    </tr>
</table>

<h4>Track Listing</h4>
<ol>
    <% for (Song song : repo.getAlbumSongs(album.getId())) { %>
        <li><%= song.getName() %></li>
    <% } %>
</ol>

<% } %>
<% } %>