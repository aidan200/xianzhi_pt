package com.xzlcPT.service;

import com.xzlcPT.bean.XzMember;

/**
 * Created by Administrator on 2017/7/13.
 */
public interface XzMemberService {
    int updateMember(XzMember member);
    XzMember selXzMemberInf(Long memberId);
    int updateByPrimaryKeyInfo(XzMember record);
    int updateByPrimaryKeySelective(XzMember xzMember);
}
