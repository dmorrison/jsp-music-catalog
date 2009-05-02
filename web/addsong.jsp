<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="org.*" %>

<%
Repository repo = new Repository(application.getRealPath("music.sqlite"));
%>

<h1>Add Song</h1>

<form action="catalogmanager" method="post">
    <table>
        <tr>
            <td>
                Album:
            </td>
            <td>
                <select id="album" name="album">
                    <% for (Album album : repo.getAlbums()) { %>
                    <% Artist artist = repo.getArtist(album.getArtistId()); %>
                    <option value="<%= album.getId() %>">
                        <%= album.getName() %> - <%= artist.getFirstName() %> <%= artist.getLastName() %>
                    </option>
                    <% } %>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                Name:
            </td>
            <td>
                <input type="text" id="name" name="name" >
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
                <input type="submit" id="addSong" name="addSong" value="Add Song" />
            </td>
        </tr>
    </table>
</form>