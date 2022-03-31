package cn.fby.ssm.controller;

import cn.fby.ssm.bean.Msg;
import cn.fby.ssm.pojo.Books;
import cn.fby.ssm.service.BooksService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class RestfulController {
    @Autowired
    private BooksService booksService;

    @GetMapping("/gotoBooks")
    public void gotoBooks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("books.jsp").forward(request,response);
    }

    @ResponseBody
    @GetMapping("/books")
    public Msg books(@RequestParam(value = "pageNum",defaultValue = "1") Integer pn){

        if (pn<1){
            pn = 1;
        }
        PageHelper.startPage(pn,5);
        List<Books> books = booksService.queryAllBook();
        PageInfo<Books> booksPageInfo = new PageInfo<>(books, 5);
//        将分页信息传入自定义类的returnData
        return Msg.success().add("booksPageInfo",booksPageInfo);
    }

    /*
    * books   要校验的数据 要加@Valid注解
    * result  校验的结果
    * */
    @ResponseBody
    @PostMapping("/books")
    public Msg bookAdd(@Valid Books books, BindingResult result){
        //创建一个错误的map集合
        System.out.println("==============");
        Map<String,Object> errorMap = new HashMap<>();
        if (result.hasErrors()){
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError error : errors) {
                System.out.println("error files:"+error.getField());
                System.out.println("error info:"+error.getDefaultMessage());
                //将字段名称作为Key 错误提示信息作为value 存入map
                errorMap.put(error.getField(),error.getDefaultMessage());
            }
            //将错误信息的map加入到返回的Msg中返回给页面
            return Msg.fail().add("errorMap",errorMap);
        }else {
            int i = booksService.addBook(books);
                return Msg.success();
        }


    }

    //根据id查询图书
    @ResponseBody
    @GetMapping("/books/{id}")
    public Msg  getBook(@PathVariable("id") Integer id){
        Books book = booksService.queryBookById(id);
        return Msg.success().add("book",book);
    }


    //更新图书
    /*
    *
    * */
    @ResponseBody
    @RequestMapping(value = "/books",method = RequestMethod.PUT)
    public Msg updateBook(Books books){
        System.out.println(books);
        int i = booksService.updateBook(books);
        if (i>0){
            return Msg.success().add("msg","success");
        }
        return Msg.fail().add("msg","error");
    }

    /*
    *根据id删除图书
    * */
    @ResponseBody
    @RequestMapping(value = "/books/{id}",method = RequestMethod.DELETE)
    public Msg deleteBook(@PathVariable("id") Integer id){
        int i = booksService.deleteBookById(id);
        if (i>0){
            return Msg.success().add("msg","success");
        }
        return Msg.fail().add("msg","error");
    }
}
