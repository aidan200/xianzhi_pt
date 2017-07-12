package com.valid;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Created by SYHT01 on 2017/3/27.
 * 自定义注解
 */
@Target({ElementType.FIELD, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy=ValidByIdImpl.class)
public @interface ValidById {
    //service class
    Class serviceClazz();
    //service 方法名
    String methodName();
    //验证失败消息
    String message();

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

}
