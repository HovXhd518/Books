package cn.fby.ssm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private Integer id;
    private String uName;
    private String pwd;
    private String email;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;
    private String pic;
    private Integer sex;
    private String phone;
}
