package com.xzlcPT.bean;/**
 * Created by Administrator on 2017/7/20.
 */

/**
 * @author 甘汝雷
 * @create 2017-07-20 12:58
 **/
public class XzShield {
    private Long shieldId;
    private Long resumeId;
    private Long companyId;

    public void setShieldId(Long shieldId) {
        this.shieldId = shieldId;
    }

    public Long getShieldId() {
        return shieldId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }

    public Long getCompanyId() {
        return companyId;
    }

    public void setResumeId(Long resumeId) {
        this.resumeId = resumeId;
    }

    public Long getResumeId() {
        return resumeId;
    }
}
