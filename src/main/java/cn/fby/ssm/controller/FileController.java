package cn.fby.ssm.controller;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.FileInputStream;
import java.io.IOException;

@Controller
public class FileController {

    /*@RequestMapping("/file")
    public String filetest(){
        return "file";
    }*/

    @RequestMapping("/testDown")
    public ResponseEntity<byte[]> testResponseEntity(HttpSession session) throws IOException {
        ServletContext servletContext = session.getServletContext();
        //获取服务器的真实路径
        String realPath = servletContext.getRealPath("/filedir/rxdrd.pdf");
        //创建输入流
        FileInputStream is = new FileInputStream(realPath);
        //创建字节数组
        byte[] bytes = new byte[is.available()];
        //将流读取到自己数组
        is.read(bytes);
        //创建HttpHeader对象设置响应头
        MultiValueMap<String,String> headers = new HttpHeaders();
        //设置下载方式及下载文件名字
        headers.add("Content-Disposition","attachment;filename=rxdrd.pdf");
        //设置响应代码
        HttpStatus statusCode = HttpStatus.OK;
        //创建ResponseEntity 对象
        ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(bytes, headers, statusCode);
        //关闭输入流
        is.close();
        return responseEntity;
    }
}
