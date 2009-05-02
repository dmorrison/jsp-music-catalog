<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="org.*" %>

<h1>Add Artist</h1>

<form action="catalogmanager" method="post">
    <table>
        <tr>
            <td>
                First Name:
            </td>
            <td>
                <input type="text" id="firstName" name="firstName" >
            </td>
        </tr>
        <tr>
            <td>
                Last Name:
            </td>
            <td>
                <input type="text" id="lastName" name="lastName" >
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
                <input type="submit" id="addArtist" name="addArtist" value="Add Artist" />
            </td>
        </tr>
    </table>
</form>