<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="org.*" %>

<%
String searchTerms = (String)session.getAttribute("searchTerms");
session.removeAttribute("searchTerms");

List<Artist> artists = (List<Artist>)session.getAttribute("artistSearchResults");
List<Album> albums = (List<Album>)session.getAttribute("albumSearchResults");
List<Song> songs = (List<Song>)session.getAttribute("songSearchResults");

session.removeAttribute("artistSearchResults");
session.removeAttribute("albumSearchResults");
session.removeAttribute("songSearchResults");
%>

<p>Search Results for "<%= searchTerms %>"</p>

<h2>Artists</h2>
<% for (Artist artist : artists) { %>
<h3>
    <a href="master.jsp?pageName=details.jsp&detailsType=artist&artistId=<%= artist.getId() %>">
        <%= artist.getFirstName() + " " + artist.getLastName() %>
    </a>
</h3>
<% } %>
<% if (artists.isEmpty()) { %>
<p>No artists found</p>
<% } %>

<h2>Albums</h2>
<% for (Album album : albums) { %>
<h3>
    <a href="master.jsp?pageName=details.jsp&detailsType=album&albumId=<%= album.getId() %>">
        <%= album.getName() %>
    </a>
</h3>
<% } %>
<% if (albums.isEmpty()) { %>
<p>No albums found</p>
<% } %>

<h2>Songs</h2>
<% for (Song song : songs) { %>
<h3>
    <a href="master.jsp?pageName=details.jsp&detailsType=album&albumId=<%= song.getAlbumId() %>">
        <%= song.getName() %>
    </a>
</h3>
<% } %>
<% if (songs.isEmpty()) { %>
<p>No songs found</p>
<% } %>