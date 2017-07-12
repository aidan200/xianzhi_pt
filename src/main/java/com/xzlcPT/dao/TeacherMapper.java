package com.xzlcPT.dao;

import com.xzlcPT.bean.Teacher;

import java.util.List;

/**
 * 	师资dao
 *  Create by 王诗钰 2017/4/17
 */
public interface TeacherMapper {

    /**插入一条数据*/
    int insert(Teacher record);

    /**删除一条数据*/
    int deleteByPrimaryKey(Teacher record);

    /**修改一条数据*/
    int updateByPrimaryKey(Teacher record);

    /**根据主键查询一条数据*/
    Teacher selectByPrimaryKey(Long teacherId);

    /**根据教师姓名查询一条数据*/
    Teacher selectByTeacherName(String teacherName);

    /**后台查询所有数据*/
    List<Teacher> selectTeacherAllEnd(Teacher tea);

    /**前台查询所有数据*/
    List<Teacher> selectTeacherAll(Teacher tea);
}
