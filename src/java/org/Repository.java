package org;

import java.sql.*;
import java.text.*;
import java.util.List;
import java.util.Vector;

public class Repository {
    private Connection conn;
    private Statement stat;

    public Repository(String dbPath) throws ClassNotFoundException, SQLException {
        Class.forName("org.sqlite.JDBC");
        conn = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
        stat = conn.createStatement();
    }
    
    @Override
    protected void finalize() throws SQLException {
        try { stat.close(); } catch (Exception e) { }
        try { conn.close(); } catch (Exception e) { }
    }

    public List<Artist> getArtists() throws ClassNotFoundException, SQLException, ParseException {
        return getArtistsLike("");
    }

    public List<Artist> getArtistsLike(String likeClause) throws ClassNotFoundException, SQLException, ParseException {
        Vector<Artist> artists = new Vector<Artist>();
        ResultSet rs = stat.executeQuery(
                "select * from artists " +
                "where fname || ' ' || lname like '%" + likeClause + "%' " +
                "order by lname;");
        while (rs.next()) {
            Artist artist = new Artist();

            artist.setId(Integer.parseInt(rs.getString("id")));
            artist.setFirstName(rs.getString("fname"));
            artist.setLastName(rs.getString("lname"));

            artists.add(artist);
        }
        rs.close();

        return artists;
    }

    public Artist getArtist(int id) throws ClassNotFoundException, SQLException, ParseException {
        Artist artist = new Artist();
        ResultSet rs = stat.executeQuery("select * from artists where id=" + id + ";");
        if (rs.next()) {
            artist.setId(Integer.parseInt(rs.getString("id")));
            artist.setFirstName(rs.getString("fname"));
            artist.setLastName(rs.getString("lname"));
        }
        rs.close();

        return artist;
    }

    public List<Album> getArtistAlbums(int artistId) throws ClassNotFoundException, SQLException, ParseException {
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

        return albums;
    }
    
    void AddArtist(String firstName, String lastName) throws SQLException, SQLException {
        stat.executeUpdate(
            "insert into artists " +
            "(fname, lname) values " +
            "('" + firstName + "', '" + lastName + "');");
    }

    public List<Album> getAlbums() throws ClassNotFoundException, SQLException, ParseException {
        return getAlbumsLike("");
    }

    public List<Album> getAlbumsLike(String likeClause) throws ClassNotFoundException, SQLException, ParseException {
        Vector<Album> albums = new Vector<Album>();
        ResultSet rs = stat.executeQuery(
                "select * from albums " +
                "where name like '%" + likeClause + "%' " +
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

        return albums;
    }

    public Album getAlbum(int albumId) throws ClassNotFoundException, SQLException, ParseException {
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

        return album;
    }

    public List<Song> getAlbumSongs(int albumId) throws ClassNotFoundException, SQLException, ParseException {
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

        return songs;
    }

    void AddAlbum(int artist, String name, String genre, int year, float price, boolean isAvailable) throws SQLException {
        stat.executeUpdate(
            "insert into albums " +
            "(artistid, name, genre, year, price, isavailable) values " +
            "(" + artist + ", '" + name + "', '" + genre + "', " + year + ", " + price + ", " + (isAvailable ? 1 : 0) + ");");
    }

    public List<Song> getSongsLike(String likeClause) throws ClassNotFoundException, SQLException, ParseException {
        Vector<Song> songs = new Vector<Song>();
        ResultSet rs = stat.executeQuery(
                "select * from songs " +
                "where name like '%" + likeClause + "%' " +
                "order by name;");
        while (rs.next()) {
            Song song = new Song();

            song.setId(rs.getInt("id"));
            song.setAlbumId(rs.getInt("albumid"));
            song.setName(rs.getString("name"));

            songs.add(song);
        }
        rs.close();

        return songs;
    }

    void AddSong(int album, String name) throws SQLException {
        stat.executeUpdate(
            "insert into songs " +
            "(albumid, name) values " +
            "(" + album + ", '" + name + "');");
    }
}