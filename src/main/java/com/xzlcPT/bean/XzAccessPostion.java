package com.xzlcPT.bean;
//用户浏览简历历史记录
public class XzAccessPostion {
    private Long accessId;

    private Long memberId;

    private Long postionId;

    private Long accessTime;

    public Long getAccessId() {
        return accessId;
    }

    public void setAccessId(Long accessId) {
        this.accessId = accessId;
    }

    public Long getMemberId() {
        return memberId;
    }

    public void setMemberId(Long memberId) {
        this.memberId = memberId;
    }

    public Long getPostionId() {
        return postionId;
    }

    public void setPostionId(Long postionId) {
        this.postionId = postionId;
    }

    public Long getAccessTime() {
        return accessTime;
    }

    public void setAccessTime(Long accessTime) {
        this.accessTime = accessTime;
    }
}