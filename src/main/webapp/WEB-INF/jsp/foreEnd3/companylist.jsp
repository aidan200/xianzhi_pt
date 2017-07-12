<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/7/12
  Time: 17:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="distforeEnd.jsp"/>
    <!--轮播-->
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/lib/jquery/jquery.color.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/index_lunbo.js"></script>
    <script>
        $(function () {
            m_lo1("#companylist")
        })
    </script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/company.js"></script>
</head>
<body>

<jsp:include page="headerforeEnd.jsp"/>
<div id="companylist">
    <h4></h4>
    <div style="background-image:url('${pageContext.request.contextPath}/dist/foreEnd3/img/v4.jpg');z-index:2"></div>
    <div style="background-image:url('${pageContext.request.contextPath}/dist/foreEnd3/img/index_1.jpg');z-index:2"></div>
    <div style="background-image:url('${pageContext.request.contextPath}/dist/foreEnd3/img/index_1.jpg');z-index:2"></div>

    <!--列表菜单-->
    <section class="com_list">
        <ul class="com_lu">
            <li class="com_li1 com_s com_one">
                <h4><b>技术</b></h4>
                <ul class="com_lu2">
                    <li><a href="###">PHP</a></li>
                    <li><a href="###">java</a></li>
                    <li><a href="###">数据挖掘</a></li>
                    <li><a href="###">iOS</a></li>
                    <li><a href="###">Html5</a></li>
                    <li><a href="###">Web前端</a></li>
                </ul>
            </li>
            <li class="com_li1 com_s com_two">
                <h4><b>产品</b></h4>
                <ul class="com_lu2">
                    <li><a href="###">产品经理</a></li>
                    <li><a href="###">移动产品经理</a></li>
                    <li><a href="###">数据挖掘</a></li>
                    <li><a href="###">产品总监</a></li>
                    <li><a href="###">电商产品经理</a></li>
                </ul>
            </li>
            <li class="com_li1 com_s com_three">
                <h4><b>设计</b></h4>
                <ul class="com_lu2">
                    <li><a href="###">UI设计师</a></li>
                    <li><a href="###">APP设计师</a></li>
                    <li><a href="###">交互设计师</a></li>
                    <li><a href="###">设计总监</a></li>
                </ul>
            </li>
            <li class="com_li1 com_four">
                <h4><b>运营</b></h4>
                <ul class="com_lu2">
                    <li><a href="###">内容运营</a></li>
                    <li><a href="###">产品运营</a></li>
                    <li><a href="###">用户运营</a></li>
                    <li><a href="###">新媒体运营</a></li>
                    <li><a href="###">游戏运营</a></li>
                </ul>
            </li>
        </ul>

        <!--搜索-->
        <div class="com_input1">
            <form action="">
                <div class="com_ia">
                    <input type="text" class="com_in">
                    <button type="submit">搜 索</button>
                </div>
            </form>
        </div>

        <!--隐藏的列表-->
        <div class="com_moreu1">
            <ul>
                <li>
                    <h4><b>开发</b></h4>
                    <ul class="com_morein">
                        <li><a href="###">Java</a></li>
                        <li><a href="###">Php</a></li>
                        <li><a href="###">Python</a></li>
                        <li><a href="###">Ruby</a></li>
                        <li><a href="###">Node.JS</a></li>
                        <li><a href="###">.NET</a></li>
                        <li><a href="###">ASP</a></li>
                        <li><a href="###">C#</a></li>
                        <li><a href="###">C++</a></li>
                        <li><a href="###">C</a></li>
                        <li><a href="###">Delphi</a></li>
                        <li><a href="###">数据挖掘</a></li>
                        <li><a href="###">自然语言处理</a></li>
                        <li><a href="###">推荐系统</a></li>
                        <li><a href="###">搜索引擎</a></li>
                        <li><a href="###">全栈工程师</a></li>
                    </ul>
                    <div style="clear: both"></div>
                </li>
                <li>
                    <h4><b>开发</b></h4>
                    <ul class="com_morein">
                        <li><a href="###">Java</a></li>
                        <li><a href="###">Php</a></li>
                        <li><a href="###">Python</a></li>
                        <li><a href="###">Ruby</a></li>
                        <li><a href="###">Node.JS</a></li>
                        <li><a href="###">.NET</a></li>
                        <li><a href="###">ASP</a></li>
                        <li><a href="###">C#</a></li>
                        <li><a href="###">C++</a></li>
                        <li><a href="###">C</a></li>
                        <li><a href="###">Delphi</a></li>
                        <li><a href="###">数据挖掘</a></li>
                        <li><a href="###">自然语言处理</a></li>
                        <li><a href="###">推荐系统</a></li>
                        <li><a href="###">搜索引擎</a></li>
                        <li><a href="###">全栈工程师</a></li>
                    </ul>
                    <div style="clear: both"></div>
                </li>
                <li>
                    <h4><b>开发</b></h4>
                    <ul class="com_morein">
                        <li><a href="###">Java</a></li>
                        <li><a href="###">Php</a></li>
                        <li><a href="###">Python</a></li>
                        <li><a href="###">Ruby</a></li>
                        <li><a href="###">Node.JS</a></li>
                        <li><a href="###">.NET</a></li>
                        <li><a href="###">ASP</a></li>
                        <li><a href="###">C#</a></li>
                        <li><a href="###">C++</a></li>
                        <li><a href="###">C</a></li>
                        <li><a href="###">Delphi</a></li>
                        <li><a href="###">数据挖掘</a></li>
                        <li><a href="###">自然语言处理</a></li>
                        <li><a href="###">推荐系统</a></li>
                        <li><a href="###">搜索引擎</a></li>
                        <li><a href="###">全栈工程师</a></li>
                    </ul>
                    <div style="clear: both"></div>
                </li>
                <li>
                    <h4><b>开发</b></h4>
                    <ul class="com_morein">
                        <li><a href="###">Java</a></li>
                        <li><a href="###">Php</a></li>
                        <li><a href="###">Python</a></li>
                        <li><a href="###">Ruby</a></li>
                        <li><a href="###">Node.JS</a></li>
                        <li><a href="###">.NET</a></li>
                        <li><a href="###">ASP</a></li>
                        <li><a href="###">C#</a></li>
                        <li><a href="###">C++</a></li>
                        <li><a href="###">C</a></li>
                        <li><a href="###">Delphi</a></li>
                        <li><a href="###">数据挖掘</a></li>
                        <li><a href="###">自然语言处理</a></li>
                        <li><a href="###">推荐系统</a></li>
                        <li><a href="###">搜索引擎</a></li>
                        <li><a href="###">全栈工程师</a></li>
                    </ul>
                    <div style="clear: both"></div>
                </li>
                <li>
                    <h4><b>开发</b></h4>
                    <ul class="com_morein">
                        <li><a href="###">Java</a></li>
                        <li><a href="###">Php</a></li>
                        <li><a href="###">Python</a></li>
                        <li><a href="###">Ruby</a></li>
                        <li><a href="###">Node.JS</a></li>
                        <li><a href="###">.NET</a></li>
                        <li><a href="###">ASP</a></li>
                        <li><a href="###">C#</a></li>
                        <li><a href="###">C++</a></li>
                        <li><a href="###">C</a></li>
                        <li><a href="###">Delphi</a></li>
                        <li><a href="###">数据挖掘</a></li>
                        <li><a href="###">自然语言处理</a></li>
                        <li><a href="###">推荐系统</a></li>
                        <li><a href="###">搜索引擎</a></li>
                        <li><a href="###">全栈工程师</a></li>
                    </ul>
                    <div style="clear: both"></div>
                </li>
            </ul>
        </div>
        <div class="com_moreu2">
            <ul>
                <li>
                    <h4><b>开发</b></h4>
                    <ul class="com_morein">
                        <li><a href="###">Java</a></li>
                        <li><a href="###">Php</a></li>
                        <li><a href="###">Python</a></li>
                        <li><a href="###">Ruby</a></li>
                        <li><a href="###">Node.JS</a></li>
                        <li><a href="###">.NET</a></li>
                        <li><a href="###">ASP</a></li>
                        <li><a href="###">C#</a></li>
                        <li><a href="###">C++</a></li>
                        <li><a href="###">C</a></li>
                        <li><a href="###">Delphi</a></li>
                        <li><a href="###">数据挖掘</a></li>
                        <li><a href="###">自然语言处理</a></li>
                        <li><a href="###">推荐系统</a></li>
                        <li><a href="###">搜索引擎</a></li>
                        <li><a href="###">全栈工程师</a></li>
                    </ul>
                    <div style="clear: both"></div>
                </li>
                <li>
                    <h4><b>开发</b></h4>
                    <ul class="com_morein">
                        <li><a href="###">Java</a></li>
                        <li><a href="###">Php</a></li>
                        <li><a href="###">Python</a></li>
                        <li><a href="###">Ruby</a></li>
                        <li><a href="###">Node.JS</a></li>
                        <li><a href="###">.NET</a></li>
                        <li><a href="###">ASP</a></li>
                        <li><a href="###">C#</a></li>
                        <li><a href="###">C++</a></li>
                        <li><a href="###">C</a></li>
                        <li><a href="###">Delphi</a></li>
                        <li><a href="###">数据挖掘</a></li>
                        <li><a href="###">自然语言处理</a></li>
                        <li><a href="###">推荐系统</a></li>
                        <li><a href="###">搜索引擎</a></li>
                        <li><a href="###">全栈工程师</a></li>
                    </ul>
                    <div style="clear: both"></div>
                </li>
                <li>
                    <h4><b>开发</b></h4>
                    <ul class="com_morein">
                        <li><a href="###">Java</a></li>
                        <li><a href="###">Php</a></li>
                        <li><a href="###">Python</a></li>
                        <li><a href="###">Ruby</a></li>
                        <li><a href="###">Node.JS</a></li>
                        <li><a href="###">.NET</a></li>
                        <li><a href="###">ASP</a></li>
                        <li><a href="###">C#</a></li>
                    </ul>
                    <div style="clear: both"></div>
                </li>

            </ul>
        </div>
        <div class="com_moreu3">
            <ul>
                <li>
                    <h4><b>开发</b></h4>
                    <ul class="com_morein">
                        <li><a href="###">Java</a></li>
                        <li><a href="###">Php</a></li>
                        <li><a href="###">Python</a></li>
                        <li><a href="###">Ruby</a></li>
                        <li><a href="###">Node.JS</a></li>
                        <li><a href="###">.NET</a></li>
                        <li><a href="###">ASP</a></li>
                        <li><a href="###">C#</a></li>
                        <li><a href="###">C++</a></li>
                        <li><a href="###">C</a></li>
                        <li><a href="###">Delphi</a></li>
                        <li><a href="###">数据挖掘</a></li>
                        <li><a href="###">自然语言处理</a></li>
                        <li><a href="###">推荐系统</a></li>
                        <li><a href="###">搜索引擎</a></li>
                        <li><a href="###">全栈工程师</a></li>
                    </ul>
                    <div style="clear: both"></div>
                </li>
                <li>
                    <h4><b>开发</b></h4>
                    <ul class="com_morein">
                        <li><a href="###">Java</a></li>
                        <li><a href="###">Php</a></li>
                        <li><a href="###">Python</a></li>
                        <li><a href="###">Ruby</a></li>
                        <li><a href="###">Node.JS</a></li>
                        <li><a href="###">.NET</a></li>
                        <li><a href="###">ASP</a></li>
                        <li><a href="###">C#</a></li>
                        <li><a href="###">C++</a></li>
                        <li><a href="###">C</a></li>
                        <li><a href="###">Delphi</a></li>
                        <li><a href="###">数据挖掘</a></li>
                        <li><a href="###">自然语言处理</a></li>
                        <li><a href="###">推荐系统</a></li>
                        <li><a href="###">搜索引擎</a></li>
                        <li><a href="###">全栈工程师</a></li>
                    </ul>
                    <div style="clear: both"></div>
                </li>
                <li>
                    <h4><b>开发</b></h4>
                    <ul class="com_morein">
                        <li><a href="###">Java</a></li>
                        <li><a href="###">Php</a></li>
                        <li><a href="###">Python</a></li>
                        <li><a href="###">Ruby</a></li>
                        <li><a href="###">Node.JS</a></li>
                        <li><a href="###">.NET</a></li>
                        <li><a href="###">ASP</a></li>
                        <li><a href="###">C#</a></li>
                        <li><a href="###">C++</a></li>
                        <li><a href="###">C</a></li>
                        <li><a href="###">Delphi</a></li>
                        <li><a href="###">数据挖掘</a></li>
                        <li><a href="###">自然语言处理</a></li>
                        <li><a href="###">推荐系统</a></li>
                        <li><a href="###">搜索引擎</a></li>
                        <li><a href="###">全栈工程师</a></li>
                    </ul>
                    <div style="clear: both"></div>
                </li>
                <li>
                    <h4><b>开发</b></h4>
                    <ul class="com_morein">
                        <li><a href="###">Java</a></li>
                        <li><a href="###">Php</a></li>
                        <li><a href="###">Python</a></li>
                        <li><a href="###">Ruby</a></li>
                        <li><a href="###">Node.JS</a></li>
                        <li><a href="###">.NET</a></li>
                        <li><a href="###">ASP</a></li>
                        <li><a href="###">C#</a></li>
                    </ul>
                    <div style="clear: both"></div>
                </li>
            </ul>
        </div>
        <div class="com_moreu4">
            <ul>
                <li>
                    <h4><b>开发</b></h4>
                    <ul class="com_morein">
                        <li><a href="###">Java</a></li>
                        <li><a href="###">Php</a></li>
                        <li><a href="###">Python</a></li>
                        <li><a href="###">Ruby</a></li>
                        <li><a href="###">Node.JS</a></li>
                        <li><a href="###">.NET</a></li>
                        <li><a href="###">ASP</a></li>
                        <li><a href="###">C#</a></li>
                        <li><a href="###">C++</a></li>
                        <li><a href="###">C</a></li>
                        <li><a href="###">Delphi</a></li>
                        <li><a href="###">数据挖掘</a></li>
                        <li><a href="###">自然语言处理</a></li>
                        <li><a href="###">推荐系统</a></li>
                        <li><a href="###">搜索引擎</a></li>
                        <li><a href="###">全栈工程师</a></li>
                    </ul>
                    <div style="clear: both"></div>
                </li>
                <li>
                    <h4><b>开发</b></h4>
                    <ul class="com_morein">
                        <li><a href="###">Java</a></li>
                        <li><a href="###">Php</a></li>
                        <li><a href="###">Python</a></li>
                        <li><a href="###">Ruby</a></li>
                        <li><a href="###">Node.JS</a></li>
                        <li><a href="###">.NET</a></li>
                        <li><a href="###">ASP</a></li>
                        <li><a href="###">C#</a></li>
                        <li><a href="###">C++</a></li>
                        <li><a href="###">C</a></li>
                        <li><a href="###">Delphi</a></li>
                        <li><a href="###">数据挖掘</a></li>
                        <li><a href="###">自然语言处理</a></li>
                        <li><a href="###">推荐系统</a></li>
                        <li><a href="###">搜索引擎</a></li>
                        <li><a href="###">全栈工程师</a></li>
                    </ul>
                    <div style="clear: both"></div>
                </li>
                <li>
                    <h4><b>开发</b></h4>
                    <ul class="com_morein">
                        <li><a href="###">Java</a></li>
                        <li><a href="###">Php</a></li>
                        <li><a href="###">Python</a></li>
                        <li><a href="###">Ruby</a></li>
                        <li><a href="###">Node.JS</a></li>
                        <li><a href="###">.NET</a></li>
                        <li><a href="###">ASP</a></li>
                        <li><a href="###">C#</a></li>
                        <li><a href="###">C++</a></li>
                        <li><a href="###">C</a></li>
                        <li><a href="###">Delphi</a></li>
                        <li><a href="###">数据挖掘</a></li>
                        <li><a href="###">自然语言处理</a></li>
                        <li><a href="###">推荐系统</a></li>
                        <li><a href="###">搜索引擎</a></li>
                        <li><a href="###">全栈工程师</a></li>
                    </ul>
                    <div style="clear: both"></div>
                </li>
                <li>
                    <h4><b>开发</b></h4>
                    <ul class="com_morein">
                        <li><a href="###">Java</a></li>
                        <li><a href="###">Php</a></li>
                        <li><a href="###">Python</a></li>
                        <li><a href="###">Ruby</a></li>
                        <li><a href="###">Node.JS</a></li>
                        <li><a href="###">.NET</a></li>
                        <li><a href="###">ASP</a></li>
                        <li><a href="###">C#</a></li>
                        <li><a href="###">C++</a></li>
                    </ul>
                    <div style="clear: both"></div>
                </li>
            </ul>
        </div>

    </section>
