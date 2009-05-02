<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="org.*" %>

<%
Repository repo = new Repository(application.getRealPath("music.sqlite"));
%>

<h1>Add Album</h1>

<form action="catalogmanager" method="post">
    <table>
        <tr>
            <td>
                Artist:
            </td>
            <td>
                <select id="artist" name="artist">
                    <% for (Artist a : repo.getArtists()) { %>
                    <option value="<%= a.getId() %>">
                        <%= a.getFirstName() %> <%= a.getLastName() %>
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
            <td>
                Genre:
            </td>
            <td>
                <input type="text" id="genre" name="genre" >
            </td>
        </tr>
        <tr>
            <td>
                Year:
            </td>
            <td>
                <input type="text" id="year" name="year" >
            </td>
        </tr>
        <tr>
            <td>
                Price:
            </td>
            <td>
                <input type="text" id="price" name="price" >
            </td>
        </tr>
        <tr>
            <td>
                Available?:
            </td>
            <td>
                <select id="isAvailable" name="isAvailable">
                    <option value="1">Yes</option>
                    <option value="0">No</option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
                <input type="submit" id="addAlbum" name="addAlbum" value="Add Album" />
            </td>
        </tr>
    </table>
</form>