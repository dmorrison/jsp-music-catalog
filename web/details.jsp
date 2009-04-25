<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="org.*" %>

<%
Repository repo = new Repository(application.getRealPath("music.sqlite"));

String detailsType = request.getParameter("detailsType");
String artistId = request.getParameter("artistId");
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
        <td><%= artist.getFirstName() + " " + artist.getLastName() %></td>
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