</div>

<div class="com_container">

    <!--小知推荐-->
    <div class="com_position1">
        <div class="com_top">
            <h4>小知推荐</h4>
            <div class="com_topl">
                <a href="###">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/bn.png" alt="" style="width: 330px;height: 230px;margin-top: 5px">
                </a>
            </div>
            <div class="com_topr">
                <a href="">
                    <div class="topri">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/ali.png" alt="" class="top_rimg">
                        <p>天猫国际</p>
                    </div>
                </a>
                <a href="">
                    <div class="topri">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/ali.png" alt="" class="top_rimg">
                        <p>天猫国际</p>
                    </div>
                </a>
                <a href="">
                    <div class="topri">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/ali.png" alt="" class="top_rimg">
                        <p>天猫国际</p>
                    </div>
                </a>
                <a href="">
                    <div class="topri">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/ali.png" alt="" class="top_rimg">
                        <p>天猫国际</p>
                    </div>
                </a>
                <a href="">
                    <div class="topri">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/ali.png" alt="" class="top_rimg">
                        <p>天猫国际</p>
                    </div>
                </a>
                <a href="">
                    <div class="topri">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/ali.png" alt="" class="top_rimg">
                        <p>天猫国际</p>
                    </div>
                </a>

            </div>
        </div>
    </div>

    <!--热招职位-->
    <div class="com_position">
        <div class="com_top">
            <h4>热招职位 <a href=""><span>更多职位 &raquo</span></a></h4>
            <div class="com_pa">
                <div class="com_every">
                    <div class="com_text">
                        <h4><a href="" class="com_tt" style="">资深销售顾问</a></h4>
                        <p><span class="com_s1">30-48万</span> |
                            <span>深圳 </span>|
                            <span>统招本科</span>|
                            <span>5年以上</span>
                        </p>
                    </div>
                    <a href="">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/didi.png" alt="" style="width: 120px;height: 60px">
                    </a>
                </div>
                <div class="com_every">
                    <div class="com_text">
                        <h4><a href="" class="com_tt" style="">资深销售顾问</a></h4>
                        <p><span class="com_s1">30-48万</span> |
                            <span>深圳 </span>|
                            <span>统招本科</span>|
                            <span>5年以上</span>
                        </p>
                    </div>
                    <a href="">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/didi.png" alt="" style="width: 120px;height: 60px">
                    </a>
                </div>
                <div class="com_every">
                    <div class="com_text">
                        <h4><a href="" class="com_tt" style="">资深销售顾问</a></h4>
                        <p><span class="com_s1">30-48万</span> |
                            <span>深圳 </span>|
                            <span>统招本科</span>|
                            <span>5年以上</span>
                        </p>
                    </div>
                    <a href="">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/didi.png" alt="" style="width: 120px;height: 60px">
                    </a>
                </div>
                <div class="com_every">
                    <div class="com_text">
                        <h4><a href="" class="com_tt" style="">资深销售顾问</a></h4>
                        <p><span class="com_s1">30-48万</span> |
                            <span>深圳 </span>|
                            <span>统招本科</span>|
                            <span>5年以上</span>
                        </p>
                    </div>
                    <a href="">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/didi.png" alt="" style="width: 120px;height: 60px">
                    </a>
                </div>
                <div class="com_every">
                    <div class="com_text">
                        <h4><a href="" class="com_tt" style="">资深销售顾问</a></h4>
                        <p><span class="com_s1">30-48万</span> |
                            <span>深圳 </span>|
                            <span>统招本科</span>|
                            <span>5年以上</span>
                        </p>
                    </div>
                    <a href="">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/didi.png" alt="" style="width: 120px;height: 60px">
                    </a>
                </div>
                <div class="com_every">
                    <div class="com_text">
                        <h4><a href="" class="com_tt" style="">资深销售顾问</a></h4>
                        <p><span class="com_s1">30-48万</span> |
                            <span>深圳 </span>|
                            <span>统招本科</span>|
                            <span>5年以上</span>
                        </p>
                    </div>
                    <a href="">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/didi.png" alt="" style="width: 120px;height: 60px">
                    </a>
                </div>
                <div class="com_every">
                    <div class="com_text">
                        <h4><a href="" class="com_tt" style="">资深销售顾问</a></h4>
                        <p><span class="com_s1">30-48万</span> |
                            <span>深圳 </span>|
                            <span>统招本科</span>|
                            <span>5年以上</span>
                        </p>
                    </div>
                    <a href="">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/didi.png" alt="" style="width: 120px;height: 60px">
                    </a>
                </div>
                <div class="com_every">
                    <div class="com_text">
                        <h4><a href="" class="com_tt" style="">资深销售顾问</a></h4>
                        <p><span class="com_s1">30-48万</span> |
                            <span>深圳 </span>|
                            <span>统招本科</span>|
                            <span>5年以上</span>
                        </p>
                    </div>
                    <a href="">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/didi.png" alt="" style="width: 120px;height: 60px">
                    </a>
                </div>

            </div>

        </div>


    </div>

    <!--行业名企-->
    <div class="com_position1">
        <div class="com_top">
            <h4>行业名企 <a href=""><span>更多名企 &raquo</span></a>></h4>
            <div class="com_com">
                <a href="" style="display: block;text-align: center">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.png" alt="" class="com_comi" style=""/>
                </a>
                <a href=""><p class="com_p1">推荐算法工程师</p></a>
                <a href=""><p class="com_p1">结构工程师-手机</p></a>
                <div class="com_morem">
                    <a href=""><span class="com_sp" style="color: #fc6866">更多 &raquo</span></a>
                    <span class="com_sp"> <span style="color: #fc6866">500 </span> 个在招职位</span>
                </div>
                <div>
                    <span class="com_sp2">绩效奖金</span>
                    <span class="com_sp2">带薪年假</span>
                </div>
            </div>
            <div class="com_com">
                <a href="" style="display: block;text-align: center">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.png" alt="" class="com_comi" style=""/>
                </a>
                <a href=""><p class="com_p1">推荐算法工程师</p></a>
                <a href=""><p class="com_p1">结构工程师-手机</p></a>
                <div class="com_morem">
                    <a href=""><span class="com_sp" style="color: #fc6866">更多 &raquo</span></a>
                    <span class="com_sp"> <span style="color: #fc6866">500 </span> 个在招职位</span>
                </div>
                <div>
                    <span class="com_sp2">绩效奖金</span>
                    <span class="com_sp2">带薪年假</span>
                </div>
            </div>
            <div class="com_com">
                <a href="" style="display: block;text-align: center">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.png" alt="" class="com_comi" style=""/>
                </a>
                <a href=""><p class="com_p1">推荐算法工程师</p></a>
                <a href=""><p class="com_p1">结构工程师-手机</p></a>
                <div class="com_morem">
                    <a href=""><span class="com_sp" style="color: #fc6866">更多 &raquo</span></a>
                    <span class="com_sp"> <span style="color: #fc6866">500 </span> 个在招职位</span>
                </div>
                <div>
                    <span class="com_sp2">绩效奖金</span>
                    <span class="com_sp2">带薪年假</span>
                </div>
            </div>
            <div class="com_com">
                <a href="" style="display: block;text-align: center">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.png" alt="" class="com_comi" style=""/>
                </a>
                <a href=""><p class="com_p1">推荐算法工程师</p></a>
                <a href=""><p class="com_p1">结构工程师-手机</p></a>
                <div class="com_morem">
                    <a href=""><span class="com_sp" style="color: #fc6866">更多 &raquo</span></a>
                    <span class="com_sp"> <span style="color: #fc6866">500 </span> 个在招职位</span>
                </div>
                <div>
                    <span class="com_sp2">绩效奖金</span>
                    <span class="com_sp2">带薪年假</span>
                </div>
            </div>
            <div class="com_com">
                <a href="" style="display: block;text-align: center">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.png" alt="" class="com_comi" style=""/>
                </a>
                <a href=""><p class="com_p1">推荐算法工程师</p></a>
                <a href=""><p class="com_p1">结构工程师-手机</p></a>
                <div class="com_morem">
                    <a href=""><span class="com_sp" style="color: #fc6866">更多 &raquo</span></a>
                    <span class="com_sp"> <span style="color: #fc6866">500 </span> 个在招职位</span>
                </div>
                <div>
                    <span class="com_sp2">绩效奖金</span>
                    <span class="com_sp2">带薪年假</span>
                </div>
            </div>
            <div class="com_com">
                <a href="" style="display: block;text-align: center">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.png" alt="" class="com_comi" style=""/>
                </a>
                <a href=""><p class="com_p1">推荐算法工程师</p></a>
                <a href=""><p class="com_p1">结构工程师-手机</p></a>
                <div class="com_morem">
                    <a href=""><span class="com_sp" style="color: #fc6866">更多 &raquo</span></a>
                    <span class="com_sp"> <span style="color: #fc6866">500 </span> 个在招职位</span>
                </div>
                <div>
                    <span class="com_sp2">绩效奖金</span>
                    <span class="com_sp2">带薪年假</span>
                </div>
            </div>
            <div class="com_com">
                <a href="" style="display: block;text-align: center">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.png" alt="" class="com_comi" style=""/>
                </a>
                <a href=""><p class="com_p1">推荐算法工程师</p></a>
                <a href=""><p class="com_p1">结构工程师-手机</p></a>
                <div class="com_morem">
                    <a href=""><span class="com_sp" style="color: #fc6866">更多 &raquo</span></a>
                    <span class="com_sp"> <span style="color: #fc6866">500 </span> 个在招职位</span>
                </div>
                <div>
                    <span class="com_sp2">绩效奖金</span>
                    <span class="com_sp2">带薪年假</span>
                </div>
            </div>
            <div class="com_com">
                <a href="" style="display: block;text-align: center">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.png" alt="" class="com_comi" style=""/>
                </a>
                <a href=""><p class="com_p1">推荐算法工程师</p></a>
                <a href=""><p class="com_p1">结构工程师-手机</p></a>
                <div class="com_morem">
                    <a href=""><span class="com_sp" style="color: #fc6866">更多 &raquo</span></a>
                    <span class="com_sp"> <span style="color: #fc6866">500 </span> 个在招职位</span>
                </div>
                <div>
                    <span class="com_sp2">绩效奖金</span>
                    <span class="com_sp2">带薪年假</span>
                </div>
            </div>
        </div>
    </div>

    <!--创业新秀-->
    <div class="com_position">
        <div class="com_top">
            <h4>创业新秀 <a href=""><span>更多新秀 &raquo</span></a></h4>
            <div class="com_over">
                <div class="com_bottom">
                    <a href="" style="text-align: center;display: block">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/have.jpg" alt="" class="com_newimg">
                    </a>
                    <div class="com_newg">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/haveceo.jpg" alt="" class="com_imgin">
                        <div class="com_name">
                            <div>朱宁</div>
                            <div>CEO</div>
                        </div>
                        <div style="clear: both"></div>
                    </div>
                    <div class="com_bos"><span>电子商务</span> | <span>杭州</span></div>
                    <a href="" class="com_ba"><p>■ 资深C/C++开发工程师-杭州-00127</p></a>
                    <a href="" class="com_ba"><p>■ 资深PHP开发工程师-杭</p></a>
                    <a href="">
                        <div style="color: #fc6866">更多 &raquo</div>
                    </a>
                    <div>
                        <span class="com_sp2">绩效奖金</span>
                        <span class="com_sp2">五险一金</span>
                    </div>
                    <span class="com_ou">成长型</span>

                </div>
            </div>
            <div class="com_over">
                <div class="com_bottom">
                    <a href="" style="text-align: center;display: block">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/have.jpg" alt="" class="com_newimg">
                    </a>
                    <div class="com_newg">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/haveceo.jpg" alt="" class="com_imgin">
                        <div class="com_name">
                            <div>朱宁</div>
                            <div>CEO</div>
                        </div>
                        <div style="clear: both"></div>
                    </div>
                    <div class="com_bos"><span>电子商务</span> | <span>杭州</span></div>
                    <a href="" class="com_ba"><p>■ 资深C/C++开发工程师-杭州-00127</p></a>
                    <a href="" class="com_ba"><p>■ 资深PHP开发工程师-杭</p></a>
                    <a href="">
                        <div style="color: #fc6866">更多 &raquo</div>
                    </a>
                    <div>
                        <span class="com_sp2">绩效奖金</span>
                        <span class="com_sp2">五险一金</span>
                    </div>
                    <span class="com_ou">成长型</span>

                </div>
            </div>
            <div class="com_over">
                <div class="com_bottom">
                    <a href="" style="text-align: center;display: block">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/have.jpg" alt="" class="com_newimg">
                    </a>
                    <div class="com_newg">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/haveceo.jpg" alt="" class="com_imgin">
                        <div class="com_name">
                            <div>朱宁</div>
                            <div>CEO</div>
                        </div>
                        <div style="clear: both"></div>
                    </div>
                    <div class="com_bos"><span>电子商务</span> | <span>杭州</span></div>
                    <a href="" class="com_ba"><p>■ 资深C/C++开发工程师-杭州-00127</p></a>
                    <a href="" class="com_ba"><p>■ 资深PHP开发工程师-杭</p></a>
                    <a href="">
                        <div style="color: #fc6866">更多 &raquo</div>
                    </a>
                    <div>
                        <span class="com_sp2">绩效奖金</span>
                        <span class="com_sp2">五险一金</span>
                    </div>
                    <span class="com_ou">成长型</span>

                </div>
            </div>
            <div class="com_over">
                <div class="com_bottom">
                    <a href="" style="text-align: center;display: block">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/have.jpg" alt="" class="com_newimg">
                    </a>
                    <div class="com_newg">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/haveceo.jpg" alt="" class="com_imgin">
                        <div class="com_name">
                            <div>朱宁</div>
                            <div>CEO</div>
                        </div>
                        <div style="clear: both"></div>
                    </div>
                    <div class="com_bos"><span>电子商务</span> | <span>杭州</span></div>
                    <a href="" class="com_ba"><p>■ 资深C/C++开发工程师-杭州-00127</p></a>
                    <a href="" class="com_ba"><p>■ 资深PHP开发工程师-杭</p></a>
                    <a href="">
                        <div style="color: #fc6866">更多 &raquo</div>
                    </a>
                    <div>
                        <span class="com_sp2">绩效奖金</span>
                        <span class="com_sp2">五险一金</span>
                    </div>
                    <span class="com_ou">成长型</span>

                </div>
            </div>
            <div class="com_over">
                <div class="com_bottom">
                    <a href="" style="text-align: center;display: block">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/have.jpg" alt="" class="com_newimg">
                    </a>
                    <div class="com_newg">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/haveceo.jpg" alt="" class="com_imgin">
                        <div class="com_name">
                            <div>朱宁</div>
                            <div>CEO</div>
                        </div>
                        <div style="clear: both"></div>
                    </div>
                    <div class="com_bos"><span>电子商务</span> | <span>杭州</span></div>
                    <a href="" class="com_ba"><p>■ 资深C/C++开发工程师-杭州-00127</p></a>
                    <a href="" class="com_ba"><p>■ 资深PHP开发工程师-杭</p></a>
                    <a href="">
                        <div style="color: #fc6866">更多 &raquo</div>
                    </a>
                    <div>
                        <span class="com_sp2">绩效奖金</span>
                        <span class="com_sp2">五险一金</span>
                    </div>
                    <span class="com_ou">成长型</span>

                </div>
            </div>
            <div class="com_over">
                <div class="com_bottom">
                    <a href="" style="text-align: center;display: block">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/have.jpg" alt="" class="com_newimg">
                    </a>
                    <div class="com_newg">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/haveceo.jpg" alt="" class="com_imgin">
                        <div class="com_name">
                            <div>朱宁</div>
                            <div>CEO</div>
                        </div>
                        <div style="clear: both"></div>
                    </div>
                    <div class="com_bos"><span>电子商务</span> | <span>杭州</span></div>
                    <a href="" class="com_ba"><p>■ 资深C/C++开发工程师-杭州-00127</p></a>
                    <a href="" class="com_ba"><p>■ 资深PHP开发工程师-杭</p></a>
                    <a href="">
                        <div style="color: #fc6866">更多 &raquo</div>
                    </a>
                    <div>
                        <span class="com_sp2">绩效奖金</span>
                        <span class="com_sp2">五险一金</span>
                    </div>
                    <span class="com_ou">成长型</span>

                </div>
            </div>
            <div class="com_over">
                <div class="com_bottom">
                    <a href="" style="text-align: center;display: block">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/have.jpg" alt="" class="com_newimg">
                    </a>
                    <div class="com_newg">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/haveceo.jpg" alt="" class="com_imgin">
                        <div class="com_name">
                            <div>朱宁</div>
                            <div>CEO</div>
                        </div>
                        <div style="clear: both"></div>
                    </div>
                    <div class="com_bos"><span>电子商务</span> | <span>杭州</span></div>
                    <a href="" class="com_ba"><p>■ 资深C/C++开发工程师-杭州-00127</p></a>
                    <a href="" class="com_ba"><p>■ 资深PHP开发工程师-杭</p></a>
                    <a href="">
                        <div style="color: #fc6866">更多 &raquo</div>
                    </a>
                    <div>
                        <span class="com_sp2">绩效奖金</span>
                        <span class="com_sp2">五险一金</span>
                    </div>
                    <span class="com_ou">成长型</span>

                </div>
            </div>
            <div class="com_over">
                <div class="com_bottom">
                    <a href="" style="text-align: center;display: block">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/have.jpg" alt="" class="com_newimg">
                    </a>
                    <div class="com_newg">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/haveceo.jpg" alt="" class="com_imgin">
                        <div class="com_name">
                            <div>朱宁</div>
                            <div>CEO</div>
                        </div>
                        <div style="clear: both"></div>
                    </div>
                    <div class="com_bos"><span>电子商务</span> | <span>杭州</span></div>
                    <a href="" class="com_ba"><p>■ 资深C/C++开发工程师-杭州-00127</p></a>
                    <a href="" class="com_ba"><p>■ 资深PHP开发工程师-杭</p></a>
                    <a href="">
                        <div style="color: #fc6866">更多 &raquo</div>
                    </a>
                    <div>
                        <span class="com_sp2">绩效奖金</span>
                        <span class="com_sp2">五险一金</span>
                    </div>
                    <span class="com_ou">成长型</span>

                </div>
            </div>


        </div>
    </div>


</div>


</body>
</html>
