package com.xzlcPT.service.impl;

import com.xzlcPT.bean.XzMember;
import com.xzlcPT.dao.XzMemberMapper;
import com.xzlcPT.dao.XzResumeMapper;
import com.xzlcPT.service.XzMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/7/13.
 */
@Service("memberService")
public class XzMemberServiceImpl implements XzMemberService{

    @Autowired
    private XzMemberMapper memberMapper;
    @Autowired
    private XzResumeMapper resumeMapper;

    @Override
    public int updateMember(XzMember member) {
        int i2 = 1;
        int i1 = memberMapper.updateByPrimaryKeySelective(member);
        if(member.getResume()!=null){
            i2 = resumeMapper.updateByPrimaryKeySelective(member.getResume());

        }
        if(i1==1&&i2==1){
            return 1;
        }
        return 0;
    }
}
