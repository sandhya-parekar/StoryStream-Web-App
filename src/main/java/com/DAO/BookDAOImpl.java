package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDts;

public class BookDAOImpl implements BookDAO {

    private Connection conn;

    public BookDAOImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public boolean addBooks(BookDts b) {
        boolean success = false;
        try {
            String sql = "INSERT INTO book_dts(book_name, author, price, bookCategory, status, photo, user_email, ageGroup,description) "
                       + "VALUES (?, ?, ?, ?, ?, ?, ?, ?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, b.getBookName());
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getBookCategory());
            ps.setString(5, b.getStatus());
            ps.setString(6, b.getPhoto());
            ps.setString(7, b.getUserEmail());
            ps.setString(8, b.getAgeGroup());
            ps.setString(9, b.getDescription()); 
        

            int i = ps.executeUpdate();
            if (i == 1) success = true;
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

    @Override
    public List<BookDts> getAllBooks() {
        List<BookDts> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM book_dts";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BookDts b = new BookDts();
                b.setBookId(rs.getInt("book_id"));
                b.setBookName(rs.getString("book_name"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getString("price"));
                b.setBookCategory(rs.getString("bookCategory"));
                b.setStatus(rs.getString("status"));
                b.setPhoto(rs.getString("photo"));
                b.setUserEmail(rs.getString("user_email"));
                b.setAgeGroup(rs.getString("ageGroup"));
                list.add(b);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public BookDts getBookById(int id) {
        BookDts b = null;
        try {
            String sql = "SELECT * FROM book_dts WHERE book_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                b = new BookDts();
                b.setBookId(rs.getInt("book_id"));
                b.setBookName(rs.getString("book_name"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getString("price"));
                b.setBookCategory(rs.getString("bookCategory"));
                b.setStatus(rs.getString("status"));
                b.setPhoto(rs.getString("photo"));
                b.setUserEmail(rs.getString("user_email"));
                b.setAgeGroup(rs.getString("ageGroup"));
                b.setDescription(rs.getString("description"));
                
                
               
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean updateEditBooks(BookDts b) {
        boolean f = false;
        try {
            String sql = "UPDATE book_dts SET book_name=?, author=?, price=?, status=?, ageGroup=? WHERE book_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, b.getBookName());
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getStatus());
            ps.setString(5, b.getAgeGroup());
            ps.setInt(6, b.getBookId());

            int i = ps.executeUpdate();
            if (i == 1) f = true;

            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public boolean deleteBooks(int id) {
        boolean f = false;
        try {
            String sql = "DELETE FROM book_dts WHERE book_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            int i = ps.executeUpdate();
            if (i == 1) f = true;

            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<BookDts> getChildrenBook() {
        List<BookDts> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM book_dts WHERE status=? AND ageGroup='Childrens' ORDER BY book_id DESC LIMIT 4";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Active");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BookDts b = new BookDts();
                b.setBookId(rs.getInt("book_id"));
                b.setBookName(rs.getString("book_name"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getString("price"));
                b.setBookCategory(rs.getString("bookCategory"));
                b.setStatus(rs.getString("status"));
                b.setPhoto(rs.getString("photo"));
                b.setUserEmail(rs.getString("user_email"));
                b.setAgeGroup(rs.getString("ageGroup"));
                list.add(b);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    @Override
    public List<BookDts> getTeensBooks() {
        List<BookDts> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM book_dts WHERE status=? AND ageGroup='Teens' ORDER BY book_id DESC LIMIT 4";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Active");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BookDts b = new BookDts();
                b.setBookId(rs.getInt("book_id"));
                b.setBookName(rs.getString("book_name"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getString("price"));
                b.setBookCategory(rs.getString("bookCategory"));
                b.setStatus(rs.getString("status"));
                b.setPhoto(rs.getString("photo"));
                b.setUserEmail(rs.getString("user_email"));
                b.setAgeGroup(rs.getString("ageGroup"));
                list.add(b);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<BookDts> getEldersBooks(){
        List<BookDts> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM book_dts WHERE status=? AND ageGroup='Elders' ORDER BY book_id DESC LIMIT 4";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Active");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BookDts b = new BookDts();
                b.setBookId(rs.getInt("book_id"));
                b.setBookName(rs.getString("book_name"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getString("price"));
                b.setBookCategory(rs.getString("bookCategory"));
                b.setStatus(rs.getString("status"));
                b.setPhoto(rs.getString("photo"));
                b.setUserEmail(rs.getString("user_email"));
                b.setAgeGroup(rs.getString("ageGroup"));
                list.add(b);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

	@Override
	public List<BookDts> getAllChildrensBook() {
		 List<BookDts> list = new ArrayList<>();
	        try {
	            String sql = "SELECT * FROM book_dts WHERE status=? AND ageGroup='Childrens' ORDER BY book_id DESC ";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ps.setString(1, "Active");

	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                BookDts b = new BookDts();
	                b.setBookId(rs.getInt("book_id"));
	                b.setBookName(rs.getString("book_name"));
	                b.setAuthor(rs.getString("author"));
	                b.setPrice(rs.getString("price"));
	                b.setBookCategory(rs.getString("bookCategory"));
	                b.setStatus(rs.getString("status"));
	                b.setPhoto(rs.getString("photo"));
	                b.setUserEmail(rs.getString("user_email"));
	                b.setAgeGroup(rs.getString("ageGroup"));
	                list.add(b);
	            }
	            rs.close();
	            ps.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return list;
	    

	}

	@Override
	public List<BookDts> getAllTeensBook() {
		 List<BookDts> list = new ArrayList<>();
	        try {
	            String sql = "SELECT * FROM book_dts WHERE status=? AND ageGroup='Teens' ORDER BY book_id DESC ";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ps.setString(1, "Active");

	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                BookDts b = new BookDts();
	                b.setBookId(rs.getInt("book_id"));
	                b.setBookName(rs.getString("book_name"));
	                b.setAuthor(rs.getString("author"));
	                b.setPrice(rs.getString("price"));
	                b.setBookCategory(rs.getString("bookCategory"));
	                b.setStatus(rs.getString("status"));
	                b.setPhoto(rs.getString("photo"));
	                b.setUserEmail(rs.getString("user_email"));
	                b.setAgeGroup(rs.getString("ageGroup"));
	                list.add(b);
	            }
	            rs.close();
	            ps.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return list;
	}

	@Override
	public List<BookDts> getAllEldersBook() {
		 List<BookDts> list = new ArrayList<>();
	        try {
	            String sql = "SELECT * FROM book_dts WHERE status=? AND ageGroup='Elders' ORDER BY book_id DESC ";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ps.setString(1, "Active");

	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                BookDts b = new BookDts();
	                b.setBookId(rs.getInt("book_id"));
	                b.setBookName(rs.getString("book_name"));
	                b.setAuthor(rs.getString("author"));
	                b.setPrice(rs.getString("price"));
	                b.setBookCategory(rs.getString("bookCategory"));
	                b.setStatus(rs.getString("status"));
	                b.setPhoto(rs.getString("photo"));
	                b.setUserEmail(rs.getString("user_email"));
	                b.setAgeGroup(rs.getString("ageGroup"));
	                list.add(b);
	            }
	            rs.close();
	            ps.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return list;
	}
	@Override
	public List<BookDts> getAuthorBook() {
		 List<BookDts> list = new ArrayList<>();
	        try {
	            String sql = "SELECT * FROM book_dts WHERE status=? AND ageGroup='Author' ORDER BY book_id DESC ";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ps.setString(1, "Active");

	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                BookDts b = new BookDts();
	                b.setBookId(rs.getInt("book_id"));
	                b.setBookName(rs.getString("book_name"));
	                b.setAuthor(rs.getString("author"));
	                b.setPrice(rs.getString("price"));
	                b.setBookCategory(rs.getString("bookCategory"));
	                b.setStatus(rs.getString("status"));
	                b.setPhoto(rs.getString("photo"));
	                b.setUserEmail(rs.getString("user_email"));
	                b.setAgeGroup(rs.getString("ageGroup"));
	                list.add(b);
	            }
	            rs.close();
	            ps.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return list;
	}

	
	public List<BookDts> getBookByOld(String email, String cate) {
		{
			List<BookDts> list =new ArrayList<BookDts>();
			BookDts b=null;
			try {
				String sql="select * from book_dts where bookCategory=? and user_email=?";
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1, cate);
				ps.setString(2, email);
				
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					b=new BookDts();
					 b.setBookId(rs.getInt("book_id"));
		                b.setBookName(rs.getString("book_name"));
		                b.setAuthor(rs.getString("author"));
		                b.setPrice(rs.getString("price"));
		                b.setBookCategory(rs.getString("bookCategory"));
		                b.setStatus(rs.getString("status"));
		                b.setPhoto(rs.getString("photo"));
		                b.setUserEmail(rs.getString("user_email"));
		                b.setAgeGroup(rs.getString("ageGroup"));
		                list.add(b);
		                
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
	}

	@Override
	public boolean oldBookDelete(String email, String cate,int id) {
		boolean f=false;
		try {
			String sql="delete from book_dts where bookCategory=? and user_email=? and book_id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, cate);
            ps.setString(2, email);
            ps.setInt(3, id);
            
            int i = ps.executeUpdate();
            if (i == 1) f = true;

            ps.close();
            
            
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}

	public List<BookDts> getBookBySearch(String ch) {

	    List<BookDts> list = new ArrayList<>();
	    BookDts b = null;

	    try {
	        String sql = "SELECT * FROM book_dts " +
	                     "WHERE (book_name LIKE ? " +
	                     "OR bookCategory LIKE ? " +
	                     "OR author LIKE ? " +
	                     "OR ageGroup LIKE ?) " +
	                     "AND status = ?";

	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, "%" + ch + "%");
	        ps.setString(2, "%" + ch + "%");
	        ps.setString(3, "%" + ch + "%");
	        ps.setString(4, "%" + ch + "%");
	        ps.setString(5, "Active");

	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            b = new BookDts();
	            b.setBookId(rs.getInt("book_id"));
	            b.setBookName(rs.getString("book_name"));
	            b.setAuthor(rs.getString("author"));
	            b.setPrice(rs.getString("price"));
	            b.setBookCategory(rs.getString("bookCategory"));
	            b.setStatus(rs.getString("status"));
	            b.setPhoto(rs.getString("photo"));
	            b.setUserEmail(rs.getString("user_email"));
	            b.setAgeGroup(rs.getString("ageGroup"));
	            list.add(b);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}

	


   
}
