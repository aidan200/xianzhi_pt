package com.xzlcPT.service.impl;

import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.Teacher;
import com.xzlcPT.dao.TeacherMapper;
import com.xzlcPT.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 	师资serviceImpl
 *  Create by 王诗钰 2017/4/17
 */
@Service("teacherService")
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private TeacherMapper teacherMapper;

    /**插入一条数据*/
    public int insert (Teacher record){
        teacherMapper.insert(record);
        return 0;
    }

    /**插入一条数据(和上一个没区别，用哪个都行)*/
    public int saveTeacher(Teacher tea){
        int i = teacherMapper.insert(tea);
        return i;
    }

    /**删除一条数据*/
    public int deleteTeacher(Teacher teacherId){
        int i = teacherMapper.deleteByPrimaryKey(teacherId);
        return i;
    }

    /**删除一条数据(和上一个没区别，用哪个都行)*/
    @Override
    public int deleteByPrimaryKey(Teacher tea){
        teacherMapper.deleteByPrimaryKey(tea);
        return 0;
    }

    /**修改一条数据*/
    @Override
    public int updateTeacher(Teacher tea){
        int i = teacherMapper.updateByPrimaryKey(tea);
        return i;
    }

    /**根据主键查询一条数据*/
    @Override
    public Teacher selectByPrimaryKey(Long teacherId){
        return teacherMapper.selectByPrimaryKey(teacherId);
    }

    /**根据教师姓名查询一条数据*/
    @Override
    public Teacher selectByTeacherName(String teacherName){
        return teacherMapper.selectByTeacherName(teacherName);
    }

    /**后台查询所有数据*/
    public PageBean<Teacher> selectTeacherAllEnd(Integer page, Integer rows, Teacher tea){
        PageHelper.startPage(page,rows);
        List<Teacher> teaList = teacherMapper.selectTeacherAllEnd(tea);
        return new PageBean<Teacher>(teaList);
    }

    /**前台查询所有数据*/
    public PageBean<Teacher> selectTeacherAll(Integer page, Integer rows, Teacher tea) {
        PageHelper.startPage(page, rows);
        List<Teacher> teaList = teacherMapper.selectTeacherAll(tea);
        return new PageBean<Teacher>(teaList);
    }
}
