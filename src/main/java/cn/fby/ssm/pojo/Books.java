package cn.fby.ssm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.validation.constraints.Max;
import javax.validation.constraints.Pattern;


@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Books {
    //使用int好 还是包装类好 Integer
    private Integer id;
    @Pattern(regexp = "^[A-Za-z0-9_\\u2E80-\\u9FFF]{1,50}$",message = "中英文混合——后")
    private String bookName;
    @Max(value = 9999,message = "库存数量不能大于9999——后")
    private Integer bookCounts;
    @Pattern(regexp = "^[A-Za-z0-9_\\u2E80-\\u9FFF]{5,100}$",message = "必须是5~100个字符——后")
    private String detail;
}
