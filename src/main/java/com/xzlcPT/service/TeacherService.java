package com.xzlcPT.service;

import com.util.PageBean;
import com.xzlcPT.bean.Teacher;

/**
 * 	师资service
 *  Create by 王诗钰 2017/4/17
 */
public interface TeacherService {

    /**插入一条数据*/
    int insert (Teacher record);

    /**插入一条数据(和上一个没区别，用哪个都行)*/
    int saveTeacher(Teacher tea);

    /**删除一条数据*/
    int deleteTeacher(Teacher tea);

    /**删除一条数据(和上一个没区别，用哪个都行)*/
    int deleteByPrimaryKey(Teacher tea);

    /**修改一条数据*/
    int updateTeacher(Teacher tea);

    /**根据主键查询一条数据*/
    Teacher selectByPrimaryKey(Long teacherId);

    /**根据教师姓名查询一条数据*/
    Teacher selectByTeacherName(String teacherName);

    /**后台查询所有数据*/
    PageBean<Teacher> selectTeacherAllEnd(Integer page,Integer rows,Teacher tea);

    /**前台查询所有数据*/
    PageBean<Teacher> selectTeacherAll(Integer page,Integer rows,Teacher tea);
}
