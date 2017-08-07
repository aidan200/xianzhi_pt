package com.xzlcPT.service.impl;

import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.Test;
import com.xzlcPT.dao.TestMapper;
import com.xzlcPT.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Administrator on 2017/3/16.
 */
@Service("testService")
public class TestServiceImpl implements TestService {

    @Autowired
    private TestMapper testMapper;

    public int deleteByPrimaryKey(Long id) {
        testMapper.deleteByPrimaryKey(id);
        return 0;

    }

    public int insert(Test test) {
        testMapper.insert(test);
        return 0;
    }

    public PageBean<Test> selTestAll(Integer page,Integer rows,Test test) {
        PageHelper.startPage(page,rows);
        List<Test> tList = testMapper.selectAll(test);
        return new PageBean<Test>(tList);
    }

    public int saveTest(Test test){
        int i = testMapper.insert(test);
        return i;
    }

    @Override
    public int updateTest(Test test) {
        int i = testMapper.updateByPrimaryKey(test);
        return i;
    }

    @Override
    public int deleteTest(Long id) {
        int i = testMapper.deleteByPrimaryKey(id);
        return i;
    }

    @Override
    public Test selTestById(Long id) {
        return testMapper.selectByPrimaryKey(id);
    }

    @Override
    public Test selectByTestB(String testB) {
        return testMapper.selectByTestB(testB);
    }


}
