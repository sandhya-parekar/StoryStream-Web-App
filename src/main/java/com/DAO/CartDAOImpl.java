package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.cart;

public class CartDAOImpl implements CartDAO {

    private Connection conn;

    public CartDAOImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public boolean addCart(cart c) {
        boolean f = false;
        try {
            String sql = "INSERT INTO cart(bid, uid, bookName, Author, price, total_price) VALUES (?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, c.getBid());
            ps.setInt(2, c.getUserId());
            ps.setString(3, c.getBookName());
            ps.setString(4, c.getAuthor());
            ps.setDouble(5, c.getPrice());
            ps.setDouble(6, c.getTotalPrice());

            int i = ps.executeUpdate();
            if (i == 1) f = true;

            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<cart> getBookByUser(int userId) {
        List<cart> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM cart WHERE uid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                cart c = new cart();
                c.setCid(rs.getInt("cid"));
                c.setBid(rs.getInt("bid"));
                c.setUserId(rs.getInt("uid"));
                c.setBookName(rs.getString("bookName"));
                c.setAuthor(rs.getString("Author"));
                c.setPrice(rs.getDouble("price"));
                c.setTotalPrice(rs.getDouble("total_price"));
                list.add(c);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean deleteBook(int bid, int uid,int cid) {
        boolean f = false;
        try {
            String sql = "DELETE FROM cart WHERE bid=? AND uid=? AND cid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, bid);
            ps.setInt(2, uid);
            ps.setInt(3, cid);

            int i = ps.executeUpdate();
            if (i == 1) f = true;

            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
