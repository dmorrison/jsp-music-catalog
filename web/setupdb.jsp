<%@ page import="java.sql.*" %>

<%
    try {
        Class.forName("org.sqlite.JDBC");
        String dbpath = application.getRealPath("music.sqlite");
        Connection conn = DriverManager.getConnection("jdbc:sqlite:" + dbpath);
        Statement stat = conn.createStatement();

        stat.executeUpdate("drop table if exists artists;");
        stat.executeUpdate(
                "create table artists (" +
                    "id integer primary key, " +
                    "fname, " +
                    "lname);");

        stat.executeUpdate("insert into artists " +
                           "(id, fname, lname) values " +
                           "(1, 'Michael', 'Jackson');");
        stat.executeUpdate("insert into artists " +
                           "(id, fname, lname) values " +
                           "(2, 'Diana', 'Krall');");
        stat.executeUpdate("insert into artists " +
                           "(id, fname, lname) values " +
                           "(3, 'Grandmaster', 'Flash');");
        stat.executeUpdate("insert into artists " +
                           "(id, fname, lname) values " +
                           "(4, 'Donna', 'Summer');");

        stat.executeUpdate("drop table if exists albums;");
        stat.executeUpdate(
                "create table albums (" +
                    "id integer primary key, " +
                    "artistid, " +
                    "name, " +
                    "genre, " +
                    "year, " +
                    "price, " +
                    "isavailable);");

        stat.executeUpdate(
                "insert into albums " +
                "(id, artistid, name, genre, year, price, isavailable) values " +
                "(1, 1, 'Bad', 'Pop', 1987, 7.97, 1);");
        stat.executeUpdate(
                "insert into albums " +
                "(id, artistid, name, genre, year, price, isavailable) values " +
                "(2, 2, 'Quiet Nights', 'Jazz', 2009, 8.99, 0);");
        stat.executeUpdate(
                "insert into albums " +
                "(id, artistid, name, genre, year, price, isavailable) values " +
                "(3, 3, 'The Bridge', 'Hip Hop', 2009, 8.99, 1);");
        stat.executeUpdate(
                "insert into albums " +
                "(id, artistid, name, genre, year, price, isavailable) values " +
                "(4, 4, 'Bad Girls', 'Disco', 1990, 7.00, 1);");
        stat.executeUpdate(
                "insert into albums " +
                "(id, artistid, name, genre, year, price, isavailable) values " +
                "(5, 4, 'A Love Trilogy', 'Disco', 1992, 5.50, 0);");

        stat.executeUpdate("drop table if exists songs;");
        stat.executeUpdate(
                "create table songs (" +
                    "id integer primary key, " +
                    "albumid, " +
                    "name);");

        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(1, 'Bad');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(1, 'Way You Make Me Feel');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(1, 'Speed Demon');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(1, 'Liberian Girl');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(1, 'Just Good Friends');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(1, 'Another Part of Me');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(1, 'Man in the Mirror');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(1, 'I Just Cant Stop Loving You');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(1, 'Dirty Diana');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(1, 'Smooth Criminal');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(1, 'Leave Me Alone');");

        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(2, 'Where or When');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(2, 'Too Marvelous For Words');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(2, 'Accustomed to His Face');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(2, 'The Boy from Ipanema');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(2, 'Walk on By');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(2, 'My Thrill');");

        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(3, 'Welcome');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(3, 'Shine All Day Feat. Q-Tip');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(3, 'We Speak Hip Hop Feat. Abass');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(3, 'Unanswered');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(3, 'Tribute to the Breakdancer');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(3, 'Grown and Sexy');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(3, 'Connection');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(3, 'Zuka the Sound');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(3, 'Oh Man Feat. Syndee');");

        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(4, 'Hot Stuff');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(4, 'Bad Girls');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(4, 'Love Will Always Find You');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(4, 'Walk Away');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(4, 'Dim All the Lights');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(4, 'Journey to the Center of Your Heart');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(4, 'One Night in a Lifetime');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(4, 'Oh My Honor');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(4, 'Our Love');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(4, 'Lucky');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(4, 'Sunset People');");

        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(5, 'Try Me, I Know We Can Make It');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(5, 'Prelude to Love');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(5, 'Could It Be Magic');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(5, 'Wasted');");
        stat.executeUpdate("insert into songs " +
                           "(albumid, name) values " +
                           "(5, 'Come With Me');");

        out.println("Database set up successfully.");

        conn.close();
    } catch (Exception ex) {
        out.println("Error: " + ex.getMessage());
    }
%>
