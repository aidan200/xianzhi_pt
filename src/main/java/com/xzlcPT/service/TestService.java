package com.xzlcPT.service;

import com.util.PageBean;
import com.xzlcPT.bean.Test;

/**
 * Created by Administrator on 2017/3/16.
 */
public interface TestService {
    int deleteByPrimaryKey(Long id);

    int insert(Test record);

    PageBean<Test> selTestAll(Integer page, Integer rows, Test test);

    int updateTest(Test test);

    int deleteTest(Long id);

    Test selTestById(Long id);

    Test selectByTestB(String testB);

}
