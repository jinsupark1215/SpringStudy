package com.ssafy.model.repository;

import java.util.List;

import org.springframework.stereotype.Component;

import com.ssafy.model.dto.Book;

@Component("bookRepo")
public class BookRepositoryImpl implements BookRepository {

	public int insert(Book book) {
		System.out.println("insert Book" + book);
		return 0;
	}

	public int update(Book book) {
		System.out.println("update Book" + book);
		return 0;
	}

	public int delete(String isbn) {
		System.out.println("delete Book by isbn : " + isbn);
		return 0;
	}

	public Book select(String isbn) {
		System.out.println();
		return null;
	}

	public List<Book> selectAll() {
		System.out.println("selectAll Book");
		return null;
	}

}