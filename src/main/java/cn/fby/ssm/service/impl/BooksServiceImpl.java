package cn.fby.ssm.service.impl;

import cn.fby.ssm.mapper.BooksMapper;
import cn.fby.ssm.pojo.Books;
import cn.fby.ssm.service.BooksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BooksServiceImpl implements BooksService {
    @Autowired
    private BooksMapper booksMapper;

    @Override
    public int addBook(Books book) {
        return booksMapper.addBook(book);
    }

    @Override
    public int deleteBookById(int id) {
        return booksMapper.deleteBookById(id);
    }

    @Override
    public int updateBook(Books books) {
        return booksMapper.updateBook(books);
    }

    @Override
    public Books queryBookById(int id) {
        return booksMapper.queryBookById(id);
    }

    @Override
    public List<Books> queryAllBook() {
        return booksMapper.queryAllBook();
    }
}
