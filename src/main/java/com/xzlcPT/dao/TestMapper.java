package com.xzlcPT.dao;

import com.xzlcPT.bean.Test;

import java.util.List;

public interface TestMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Test record);

    List<Test> selectAll(Test test);

    int insertSelective(Test record);

    Test selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Test record);

    int updateByPrimaryKey(Test record);

    Test selectByTestB(String testB);
}