package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.Book;
import com.ssafy.model.repository.BookRepository;

public class BookServiceImpl implements BookService {
	private BookRepository bookRepo;

	public BookServiceImpl(BookRepository repo) {
		this.bookRepo = repo;
	}
	
	public int insert(Book book) {
		return bookRepo.insert(book);
	}

	public int update(Book book) {
		return bookRepo.update(book);
	}

	public int delete(String isbn) {
		return bookRepo.delete(isbn);
	}

	public Book select(String isbn) {
		return bookRepo.select(isbn);
	}

	public List<Book> selectAll() {
		return bookRepo.selectAll();
	}

}