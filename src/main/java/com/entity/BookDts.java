package com.entity;

public class BookDts {

    private int bookId;
    private String bookName;
    private String author;
    private String price;
    private String bookCategory;
    private String status;
    private String photo;
    private String userEmail;
    private String ageGroup;
    private String description; 
    
   
   
   


    // Constructor without bookId (for insert)
    public BookDts(String bookName, String author, String price, String bookCategory,
                   String status, String photo, String userEmail, String ageGroup, String description) {
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.bookCategory = bookCategory;
        this.status = status;
        this.photo = photo;
        this.userEmail = userEmail;
        this.ageGroup = ageGroup;
        this.description = description;
    }

    public BookDts() {
		// TODO Auto-generated constructor stub
	}

	// Getters and Setters
    public int getBookId() { return bookId; }
    public void setBookId(int bookId) { this.bookId = bookId; }

    public String getBookName() { return bookName; }
    public void setBookName(String bookName) { this.bookName = bookName; }

    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }

    public String getPrice() { return price; }
    public void setPrice(String price) { this.price = price; }

    public String getBookCategory() { return bookCategory; }
    public void setBookCategory(String bookCategory) { this.bookCategory = bookCategory; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getPhoto() { return photo; }
    public void setPhoto(String photo) { this.photo = photo; }

    public String getUserEmail() { return userEmail; }
    public void setUserEmail(String userEmail) { this.userEmail = userEmail; }

    public String getAgeGroup() { return ageGroup; }
    public void setAgeGroup(String ageGroup) { this.ageGroup = ageGroup; }
    
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    
   

   

    @Override
    public String toString() {
        return "BookDts [bookId=" + bookId + ", bookName=" + bookName + ", author=" + author + ", price=" + price
                + ", bookCategory=" + bookCategory + ", status=" + status + ", photo=" + photo + ", userEmail="
                + userEmail + ", ageGroup=" + ageGroup + "]";
    }
}
