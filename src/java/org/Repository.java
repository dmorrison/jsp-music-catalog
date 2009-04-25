package org;

import java.sql.*;
import java.text.*;
import java.util.List;
import java.util.Vector;

public class Repository {
    private String dbPath;

    public Repository(String dbPath) {
        this.dbPath = dbPath;
    }

    private Statement getStatement() throws ClassNotFoundException, SQLException {
        Class.forName("org.sqlite.JDBC");
        Connection conn = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
        return conn.createStatement();
    }

    public List<Artist> getArtists() throws ClassNotFoundException, SQLException, ParseException {
        Class.forName("org.sqlite.JDBC");
        Connection conn = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
        Statement stat = conn.createStatement();

        Vector<Artist> artists = new Vector<Artist>();
        ResultSet rs = stat.executeQuery("select * from artists order by lname;");
        while (rs.next()) {
            Artist artist = new Artist();

            artist.setId(Integer.parseInt(rs.getString("id")));
            artist.setFirstName(rs.getString("fname"));
            artist.setLastName(rs.getString("lname"));

            artists.add(artist);
        }
        rs.close();

        conn.close();

        return artists;
    }

    public Artist getArtist(int id) throws ClassNotFoundException, SQLException, ParseException {
        Statement stat = getStatement();

        Artist artist = new Artist();
        ResultSet rs = stat.executeQuery("select * from artists where id=" + id + ";");
        if (rs.next()) {
            artist.setId(Integer.parseInt(rs.getString("id")));
            artist.setFirstName(rs.getString("fname"));
            artist.setLastName(rs.getString("lname"));
        }
        rs.close();
        stat.close();
        stat.getConnection().close();

        return artist;
    }

    public List<Album> getArtistAlbums(int artistId) throws ClassNotFoundException, SQLException, ParseException {
        Class.forName("org.sqlite.JDBC");
        Connection conn = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
        Statement stat = conn.createStatement();

        Vector<Album> albums = new Vector<Album>();
        ResultSet rs = stat.executeQuery(
                "select * from albums " +
                "where artistid=" + artistId + " " +
                "order by name;");
        while (rs.next()) {
            Album album = new Album();

            album.setId(rs.getInt("id"));
            album.setArtistId(rs.getInt("artistid"));
            album.setName(rs.getString("name"));
            album.setGenre(rs.getString("genre"));
            album.setYear(rs.getInt("year"));
            album.setPrice(rs.getFloat("price"));
            album.setIsAvailable(rs.getBoolean("isavailable"));

            albums.add(album);
        }
        rs.close();

        conn.close();

        return albums;
    }

    public Album getAlbum(int albumId) throws ClassNotFoundException, SQLException, ParseException {
        Class.forName("org.sqlite.JDBC");
        Connection conn = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
        Statement stat = conn.createStatement();

        Album album = new Album();
        ResultSet rs = stat.executeQuery(
                "select * from albums " +
                "where id=" + albumId + ";");
        if (rs.next()) {
            album.setId(rs.getInt("id"));
            album.setArtistId(rs.getInt("artistid"));
            album.setName(rs.getString("name"));
            album.setGenre(rs.getString("genre"));
            album.setYear(rs.getInt("year"));
            album.setPrice(rs.getFloat("price"));
            album.setIsAvailable(rs.getBoolean("isavailable"));
        }
        rs.close();

        conn.close();

        return album;
    }

    public List<Song> getAlbumSongs(int albumId) throws ClassNotFoundException, SQLException, ParseException {
        Class.forName("org.sqlite.JDBC");
        Connection conn = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
        Statement stat = conn.createStatement();

        Vector<Song> songs = new Vector<Song>();
        ResultSet rs = stat.executeQuery(
                "select * from songs " +
                "where albumid=" + albumId + ";");
        while (rs.next()) {
            Song song = new Song();

            song.setId(rs.getInt("id"));
            song.setAlbumId(rs.getInt("albumid"));
            song.setName(rs.getString("name"));

            songs.add(song);
        }
        rs.close();

        conn.close();

        return songs;
    }

//    public List<Albums> getArtistAlbums(int artistId) throws ClassNotFoundException, SQLException {
//        User user = new User();
//
//        Class.forName("org.sqlite.JDBC");
//        Connection conn = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
//        Statement stat = conn.createStatement();
//
//        ResultSet rs = stat.executeQuery(
//                "select * from users where username='" + username + "';");
//        rs.next();
//        user.setId(Integer.parseInt(rs.getString("id")));
//        user.setUsername(rs.getString("username"));
//        user.setPassword(rs.getString("password"));
//        rs.close();
//
//        conn.close();
//
//        return user;
//    }

//    public void createUser(String username, String password) throws ClassNotFoundException, SQLException {
//        Class.forName("org.sqlite.JDBC");
//        Connection conn = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
//        Statement stat = conn.createStatement();
//
//        stat.executeUpdate("insert into users " +
//                          "(username, password) values " +
//                          "('" + username + "', '" + password + "');");
//
//        conn.close();
//    }
//
//    public List<Post> getPosts() throws SQLException, ClassNotFoundException, ParseException {
//        Vector<Post> posts = new Vector<Post>();
//
//        Class.forName("org.sqlite.JDBC");
//        Connection conn = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
//        Statement stat = conn.createStatement();
//
//        ResultSet rs = stat.executeQuery(
//                "select *, " +
//                "       (select username from users where rowid=userId) as username " +
//                "from posts " +
//                "order by timestamp desc;");
//        while (rs.next()) {
//            Post post = new Post();
//
//            post.setUsername(rs.getString("username"));
//
//            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
//            Date timestamp = sdf.parse(rs.getString("timestamp"));
//            post.setTimestamp(timestamp);
//
//            post.setMessage(rs.getString("message"));
//
//            posts.add(post);
//        }
//        rs.close();
//
//        conn.close();
//
//        return posts;
//    }
//
//    public void createPost(int userId, String message) throws ClassNotFoundException, SQLException, SQLException {
//        Class.forName("org.sqlite.JDBC");
//        Connection conn = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
//        Statement stat = conn.createStatement();
//
//        stat.executeUpdate("insert into posts " +
//                          "(userId, message) values " +
//                          "(" + userId + ", '" + message + "');");
//
//        conn.close();
//    }
}