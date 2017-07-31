<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/7/13
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="distforeEnd.jsp"/>
    <style>
        .cd-popup-trigger {
            display: inline-block;
            width: 160px;
            height: 45px;
            line-height: 45px;
            text-align: center;
            color: #FFF;
            font-size: 16px;
            text-transform: uppercase;
            background: #f8a91e;
            box-shadow: 0 3px 0 rgba(0, 0, 0, 0.07);
            border-radius: 3px;
            margin-top: 30px;
        }

        .cd-popup-trigger:hover {
            color: #ffffff;
        }
    </style>

</head>
<body>

<jsp:include page="headerforeEnd.jsp"/>


<div class="com_container">

    <div class="comd_topimg"></div>
    <!--行业名企-->
    <div class="comd_top">
        <div class="comd_choose">
            <a href="#0" class="openha">选择行业</a>
            <span></span>
            <div>
                <input type="text" class="comd_input1" placeholder="输入公司全称或关键词">
                <button class="comd_b" type="submit">搜 索</button>
            </div>
        </div>
    </div>

    <div class="com_position1">

        <div class="com_top">
            <h4>行业名 <a href=""><span>更多职位 &raquo</span></a>></h4>
            <div class="com_com">
                <a href="" style="display: block;text-align: center">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.png" alt="" class="com_comi" style=""/>
                </a>
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

    <div class="cmd_bottom"></div>

</div>

<jsp:include page="behindforeEnd.jsp"/>
<div class="cd-popuph" id="qwhy__" role="alert">
    <div class="cd-popup-containerh">
        <p style="font-size: 16px">选择行业分类</p>

        <div class="comd_table" id="hy_tab">
            <h4>IT行业</h4>
            <ul class="zp_ulu">
                <li><input type="checkbox" data-fieldtype="2" data-fieldId="1" data-value="互联网/移动互联网"/>互联网/移动互联网</li>
                <li><input type="checkbox" data-fieldtype="2" data-fieldId="2" data-value="网络游戏"/>网络游戏</li>
                <li><input type="checkbox" data-fieldtype="2" data-fieldId="3" data-value="计算机软件"/>计算机软件</li>
                <li><input type="checkbox" data-fieldtype="2" data-fieldId="4" data-value="IT服务/系统集成"/>IT服务/系统集成</li>
            </ul>
        </div>

        <ul class="cd-buttonsh">
            <li><a href="#0" class="cd-popup-closeh">取消</a></li>
            <li><a href="#0" id="xz_qwhy_qd">确定</a></li>
        </ul>
        <a href="#0" class="cd-popup-closeh cmd_closeh fa fa-remove"></a>
    </div>
</div>



<script>
    jQuery(document).ready(function($) {

        $('.openha').on('click', function(event){
            event.preventDefault();
            $('.cd-popuph').addClass('is-visible');
        });


        $('.cd-popup-closeh').unbind().on('click', function () {
            $('.cd-popuph').removeClass('is-visible');
        })
        $(document).keyup(function (event) {                            //键盘关闭
            if (event.which == '27') {
                $('.cd-popuph').removeClass('is-visible');
            }
        });

    });
</script>





<%--弹出框--%>
<script src="${pageContext.request.contextPath}/dist/foreEnd3/js/maini.js"></script>
</body>
</html>