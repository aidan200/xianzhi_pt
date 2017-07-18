<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/3
  Time: 18:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>


    <title>首页</title>
    <jsp:include page="distforeEnd.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd3/css/zp_index.css">


    <script>//搜索框焦点事件
    $(function (){
        $('#zp_index_xxk').on('focus',function (){
            $(this).css({
                "borderColor":"#46BEF2",
                "borderWidth":"2"
            })
            $(".zp_index_arrow").css({
                "borderColor":"#46BEF2",
                "border-bottom-width":"2px",
                "border-left-width":"2px"
            })
        });
        $('#zp_index_xxk').on('blur',function (){
            $(this).css({
                "borderColor":"#3689B3",
                "borderWidth":"1"
            })
            $(".zp_index_arrow").css({
                "borderColor":"#3689B3",
                "border-bottom-width":"1px",
                "border-left-width":"1px"
            })
        })
    })
    </script>
</head>
<body>
<jsp:include page="headerforeEnd.jsp"/>
<section class="container zp_index_cont">
    <div class="row">
        <div class="col-md-8 zp_index_cont_left">
            <div class="zp_index_cont_left_top">
                <div class="zp_index_cont_wbk">
                    <form action="">
                        <input id="zp_index_xxk" type="text" placeholder="前端开发">
                        <div class="zp_index_arrow"></div>
                        <button class="zp_index_xxk_btn">
                            <span class="fa fa-search fa-2x" style="color: #ffffff"></span>
                        </button>
                    </form>


                </div>
                <p><span>默认条件:沈阳</span> <a href="${pageContext.request.contextPath}/Postion/selPostionIndex.do">更多搜索条件</a></p>
            </div>
            <div class="zp_index_cont_left_zwtj">
                <h3>职位推荐&nbsp;&nbsp;<span class="fa fa-caret-down"></span></h3>
            </div>
            <div class="zp_index_cont_left_zwtj_cont">
                <ul>
                    <li>
                        <i><b>民</b></i>
                        <div class="zp_index_cont_left_zwtj_cont_left">
                            <h4>WEB前端研发工程师</h4>
                            <p> <span>面议</span>&nbsp;&nbsp;|&nbsp;&nbsp;沈阳&nbsp;&nbsp;|&nbsp;&nbsp;本科&nbsp;&nbsp;及以上&nbsp;&nbsp;|&nbsp;&nbsp;3年经验</p>
                            <span>2017-06-08</span>
                        </div>
                        <div class="zp_index_cont_left_zwtj_cont_right">
                            <p>东软集团</p>
                            <p>互联网/移动互联网/电子商务,IT服务/系统集成,计算机软件</p>
                            <p class="zp_index_cont_bz"><span>带薪年假</span><span>交通补助</span><span>定期体检</span></p>
                        </div>
                    </li>
                    <li>
                        <i><b>国</b></i>
                        <div class="zp_index_cont_left_zwtj_cont_left">
                            <h4>WEB前端研发工程师</h4>
                            <p> <span>面议</span>&nbsp;&nbsp;|&nbsp;&nbsp;沈阳&nbsp;&nbsp;|&nbsp;&nbsp;本科&nbsp;&nbsp;及以上&nbsp;&nbsp;|&nbsp;&nbsp;3年经验</p>
                            <span>2017-06-08</span>
                        </div>
                        <div class="zp_index_cont_left_zwtj_cont_right">
                            <p>东软集团</p>
                            <p>互联网/移动互联网/电子商务,IT服务/系统集成,计算机软件</p>
                            <p class="zp_index_cont_bz"><span>带薪年假</span><span>交通补助</span><span>定期体检</span></p>
                        </div>
                    </li>
                    <li>
                        <i><b>外</b></i>
                        <div class="zp_index_cont_left_zwtj_cont_left">
                            <h4>WEB前端研发工程师</h4>
                            <p> <span>面议</span>&nbsp;&nbsp;|&nbsp;&nbsp;沈阳&nbsp;&nbsp;|&nbsp;&nbsp;本科&nbsp;&nbsp;及以上&nbsp;&nbsp;|&nbsp;&nbsp;3年经验</p>
                            <span>2017-06-08</span>
                        </div>
                        <div class="zp_index_cont_left_zwtj_cont_right">
                            <p>东软集团</p>
                            <p>互联网/移动互联网/电子商务,IT服务/系统集成,计算机软件</p>
                            <p class="zp_index_cont_bz"><span>带薪年假</span><span>交通补助</span><span>定期体检</span></p>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="zp_index_cont_left_zwtj_gdzw">
                <a href="">查看更多职位</a>
            </div>
        </div>
        <div class="col-md-4 zp_index_cont_right">
            <div class="zp_index_cont_right_top">
                <div>
                    <div class="zp_index_cont_right_top_left">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/boy.png" alt="" width="100%" height="100%">
                    </div>
                    <div class="zp_index_cont_right_top_right">
                        <span>${resume.resumeName}</span>
                        <p>前端开发</p>
                        <p>沈阳先知蓝创</p>
                    </div>
                </div>
                <p> <span>沈阳</span>&nbsp;|&nbsp;<span>互联网电商</span>&nbsp;|&nbsp;<span>工作3年</span></p>
                <ul>
                    <li class="col-md-3"><a href=""><span>刷新简历</span></a></li>
                    <li class="col-md-3"><a href="${pageContext.request.contextPath}/view/foreEnd3/zp_jianli.html?resumId=${resume.resumeId}"><span>编辑简历</span></a></li>
                    <li class="col-md-3"><a href=""><span>账号设置</span></a></li>
                    <li class="col-md-3"><a href=""><span>金卡服务</span></a></li>
                </ul>
            </div>
            <div class="zp_index_cont_right_middle">
                <p><i></i>隐私设置</p>
                <ul>
                    <li>
                        <span>社交名片:</span>
                        <div>
                            <select class="form-control">
                                <option>所有人都能看到</option>
                                <option></option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                    </li>
                    <li>
                        <span>求职简历:</span>
                        <div>
                            <select class="form-control">
                                <option>开放简历</option>
                                <option></option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="zp_index_cont_right_bottom">
                <div class="zp_index_cont_right_bottom_top">
                    <p>简&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历</p>
                    <div>
                        <div class="col-lg-7">
                            <h4>60%&nbsp;&nbsp;<span>06-29&nbsp;13:07</span></h4>
                        </div>
                        <div class="col-lg-5 zp_index_cont_right_bottom_right">
                            <ul>
                                <li>2</li>
                                <li>2</li>
                                <li>2</li>
                                <li>2</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="zp_index_cont_right_bottom_middle">
                    <p><span>谁看过我的简历</span></p>
                    <ul>
                        <li>
                            <div class="zp_index_ww1"><span>0</span></div>
                            <div class="zp_index_ww2">
                                <p><a href=""><span>0</span>个人看过你的简历</a></p>
                                <p><span>0</span>刷新简历能增加被查看概率</p>

                            </div>
                        </li>
                        <li>
                            <div class="zp_index_ww1"><span>0</span></div>
                            <div class="zp_index_ww2">
                                <p><a href=""><span>0</span>家企业HR查看过</a></p>
                                <p><span>0</span>刷新简历能增加被查看概率</p>

                            </div>
                        </li>
                    </ul>
                </div>
                <div class="zp_index_cont_right_bottom_bottom">
                    <p><span>谁看过我的简历</span></p>
                    <div>
                        <div class="zp_index_ww1"><span>0</span></div>
                        <div class="zp_index_ww2">
                            <p><a href=""><span>0</span>家企业HR查看过</a></p>
                            <p><span>0</span>刷新简历能增加被查看概率</p>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>





</body>
</html>
