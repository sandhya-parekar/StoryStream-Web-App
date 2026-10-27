package com.DAO;

import java.util.List;

import com.entity.BookDts;

public interface BookDAO  {

	
	public boolean addBooks(BookDts b);
	
	public List<BookDts> getAllBooks();
	
	public BookDts getBookById(int id);
	
	public boolean updateEditBooks(BookDts b);
	
	public boolean deleteBooks(int id);
	
	public List<BookDts> getChildrenBook();
	
	public List<BookDts> getTeensBooks();
	
	public List<BookDts> getEldersBooks();
	
	public List<BookDts> getAllChildrensBook();
	
	public List<BookDts> getAllTeensBook();
	
	public List<BookDts> getAllEldersBook();
	
	public List<BookDts> getAuthorBook();
	
	public List<BookDts>  getBookByOld(String email,String cate);
	
	public boolean  oldBookDelete(String email,String cate,int id);
	
	public List<BookDts> getBookBySearch(String ch);
	
	
	
	
}
