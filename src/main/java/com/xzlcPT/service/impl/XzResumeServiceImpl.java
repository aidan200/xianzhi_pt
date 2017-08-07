package com.xzlcPT.service.impl;

import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.*;
import com.xzlcPT.dao.XzFieldMapper;
import com.xzlcPT.dao.XzResumeMapper;
import com.xzlcPT.dao.XzResumeSkillMapper;
import com.xzlcPT.service.XzResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.Field;
import java.util.*;

/**
 * Created by Administrator on 2017/7/10.
 */
@Service("resumeService")
public class XzResumeServiceImpl implements XzResumeService{
    @Autowired
    private XzResumeMapper resumeMapper;
    @Autowired
    private XzFieldMapper fieldMapper;
    @Autowired
    private XzResumeSkillMapper resumeSkillMapper;

    @Override
    public XzResume selectById(Long resumeId) {
        return resumeMapper.selectByPrimaryKey(resumeId);
    }

    @Override
    public XzResume selectByMemberId(Long memberId) {
        return resumeMapper.selectByMemberId(memberId);
    }

    @Override
    public int updateResumeByFore(XzResume resume) {
        if(resume.getResumeWorkinglife()!=null){
            int year = Integer.parseInt(resume.getResumeWorkinglife());
            Calendar a= Calendar.getInstance();
            int i = a.get(Calendar.YEAR);
            resume.setResumeIntentYm(i-year);
        }
        //刷新简历
        resume.setResumeFlash(new Date());
        int i = resumeMapper.updateByPrimaryKeySelective(resume);
        if(resume.getFields()!=null&&resume.getFields().size()!=0){
            Map map = new HashMap<>();
            map.put("resumeId",resume.getResumeId());
            map.put("fieldType",resume.getFields().get(0).getFieldType());
            int i2 = fieldMapper.deleteByResumeDomain(map);
            int i3 = 1;
            for (XzField xzField : resume.getFields()) {
                map = new HashMap<>();
                map.put("resumeId",resume.getResumeId());
                map.put("fieldId",xzField.getFieldId());
                int i4 = fieldMapper.insertByResumeDomain(map);
                if(i4!=1){
                    i3 = i4;
                }
            }
            if(!(i2>0&&i3>0)){
                i = 0;
            }
        }
        updateCompletionById(resume.getResumeId());
        return i;
    }

    @Override
    public XzResume selResumeInformation(Long resumeId) {
       XzResume xzResume=resumeMapper.selResumeInformation(resumeId);
        /*List<XzField> fieldList=xzResume.getFields();
        Map map=new HashMap();
        List<XzField> flist=new ArrayList<>();
        for (int i=0;i<fieldList.size();i++){
            Long fieldId=fieldList.get(i).getFieldId();
            map.put("fieldId",fieldId);
            XzField xzField=fieldMapper.selectByFieldId(map);
            flist.add(xzField);
        }
        xzResume.setFields(flist);*/
        return xzResume;
    }

