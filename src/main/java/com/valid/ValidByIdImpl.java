package com.valid;


import com.util.SpringUtil;
import com.xzlcPT.service.TestService;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.lang.reflect.Method;

/**
 * Created by SYHT01 on 2017/3/27.
 */
public class ValidByIdImpl implements ConstraintValidator<ValidById,String> {

    private Class serviceClass = null;
    private String methodName = "";

    @Override
    public void initialize(ValidById myValid) {
        serviceClass = myValid.serviceClazz();
        methodName= myValid.methodName();
        TestService.class.getName();
        //System.out.println(TestService.class.getName());
    }

    @Override
    public boolean isValid(String str, ConstraintValidatorContext constraintValidatorContext) {
        boolean b = false;
        if(str==null||str.equals("")) return b;
        String name = serviceClass.getSimpleName();
        name = name.substring(0, 1).toLowerCase() + name.substring(1);
        Object o = SpringUtil.getApp().getBean(name);
        try {
            Method m = serviceClass.getMethod(methodName,String.class);
            Object bean =  m.invoke(o,str);
            if(bean==null) b=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }
}
