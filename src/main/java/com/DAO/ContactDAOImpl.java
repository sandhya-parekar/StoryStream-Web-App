package com.DAO;

import com.DB.DBConnect;
import com.entity.ContactMessage;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContactDAOImpl implements ContactDAO {

    @Override
    public boolean saveMessage(ContactMessage cm) {
        boolean f = false;
        try {
            Connection conn = DBConnect.getConn();
            String sql = "INSERT INTO contact_messages(name,email,message,created_at) VALUES(?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, cm.getName());
            ps.setString(2, cm.getEmail());
            ps.setString(3, cm.getMessage());
            ps.setTimestamp(4, new Timestamp(System.currentTimeMillis())); // set current time
            int i = ps.executeUpdate();
            if(i == 1) f = true;
        } catch(Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<ContactMessage> getAllMessages() {
        List<ContactMessage> list = new ArrayList<>();
        try {
            Connection conn = DBConnect.getConn();
            String sql = "SELECT * FROM contact_messages ORDER BY created_at DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                ContactMessage cm = new ContactMessage();
                cm.setId(rs.getInt("id"));
                cm.setName(rs.getString("name"));
                cm.setEmail(rs.getString("email"));
                cm.setMessage(rs.getString("message"));
                cm.setCreatedAt(rs.getTimestamp("created_at"));
                list.add(cm);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
