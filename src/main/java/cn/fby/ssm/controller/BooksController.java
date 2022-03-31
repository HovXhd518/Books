package cn.fby.ssm.controller;

import cn.fby.ssm.pojo.Books;
import cn.fby.ssm.service.BooksService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/book")
public class BooksController {
    @Autowired
    private BooksService booksService;


    @GetMapping("/add")
    public void addbook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/jsp/addBook.jsp").forward(request,response);
    }


//    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @PostMapping("/add")
    public String addBook(Model model,Books book){
        String msg = "hello book";
//    添加图书
//        Books book = new Books();
//        book.setBookName("钢铁是怎样练成的");
//        book.setBookCounts(10);
//        book.setDetail("这是俄国的一部小说");
        int  i = booksService.addBook(book);
        if(i>0){
            msg = "添加图书成功";
        }

        model.addAttribute("msg",msg);
        return "book";
    }

    /*
    * 查询所有的图书
    *  pn 当前页码  如果没有则默认是第1页
    *  model
    *
    * */
    //查询所有的图书
    @GetMapping("getBook")
    public String getBooks(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
//        获取第1页，10条内容，默认查询总数count
//        当前第几页是由谁决定的? 请求
        PageHelper.startPage(pn,5);

        List<Books> books = booksService.queryAllBook();
        //紧跟着的第一个select方法会被分页
        PageInfo  pageInfo = new PageInfo(books);
//        pageInfo.setNavigatePages(5);
//返回给页面一个 pageInfo
        model.addAttribute("pageInfo",pageInfo);
        return "bookList";
    }

}
