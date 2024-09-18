/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import beans.person;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author ch
 */
public class personDAO {

    private Connection con;
// default constructor

    public personDAO() throws
            ClassNotFoundException, SQLException {
        establishConnection();
    }
// method used to establish connection with db

    private void establishConnection()
            throws ClassNotFoundException, SQLException {
// establishing conection
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        String conUrl = "jdbc:odbc:Site";
        con = DriverManager.getConnection(conUrl);
    }

    private void closeCon() {
        try {
            if (this.con != null) {
                con.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public boolean userExists(String e, String p) throws SQLException {

        boolean check = false;
        try {
            establishConnection();
            String sql = "SELECT * FROM person WHERE EmailAddress=\'" + e + "\' AND Password=\'" + p + "\'";
            PreparedStatement pst = con.prepareStatement(sql);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                check = true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return check;
    }

    public String sendPassword(String e) throws SQLException {
        String pass = null;

        try {
            establishConnection();
            String sql = "SELECT * FROM person WHERE EmailAddress = ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, e);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                pass = rs.getString("Password");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return pass;
    }

    public boolean verifyEmail(String e) throws SQLException {
        boolean email = false;

        try {
            establishConnection();
            String sql = "SELECT * FROM person WHERE EmailAddress = ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, e);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                email = true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return email;
    }

    public void verifySignup(String f, String l, String e, String p) throws SQLException {
        try {
            establishConnection();
            String sql1 = "SELECT * FROM person";
            PreparedStatement pStmt = con.prepareStatement(sql1, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs1 = pStmt.executeQuery();
            rs1.moveToInsertRow();
            rs1.updateString("FirstName", f);
            rs1.updateString("LastName", l);
            rs1.updateString("EmailAddress", e);
            rs1.updateString("Password", p);
            rs1.insertRow();

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
    }

    public void addCrDp(String p, String c, String pp, String pc, String e) {
        try {
            establishConnection();
            String sql = "SELECT * FROM person WHERE EmailAddress = ?";
            PreparedStatement pStmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            pStmt.setString(1, e);
            ResultSet rs = pStmt.executeQuery();
            if (rs.next()) {
                if (p != null) {
                    rs.updateString("ProfilePhoto", p);
                }
                if (c != null) {
                    rs.updateString("CoverPhoto", c);
                }
                if (pp != null) {
                    rs.updateString("PublicProfile", pp);
                }
                if (pc != null) {
                    rs.updateString("PublicCover", pc);
                }
                rs.updateRow();
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
    }

    public person getPersonP(String e) {
        person p = null;
        try {
            establishConnection();
            String sql = "SELECT * FROM person WHERE EmailAddress = ?";
            PreparedStatement pStmt = con.prepareStatement(sql);
            pStmt.setString(1, e);
            ResultSet rs = pStmt.executeQuery();
            if (rs.next()) {
                p = new person();
                p.setEmailId(e);
                p.setProPhoto(rs.getString("ProfilePhoto"));
                p.setPublicProPhoto(rs.getString("PublicProfile"));
                p.setCovPhoto(rs.getString("CoverPhoto"));
                p.setPublicCovPhoto(rs.getString("PublicCover"));
                p.setFirstName(rs.getString("FirstName"));
                p.setLastName(rs.getString("LastName"));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return p;
    }

    public person header(String e) {
        person p = null;
        try {
            establishConnection();
            String sql = "SELECT * FROM person WHERE EmailAddress = ?";
            PreparedStatement pStmt = con.prepareStatement(sql);
            pStmt.setString(1, e);
            ResultSet rs = pStmt.executeQuery();
            if (rs.next()) {
                p = new person();
                p.setProPhoto(rs.getString("ProfilePhoto"));
                p.setFirstName(rs.getString("FirstName"));
                p.setLastName(rs.getString("LastName"));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return p;
    }

    public void editProfile(String fn, String ln, String e) {
        try {
            establishConnection();
            String sql = "SELECT * FROM person WHERE EmailAddress = ?";
            PreparedStatement pStmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            pStmt.setString(1, e);
            ResultSet rs = pStmt.executeQuery();
            if (rs.next()) {
                rs.updateString("FirstName", fn);
                rs.updateString("LastName", ln);
                //rs.updateString("EmailAddress", ne);
                rs.updateRow();
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
    }

    public void changePass(String p, String e) {
        try {
            establishConnection();
            String sql = "SELECT * FROM person WHERE EmailAddress = ?";
            PreparedStatement pStmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            pStmt.setString(1, e);
            ResultSet rs = pStmt.executeQuery();
            if (rs.next()) {
                rs.updateString("Password", p);
                rs.updateRow();
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
    }

    public ArrayList getPersons(String f, String l) {
        ArrayList list = new ArrayList();
        try {
            establishConnection();
            String sql = "SELECT * FROM person WHERE FirstName = \'" + f + "\' AND LastName = \'" + l + "\'";
            PreparedStatement pStmt = con.prepareStatement(sql);
            //pStmt.setString(1, f);
            //pStmt.setString(1, l);
            ResultSet rs = pStmt.executeQuery();
            while (rs.next()) {
                person p = new person();
                p.setEmailId(rs.getString("EmailAddress"));
                p.setCovPhoto(rs.getString("CoverPhoto"));
                p.setProPhoto(rs.getString("ProfilePhoto"));
                p.setPublicCovPhoto(rs.getString("PublicCover"));
                p.setPublicProPhoto(rs.getString("PublicProfile"));
                p.setFirstName(rs.getString("FirstName"));
                p.setLastName(rs.getString("LastName"));
                list.add(p);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return list;
    }

    public ArrayList getPersonsFN(String f) {
        ArrayList list = new ArrayList();
        try {
            establishConnection();
            String sql = "SELECT * FROM person WHERE FirstName = ? ";
            PreparedStatement pStmt = con.prepareStatement(sql);
            pStmt.setString(1, f);

            ResultSet rs = pStmt.executeQuery();
            while (rs.next()) {
                person p = new person();
                p.setEmailId(rs.getString("EmailAddress"));
                p.setCovPhoto(rs.getString("CoverPhoto"));
                p.setProPhoto(rs.getString("ProfilePhoto"));
                p.setPublicCovPhoto(rs.getString("PublicCover"));
                p.setPublicProPhoto(rs.getString("PublicProfile"));
                p.setFirstName(rs.getString("FirstName"));
                p.setLastName(rs.getString("LastName"));
                list.add(p);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return list;
    }

    public ArrayList getPersonsLN(String l) {
        ArrayList list = new ArrayList();
        try {
            establishConnection();
            String sql = "SELECT * FROM person WHERE LastName = ? ";
            PreparedStatement pStmt = con.prepareStatement(sql);

            pStmt.setString(1, l);
            ResultSet rs = pStmt.executeQuery();
            while (rs.next()) {
                person p = new person();
                p.setEmailId(rs.getString("EmailAddress"));
                p.setCovPhoto(rs.getString("CoverPhoto"));
                p.setProPhoto(rs.getString("ProfilePhoto"));
                p.setPublicCovPhoto(rs.getString("PublicCover"));
                p.setPublicProPhoto(rs.getString("PublicProfile"));
                p.setFirstName(rs.getString("FirstName"));
                p.setLastName(rs.getString("LastName"));
                list.add(p);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return list;
    }

    public ArrayList getPosts(String e) {
        ArrayList list = new ArrayList();
        try {
            establishConnection();
            String sql = "SELECT * FROM posts WHERE EmailAddress = ? ORDER BY time DESC";
            PreparedStatement pStmt = con.prepareStatement(sql);
            pStmt.setString(1, e);
            ResultSet rs = pStmt.executeQuery();
            while (rs.next()) {
                person p = new person();
                p.setPostId(Double.parseDouble(rs.getString("postID")));
                p.setPost(rs.getString("Post"));
                p.setPic(rs.getString("pic"));
                p.setTime(rs.getString("time"));
                list.add(p);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return list;
    }

    /**
     *
     * @param e
     * @param p
     * @param t
     * @param pic
     */
    public void addPosts(String e, String p, Timestamp t, String pic) {
        try {
            establishConnection();
            String sql = "SELECT * FROM posts";
            PreparedStatement pStmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = pStmt.executeQuery();
            rs.moveToInsertRow();
            rs.updateString("EmailAddress", e);
            rs.updateString("Post", p);
            rs.updateTimestamp("time", t);
            rs.updateString("pic", pic);
            rs.insertRow();
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
    }

    public void editPost(String p, double pid) {
        try {
            establishConnection();
            String sql = "SELECT * FROM posts WHERE postID = ?";
            PreparedStatement pStmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            pStmt.setDouble(1, pid);
            ResultSet rs = pStmt.executeQuery();
            if (rs.next()) {
                rs.updateString("Post", p);
                rs.updateRow();
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
    }

    public void delPost(double pid) {
        try {
            establishConnection();
            String sql = "DELETE FROM posts WHERE postID = ?";
            PreparedStatement pStmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            pStmt.setDouble(1, pid);
            ResultSet rs = pStmt.executeQuery();
            if (rs.next()) {
                rs.updateRow();
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
    }

    public void addFriend(String e, String r) throws SQLException {
        try {
            establishConnection();
            String sql = "SELECT * FROM friendRequest";
            PreparedStatement pStmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = pStmt.executeQuery();
            rs.moveToInsertRow();
            rs.updateString("EmailAddress", r);
            rs.updateString("requestId", e);
            rs.insertRow();
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
    }

    public boolean checkFriend(String e, String fe) throws SQLException {

        boolean check = false;
        try {
            establishConnection();
            String sql = "SELECT * FROM friends WHERE EmailAddress=\'" + e + "\' AND friend_id=\'" + fe + "\'";
            PreparedStatement pst = con.prepareStatement(sql);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                check = true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return check;
    }

    public void unFriend(String e, String ue) {
        try {
            establishConnection();
            String sql = "DELETE FROM friends WHERE EmailAddress = ? AND friend_id = ?";
            PreparedStatement pStmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            pStmt.setString(1, e);
            pStmt.setString(2, ue);
            ResultSet rs = pStmt.executeQuery();
            if (rs.next()) {
                rs.updateRow();
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
    }

    public ArrayList friendList(String e) {
        ArrayList list = new ArrayList();
        try {
            establishConnection();
            String sql = "SELECT * FROM person, friends WHERE person.EmailAddress=friends.friend_id AND friends.EmailAddress = ?";
            PreparedStatement pStmt = con.prepareStatement(sql);
            pStmt.setString(1, e);
            ResultSet rs = pStmt.executeQuery();
            while (rs.next()) {
                person p = new person();
                p.setEmailId(rs.getString("EmailAddress"));
                p.setCovPhoto(rs.getString("CoverPhoto"));
                p.setProPhoto(rs.getString("ProfilePhoto"));
                p.setFirstName(rs.getString("FirstName"));
                p.setLastName(rs.getString("LastName"));
                list.add(p);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return list;
    }

    public ArrayList getPosts_TL(String e) {
        ArrayList list = new ArrayList();
        try {
            establishConnection();
            String sql = "SELECT distinct posts.postID, posts.Post, posts.EmailAddress, posts.time, posts.pic \n"
                    + "FROM posts, friends \n"
                    + "WHERE (posts.EmailAddress = friends.friend_id \n"
                    + "AND friends.EmailAddress = ? ) OR posts.EmailAddress = ?\n"
                    + "ORDER BY time DESC";
            PreparedStatement pStmt = con.prepareStatement(sql);
            pStmt.setString(1, e);
            pStmt.setString(2, e);
            ResultSet rs = pStmt.executeQuery();
            while (rs.next()) {
                person p = new person();
                p.setPostId(Double.parseDouble(rs.getString("postID")));
                p.setPost(rs.getString("Post"));
                p.setPic(rs.getString("pic"));
                p.setTime(rs.getString("time"));
                p.setEmailId(rs.getString("EmailAddress"));
                list.add(p);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return list;
    }

    public void likePost(double pid, String u) {
        try {
            establishConnection();
            String sql = "SELECT * FROM like";
            PreparedStatement pStmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = pStmt.executeQuery();
            rs.moveToInsertRow();
            rs.updateDouble("postID", pid);
            rs.updateString("likedby", u);
            rs.insertRow();
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
    }

    public boolean checkUliked(double pid, String ue) {

        boolean check = false;
        try {
            establishConnection();
            String sql = "SELECT * FROM like WHERE postID = ? AND likedby = ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setDouble(1, pid);
            pst.setString(2, ue);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                check = true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return check;
    }

    public ArrayList getLikes(String e) {
        ArrayList list = new ArrayList();
        try {
            establishConnection();
            String sql = "SELECT * \n"
                    + "FROM posts \n"
                    + "WHERE postID IN \n"
                    + "                            (SELECT postID\n"
                    + "                             FROM like \n"
                    + "                             WHERE likedby = ?)\n"
                    + "ORDER BY time DESC";
            PreparedStatement pStmt = con.prepareStatement(sql);
            pStmt.setString(1, e);
            ResultSet rs = pStmt.executeQuery();
            while (rs.next()) {
                person p = new person();
                p.setPostId(Double.parseDouble(rs.getString("postID")));
                p.setPost(rs.getString("Post"));
                p.setPic(rs.getString("pic"));
                p.setTime(rs.getString("time"));
                p.setEmailId(rs.getString("EmailAddress"));
                list.add(p);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return list;
    }

    public void unlikePost(double pid, String u) {
        try {
            establishConnection();
            String sql = "DELETE FROM like WHERE postID = ? AND likedby = ?";
            PreparedStatement pStmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            pStmt.setDouble(1, pid);
            pStmt.setString(2, u);
            ResultSet rs = pStmt.executeQuery();
            if (rs.next()) {
                rs.updateRow();
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
    }

    public ArrayList getPosts_TL1(String e) {
        ArrayList list = new ArrayList();
        try {
            establishConnection();
            String sql = "SELECT DISTINCT posts.postID, posts.Post, posts.EmailAddress, posts.time, posts.pic, FirstName\n"
                    + "FROM posts, friends, person\n"
                    + "WHERE (posts.EmailAddress=friends.friend_id And posts.EmailAddress=person.EmailAddress And friends.EmailAddress=[?]) \n"
                    + "Or (posts.EmailAddress=[?] And posts.EmailAddress=person.EmailAddress)\n"
                    + "ORDER BY FirstName;";
            PreparedStatement pStmt = con.prepareStatement(sql);
            pStmt.setString(1, e);
            pStmt.setString(2, e);
            ResultSet rs = pStmt.executeQuery();
            while (rs.next()) {
                person p = new person();
                p.setPostId(Double.parseDouble(rs.getString("postID")));
                p.setPost(rs.getString("Post"));
                p.setPic(rs.getString("pic"));
                p.setTime(rs.getString("time"));
                p.setEmailId(rs.getString("EmailAddress"));
                list.add(p);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return list;
    }

    public ArrayList getLikes1(String e) {
        ArrayList list = new ArrayList();
        try {
            establishConnection();
            String sql = "SELECT  postID, post, time, FirstName, posts.EmailAddress, person.EmailAddress, posts.pic\n"
                    + "FROM posts, person\n"
                    + "WHERE posts.EmailAddress=person.EmailAddress AND postID IN (SELECT postID FROM like \n"
                    + "                             WHERE likedby = ?)\n"
                    + "ORDER BY FirstName;";
            PreparedStatement pStmt = con.prepareStatement(sql);
            pStmt.setString(1, e);
            ResultSet rs = pStmt.executeQuery();
            while (rs.next()) {
                person p = new person();
                p.setPostId(Double.parseDouble(rs.getString("postID")));
                p.setPost(rs.getString("Post"));
                p.setPic(rs.getString("pic"));
                p.setTime(rs.getString("time"));
                p.setEmailId(rs.getString("EmailAddress"));
                list.add(p);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return list;
    }

    public person getPost(double pi) throws SQLException {
        person p = null;

        try {
            establishConnection();
            String sql = "SELECT * FROM posts WHERE postID = ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setDouble(1, pi);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                p = new person();
                p.setPostId(pi);
                p.setEmailId(rs.getString("EmailAddress"));
                p.setPost(rs.getString("Post"));
                p.setPic(rs.getString("pic"));
                p.setTime(rs.getString("time"));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return p;
    }

    public boolean checkDuplicateComment(double p, String e, String c) {
        boolean cdc = false;
        try {
            establishConnection();
            String sql = "SELECT * FROM comment WHERE (postID = ? AND commentby = ? AND comment = ?)";
            PreparedStatement pStmt = con.prepareStatement(sql);
            pStmt.setDouble(1, p);
            pStmt.setString(2, e);
            pStmt.setString(3, c);
            ResultSet rs = pStmt.executeQuery();
            if (rs.next()) {
                cdc = true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return cdc;
    }

    public void addComments(double p, String e, String c, Timestamp t) {
        try {
            establishConnection();
            String sql = "SELECT * FROM comment";
            PreparedStatement pStmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = pStmt.executeQuery();
            rs.moveToInsertRow();
            rs.updateDouble("postId", p);
            rs.updateString("commentby", e);
            rs.updateString("comment", c);
            rs.updateTimestamp("time", t);
            rs.insertRow();
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
    }

    public ArrayList getComments(double pi) {
        ArrayList list = new ArrayList();
        try {
            establishConnection();
            String sql = "SELECT * FROM comment WHERE postID = ?";
            PreparedStatement pStmt = con.prepareStatement(sql);
            pStmt.setDouble(1, pi);
            ResultSet rs = pStmt.executeQuery();
            while (rs.next()) {
                person p = new person();
                p.setPostId(pi);
                p.setEmailId(rs.getString("commentby"));
                p.setPost(rs.getString("comment"));
                p.setTime(rs.getString("time"));
                list.add(p);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return list;
    }

    public int countComments(double pi) {
        int c = 0;
        try {
            establishConnection();
            String sql = "SELECT * FROM comment WHERE postID = ?";
            PreparedStatement pStmt = con.prepareStatement(sql);
            pStmt.setDouble(1, pi);
            ResultSet rs = pStmt.executeQuery();
            while (rs.next()) {
                c++;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return c;
    }

    public int countLikes(double pi) {
        int c = 0;
        try {
            establishConnection();
            String sql = "SELECT * FROM like WHERE postID = ?";
            PreparedStatement pStmt = con.prepareStatement(sql);
            pStmt.setDouble(1, pi);
            ResultSet rs = pStmt.executeQuery();
            while (rs.next()) {
                c++;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return c;
    }

    public void acceptRequest(String e, String fe) throws SQLException {
        try {
            establishConnection();
            String sql = "SELECT * FROM friends";
            PreparedStatement pStmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = pStmt.executeQuery();
            rs.moveToInsertRow();
            rs.updateString("EmailAddress", e);
            rs.updateString("friend_id", fe);
            rs.insertRow();
            String sql1 = "SELECT * FROM friends";
            PreparedStatement pStmt1 = con.prepareStatement(sql1, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs1 = pStmt1.executeQuery();
            rs1.moveToInsertRow();
            rs1.updateString("EmailAddress", fe);
            rs1.updateString("friend_id", e);
            rs1.insertRow();
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
    }

    public boolean checkRequest(String e, String fe) throws SQLException {

        boolean check = false;
        try {
            establishConnection();
            String sql = "SELECT * FROM friendRequest WHERE EmailAddress=\'" + fe + "\' AND requestId=\'" + e + "\'";
            PreparedStatement pst = con.prepareStatement(sql);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                check = true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return check;
    }

    public boolean checkSentRequest(String e, String fe) throws SQLException {

        boolean check = false;
        try {
            establishConnection();
            String sql = "SELECT * FROM friendRequest WHERE EmailAddress=\'" + e + "\' AND requestId=\'" + fe + "\'";
            PreparedStatement pst = con.prepareStatement(sql);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                check = true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return check;
    }

    public void cancelRequest(String e, String ue) {
        try {
            establishConnection();
            String sql = "DELETE FROM friendRequest WHERE EmailAddress = ? AND requestId = ?";
            PreparedStatement pStmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            pStmt.setString(1, e);
            pStmt.setString(2, ue);
            ResultSet rs = pStmt.executeQuery();
            if (rs.next()) {
                rs.updateRow();
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
    }

    public int getFriendRequests(String e) {
        int c = 0;
        try {
            establishConnection();
            String sql = "SELECT * FROM friendRequest WHERE EmailAddress = ?";
            PreparedStatement pStmt = con.prepareStatement(sql);
            pStmt.setString(1, e);
            ResultSet rs = pStmt.executeQuery();
            while (rs.next()) {
                c++;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return c;
    }

    public ArrayList friendRequests(String e) {
        ArrayList list = new ArrayList();
        try {
            establishConnection();
            String sql = "SELECT * FROM person, friendRequest WHERE person.EmailAddress=friendRequest.requestId AND friendRequest.EmailAddress = ?";
            PreparedStatement pStmt = con.prepareStatement(sql);
            pStmt.setString(1, e);
            ResultSet rs = pStmt.executeQuery();
            while (rs.next()) {
                person p = new person();
                p.setEmailId(rs.getString("EmailAddress"));
                p.setCovPhoto(rs.getString("CoverPhoto"));
                p.setProPhoto(rs.getString("ProfilePhoto"));
                p.setPublicCovPhoto(rs.getString("PublicCover"));
                p.setPublicProPhoto(rs.getString("PublicProfile"));
                p.setFirstName(rs.getString("FirstName"));
                p.setLastName(rs.getString("LastName"));
                list.add(p);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return list;
    }

    public void addVisits(String e, String r, Timestamp t) throws SQLException {
        try {
            establishConnection();
            String sql1 = "SELECT * FROM profileVisits";
            PreparedStatement pStmt1 = con.prepareStatement(sql1, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs1 = pStmt1.executeQuery();
            rs1.moveToInsertRow();
            rs1.updateString("EmailAddress", r);
            rs1.updateString("visitedBy", e);
            rs1.updateTimestamp("Time", t);
            rs1.insertRow();
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
    }

    public int getProfileVisits(String e) {
        int c = 0;
        try {
            establishConnection();
            String sql = "SELECT * FROM profileVisits WHERE EmailAddress = ?";
            PreparedStatement pStmt = con.prepareStatement(sql);
            pStmt.setString(1, e);
            ResultSet rs = pStmt.executeQuery();
            while (rs.next()) {
                c++;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return c;
    }

    /*public String[] checkProfileVisits(String e) {
     String c[] = new String[]{};
     int i = 0;
     try {
     establishConnection();
     String sql = "SELECT * FROM profileVisits WHERE EmailAddress = ?";
     PreparedStatement pStmt = con.prepareStatement(sql);
     pStmt.setString(1, e);
     ResultSet rs = pStmt.executeQuery();
     while (rs.next()) {
     c[i] = rs.getString("visitedBy");
     i++;
     }
     } catch (ClassNotFoundException | SQLException ex) {
     System.out.println(ex);
     } finally {
     closeCon();
     }
     return c;
     }*/
    public ArrayList profileVisits(String e) {
        ArrayList list = new ArrayList();
        try {
            establishConnection();
            String sql = "SELECT * FROM person, profileVisits WHERE person.EmailAddress=profileVisits.visitedBy AND profileVisits.EmailAddress = ? ORDER BY Time desc";
            PreparedStatement pStmt = con.prepareStatement(sql);
            pStmt.setString(1, e);
            ResultSet rs = pStmt.executeQuery();
            while (rs.next()) {
                person p = new person();
                p.setEmailId(rs.getString(1));
                p.setCovPhoto(rs.getString("CoverPhoto"));
                p.setProPhoto(rs.getString("ProfilePhoto"));
                p.setPublicCovPhoto(rs.getString("PublicCover"));
                p.setPublicProPhoto(rs.getString("PublicProfile"));
                p.setFirstName(rs.getString("FirstName"));
                p.setLastName(rs.getString("LastName"));
                p.setTime(rs.getString("Time"));
                list.add(p);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return list;
    }

    public void resetVisits(String e) {
        try {
            establishConnection();
            String sql = "DELETE FROM profileVisits WHERE EmailAddress = ?";
            PreparedStatement pStmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            pStmt.setString(1, e);
            ResultSet rs = pStmt.executeQuery();
            while (rs.next()) {
                rs.updateRow();
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
    }

    public void sendMessage(String m, String st, String sb, Timestamp t) throws SQLException {
        try {
            establishConnection();
            String sql = "SELECT * FROM messages";
            PreparedStatement pStmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = pStmt.executeQuery();
            rs.moveToInsertRow();
            rs.updateString("message", m);
            rs.updateString("sentTo", st);
            rs.updateString("sentBy", sb);
            rs.updateTimestamp("time", t);
            rs.insertRow();
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
    }

    public ArrayList getAllMessagesP(String e) {
        ArrayList list = new ArrayList();
        try {
            establishConnection();
            String sql = "select sentBy, max(time) as time1\n"
                    + "from messages where sentTo = ?\n"
                    + "group by sentBy order by max(time) desc;";
            PreparedStatement pStmt = con.prepareStatement(sql);
            pStmt.setString(1, e);
            ResultSet rs = pStmt.executeQuery();
            while (rs.next()) {
                String u = rs.getString("sentBy");
                list.add(u);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return list;
    }

    public double getLatestMsg(String st, String sb) {
        double mi = 0;
        try {
            establishConnection();
            String sql = "SELECT max(msgId) AS msgId1, max(time) as time1\n"
                    + "FROM messages\n"
                    + "WHERE (sentTo = ? AND sentBy = ?) OR (sentTo = ? AND sentBy = ?);";
            PreparedStatement pStmt = con.prepareStatement(sql);
            pStmt.setString(1, st);
            pStmt.setString(2, sb);
            pStmt.setString(3, sb);
            pStmt.setString(4, st);
            ResultSet rs = pStmt.executeQuery();
            if (rs.next()) {
                mi = rs.getDouble("msgId1");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return mi;
    }

    public person getMsgP(double mi) throws SQLException {
        person p = null;
        try {
            establishConnection();
            String sql = "SELECT * FROM messages WHERE msgId = ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setDouble(1, mi);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                p = new person();
                p.setPostId(mi);
                p.setPost(rs.getString("message"));
                p.setTime(rs.getString("time"));
                p.setEmailId(rs.getString("sentBy"));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return p;
    }

    public ArrayList getMessages(String u, String uv) {
        ArrayList list = new ArrayList();
        try {
            establishConnection();
            String sql = "SELECT * \n"
                    + "FROM messages \n"
                    + "WHERE (sentTo = ? AND sentBy  = ?) \n"
                    + "OR (sentTo = ? AND sentBy  = ?)\n"
                    + "ORDER BY time DESC";
            PreparedStatement pStmt = con.prepareStatement(sql);
            pStmt.setString(1, u);
            pStmt.setString(2, uv);
            pStmt.setString(3, uv);
            pStmt.setString(4, u);
            ResultSet rs = pStmt.executeQuery();
            while (rs.next()) {
                person p = new person();
                p.setEmailId(rs.getString("sentBy"));
                p.setPostId(Double.parseDouble(rs.getString("msgId")));
                p.setPost(rs.getString("message"));
                p.setTime(rs.getString("time"));
                list.add(p);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return list;
    }

    public void delAllMsgs(String st, String sb) {
        try {
            establishConnection();
            String sql = "DELETE \n"
                    + "FROM messages \n"
                    + "WHERE (sentTo = ? AND sentBy  = ?) \n"
                    + "OR (sentTo = ? AND sentBy  = ?)";
            PreparedStatement pStmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            pStmt.setString(1, st);
            pStmt.setString(2, sb);
            pStmt.setString(3, sb);
            pStmt.setString(4, st);
            ResultSet rs = pStmt.executeQuery();
            while (rs.next()) {
                rs.updateRow();
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
    }

    public void delMsg(double mid) {
        try {
            establishConnection();
            String sql = "DELETE FROM messages WHERE msgId = ?";
            PreparedStatement pStmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            pStmt.setDouble(1, mid);
            ResultSet rs = pStmt.executeQuery();
            if (rs.next()) {
                rs.updateRow();
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
    }

    public int getUnreadMessages(String e) {
        int c = 0;
        try {
            establishConnection();
            String sql = "SELECT DISTINCT sentBy\n"
                    + " FROM messages\n"
                    + "WHERE sentTo = ?\n"
                    + " AND status=0;";
            PreparedStatement pStmt = con.prepareStatement(sql);
            pStmt.setString(1, e);
            ResultSet rs = pStmt.executeQuery();
            while (rs.next()) {
                c++;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return c;
    }

    public int getUnreadMessagesP(String st, String sb) {
        int c = 0;
        try {
            establishConnection();
            String sql = "SELECT *\n"
                    + " FROM messages\n"
                    + "WHERE (sentTo = ? AND sentBy = ?)\n"
                    + " AND status = ? ";
            PreparedStatement pStmt = con.prepareStatement(sql);
            pStmt.setString(1, st);
            pStmt.setString(2, sb);
            pStmt.setBoolean(3, false);
            ResultSet rs = pStmt.executeQuery();
            while (rs.next()) {
                c++;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
        return c;
    }

    public void markMsgsAsRead(String u, String uv) {
        try {
            establishConnection();
            String sql = "UPDATE messages\n"
                    + "SET status = true\n"
                    + "WHERE (sentTo = ? AND sentBy = ?) AND status = false;";
            PreparedStatement pStmt = con.prepareStatement(sql);
            pStmt.setString(1, u);
            pStmt.setString(2, uv);
            int r = pStmt.executeUpdate();
            System.out.println(r + " rows updated!");
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
    }

    public void deleteAccount(String e) {
        try {
            establishConnection();
            String sql = "DELETE FROM person WHERE EmailAddress =?";
            PreparedStatement pStmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            pStmt.setString(1, e);
            pStmt.executeUpdate();

            String sql1 = "DELETE FROM profileVisits WHERE EmailAddress = ? OR visitedBy = ?";
            PreparedStatement pStmt1 = con.prepareStatement(sql1);
            pStmt1.setString(1, e);
            pStmt1.setString(2, e);
            int r = pStmt1.executeUpdate();
            System.out.println(r + " rows updated of 'profileVisits'!");

            String sql2 = "DELETE FROM posts WHERE EmailAddress = ?";
            PreparedStatement pStmt2 = con.prepareStatement(sql2);
            pStmt2.setString(1, e);
            r = pStmt2.executeUpdate();
            System.out.println(r + " rows updated of 'posts'!");

            String sql3 = "DELETE FROM like WHERE likedby = ?";
            PreparedStatement pStmt3 = con.prepareStatement(sql3);
            pStmt3.setString(1, e);
            r = pStmt3.executeUpdate();
            System.out.println(r + " rows updated of 'like'!");

            String sql4 = "DELETE FROM friends WHERE EmailAddress = ? OR friend_id = ?";
            PreparedStatement pStmt4 = con.prepareStatement(sql4);
            pStmt4.setString(1, e);
            pStmt4.setString(2, e);
            r = pStmt4.executeUpdate();
            System.out.println(r + " rows updated of 'friends'!");

            String sql5 = "DELETE FROM comment WHERE commentby = ?";
            PreparedStatement pStmt5 = con.prepareStatement(sql5);
            pStmt5.setString(1, e);
            r = pStmt5.executeUpdate();
            System.out.println(r + " rows updated of 'comment'!");

            String sql6 = "DELETE FROM messages WHERE sentTo = ? OR sentBy= ?";
            PreparedStatement pStmt6 = con.prepareStatement(sql6);
            pStmt6.setString(1, e);
            pStmt6.setString(2, e);
            r = pStmt6.executeUpdate();
            System.out.println(r + " rows updated of 'messages'!");

            String sql7 = "DELETE FROM friendRequest WHERE EmailAddress = ? OR requestId = ?";
            PreparedStatement pStmt7 = con.prepareStatement(sql7);
            pStmt7.setString(1, e);
            pStmt7.setString(2, e);
            r = pStmt7.executeUpdate();
            System.out.println(r + " rows updated of 'friendRequest'!");

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } finally {
            closeCon();
        }
    }
}