    @Override
    public PageBean<XzResume> selectRcount(Integer page, Integer rows, Map map) {
        if (map.get("resumeMm")!=null) {
            String resumeMm = map.get("resumeMm").toString();
            String[] resumeMms = resumeMm.split("-|万|以上");
            int resumeMmMin = Integer.parseInt(resumeMms[0].toString());
            int a=resumeMmMin*10000/12;
            map.put("resumeMmMin", a);
            if (resumeMmMin!=100) {
                int resumeMmMax = Integer.parseInt(resumeMms[1].toString());
                int b=resumeMmMax*10000/12;
                map.put("resumeMmMax", b);
            }
        }
        if (map.get("resumeBirth")!=null){
            String resumeBirth=map.get("resumeBirth").toString();
            String[] resumeBirths=resumeBirth.split("-");
            int resumeBirthMin=Integer.parseInt(resumeBirths[0]);
            int resumeBirthMax=Integer.parseInt(resumeBirths[1]);
            map.put("resumeBirthMin",resumeBirthMin);
            map.put("resumeBirthMax",resumeBirthMax);
        }
        if (map.get("resumeSex")!=null){
            String resumeSex=map.get("resumeSex").toString();
            if (resumeSex.equals("男")){
                map.put("resumeSex",0);
            }else if (resumeSex.equals("女")){
                map.put("resumeSex",1);
            }
        }

        PageHelper.startPage(page,rows);
        List<XzResume> rlist=resumeMapper.selectRcount(map);
        PageBean<XzResume> pageBean=new PageBean<>(rlist);
        List<XzResume> tlist=pageBean.getList();
        List list=new ArrayList<>();
        for (XzResume xzResume :tlist){
            list.add(xzResume.getResumeId());
        }
        map.put("list",list);
        List<XzResume> resumeList=resumeMapper.selResumeByConditions(map);
       List<XzResumeEducation> elist=new ArrayList<>();
        for(int i=0;i<resumeList.size();i++){
          if (resumeList.get(i).getXzResumeEducations().size()>1){
              elist=resumeList.get(i).getXzResumeEducations().subList(0,1);
              resumeList.get(i).setXzResumeEducations(elist);
          }
        }
        List<XzJobExp> jlist=new ArrayList<>();
        for (int i=0;i<resumeList.size();i++){
            if (resumeList.get(i).getJobExps().size()>1){
                jlist=resumeList.get(i).getJobExps().subList(0,1);
                resumeList.get(i).setJobExps(jlist);
            }
        }
        pageBean.setList(resumeList);
        return pageBean;
    }
    //收藏简历
    @Override
    public int insertCollect(Map map) {
       int i=resumeMapper.insertCollect(map);
        return i;
    }
    //删除收藏
    @Override
    public int deleteCollect(Long collectId) {
        int i=resumeMapper.deleteCollect(collectId);
        return i;
    }

    @Override
    public List<XzResume> selectCollect(Long companyId) {
        List<XzResume> resumeList=resumeMapper.selectCollect(companyId);
        return resumeList;
    }
    //按条件查询简历
    @Override
    public PageBean<XzResume> selResume(Integer page, Integer rows, Map map) {
        PageHelper.startPage(page,rows);
        List<XzResume> rlist=resumeMapper.selResume(map);
        PageBean<XzResume> pageBean=new PageBean<>(rlist);
        return pageBean;
    }

    //修改完成度
    public XzResume updateCompletionById(Long id) {
        //System.out.println(id+"++++++++++++++++++++++");
        XzResume resume = resumeMapper.selResumeInformation(id);
        //System.out.println("------------------------------------------------------------");
        //System.out.println(resume);
        Class c = XzResume.class;
        Field [] fs = c.getDeclaredFields();
        int count = 0;
        int size = 0;
        try {
            for (Field f : fs) {
                if(f.getName().startsWith("resume")||f.getType().equals(List.class)){
                    if(!f.getName().equals("resumeId")){
                        f.setAccessible(true);
                        size++;
                        if(f.getType().equals(List.class)){
                            List ol = (List) f.get(resume);
                            if(ol!=null&&ol.size()!=0){
                               //System.out.println(f.getName()+"----"+ol.size());
                                count++;
                            }
                        }else{
                            Object o = f.get(resume);
                            if(o!=null&&!o.equals("")){
                               //System.out.println(f.getName());
                                count++;
                            }
                        }
                    }
                }
            }
            //System.out.println("------------------------------------------------------------");
            //System.out.println(count+"====="+size);
            //System.out.println(new Double(Math.floor(count*1.0/size*100)).intValue());
            resume.setResumeCompletion(new Double(Math.floor(count*1.0/size*100)).intValue());
            resumeMapper.updateByPrimaryKeySelective(resume);
            //System.out.println("------------------------------------------------------------");
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

}
