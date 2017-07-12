package com.xzlcPT.bean;


import com.valid.ValidById;
import com.xzlcPT.service.TestService;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.GroupSequence;

public class Test {
    private Long id;
    @NotEmpty(message="testA: 不能为空",groups = {F1.class})
    private String testA;
    //自定义数据判重验证
    @ValidById(serviceClazz = TestService.class,message = "testB不能重复",methodName = "selectByTestB",groups = {F2.class})
    private String testB;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTestA() {
        return testA;
    }

    public void setTestA(String testA) {
        this.testA = testA == null ? null : testA.trim();
    }

    public String getTestB() {
        return testB;
    }

    public void setTestB(String testB) {
        this.testB = testB == null ? null : testB.trim();
    }

    @Override
    public String toString() {
        return "Test{" +
                "id=" + id +
                ", testA='" + testA + '\'' +
                ", testB='" + testB + '\'' +
                '}';
    }
    //验证分组1
    public interface F1{

    }
    //验证分组2
    public interface F2{

    }
    //组序列
    @GroupSequence( { F1.class, F2.class })
    public interface Group {

    }
}