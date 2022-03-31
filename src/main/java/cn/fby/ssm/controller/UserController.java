package cn.fby.ssm.controller;

import cn.fby.ssm.bean.Msg;
import cn.fby.ssm.pojo.User;
import cn.fby.ssm.service.UserService;
import cn.fby.ssm.utils.UploadFileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @GetMapping("/user")
    public void gotoAddPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/jsp/user.jsp") .forward(request,response);
    }

    /*
    * 添加用户
    * user 普通字段的值 封装到user对象
    * file @RequestParam("file") file 必须和页面的文件字段的name 值保持同名
    * */
    @ResponseBody
    @PostMapping("/user")
    public Msg addUser(User user, @RequestParam("file") MultipartFile file,HttpServletRequest request) throws IOException {
        System.out.println(user);
        //判断上传文件不为空
        if (!file.isEmpty()){
            //文件上传要保存的路径
            String realPath = request.getServletContext().getRealPath("upload");
            //获取上传文件的名字
            String filename = file.getOriginalFilename();
            System.out.println(filename);
            //判断文件的类型和大小
            if (!UploadFileUtils.isImageFile(filename)){
                return Msg.fail().add("info","文件类型不匹配");
            }
            //给上传的文件重命名
            filename = UploadFileUtils.imgReName(filename);
            System.out.println(filename);
            // 创建文件实例
            File filePath = new File(realPath, filename);
            //判断目录是否存在 不存在则创建
            if (!filePath.getParentFile().exists()) {
                filePath.getParentFile().mkdirs();
                System.out.println("创建目录" + filePath);
            }
            //给User对象的pic属性 赋值
            user.setPic("upload/"+filename);
            //写入文件 将上传的文件复制到目录
            file.transferTo(filePath);
            //添加对象
        }

        int i = userService.addUser(user);
        if(i>0){
            return Msg.success().add("info","用户添加成功");
        }
        return Msg.fail();
    }





}
