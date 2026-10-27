package com.DAO;

import com.entity.ContactMessage;
import java.util.List;

public interface ContactDAO {
    boolean saveMessage(ContactMessage cm);
    List<ContactMessage> getAllMessages(); // Must exist
}
