<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%@ taglib prefix="myPage" uri="/xianzhiOA/pageTag" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="distforeEnd.jsp"/>
    <style>
        .hangs {
            margin-left: 20px;
        }
    </style>
</head>

<form action="${pageContext.request.contextPath}/CompanyInfo/selCompany.do" name="f1" id="f1">
<jsp:include page="headerforeEnd.jsp"/>
<jsp:include page="personnav.jsp"/>


<div class="com_container">
    <div class="comd_topimg"></div>
    <!--行业名企-->
    <div class="comd_top">
        <div class="comd_choose">
            <div>
                <span style="display: inline-block;margin-right: 20px">
                <span class="fa fa-map-marker" style="margin-right: 5px;color: #3d9ccc;font-size: 20px"></span>
                <span id="this_space" style="cursor: pointer;font-size: 18px" class="zp_gslc">选择地区</span>
                </span>
                <span style="display: inline-block">
                <span class="fa fa-edit" style="color: #3d9ccc;font-size: 20px"></span>
                    <a href="#0" class="openha" style="font-size: 18px">选择行业</a>
                <span id="_hy"></span></span>

                <%--<span></span>--%>
            </div>
            <div>
                <input type="text" class="comd_input1" name="companyName" placeholder="输入公司全称或关键词" value="${map.get("companyName")}">
                <button class="comd_b" type="submit">搜 索</button>
            </div>
        </div>
    </div>

    <div class="com_position1">

        <div class="com_top">
            <h4>行业名企<a href=""><span>更多职位 &raquo</span></a>></h4>
            <c:forEach items="${clist}" var="c1">
            <div class="com_com">
                <a href="${pageContext.request.contextPath}/CompanyInfo/selCompanyInf.do?companyId=${c1.companyId}" style="display: block;text-align: center">
                    <img src="${pageContext.request.contextPath}/uploadImg/${c1.companyPicture}" alt="" class="com_comi"
                         style=""/>
                </a>
                <div class="com_morem">
                    <a href=""><span class="com_sp" style="color: #fc6866">更多 &raquo</span></a>
                    <span class="com_sp"> <span style="color: #fc6866">${c1.pcount} </span> 个在招职位</span>
                </div>
                <div>
                    <c:forEach items="${c1.welfares}" var="w1">
                    <span class="com_sp2">${w1.welfareName}</span>
                    </c:forEach>
                </div>


            </div>
            </c:forEach>
            <%--分页--%>
            <div class="zp_botv">
                <div class="zp_pl">
                    <ul class="pagination zp_pa">
                        <%--<li class="b"><a href="#">上一页</a></li>--%>
                        <%--<li class="active"><a href="#">1</a></li>--%>
                        <%--<li class="a"><a href="#">2</a></li>--%>
                        <%--<li class="a"><a href="#">3</a></li>--%>
                        <%--<li class="a"><a href="#">4</a></li>--%>
                        <%--<li class="a"><a href="#">5</a></li>--%>
                        <%--<li class="a"><a href="#">下一页</a></li>--%>
                            <input id="infPage" type="hidden" name="page" value="${page}">
                            <myPage:paging length="8" page="${page}" pages="${pages}"/>
                    </ul>
                    <div class="zp_page">共 <span>${pages}</span> 页</div>
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
            <ul id="gshyBox" class="zp_ulu">
                <li><input type="checkbox" data-fieldtype="2" data-fieldId="1" name="fffs" data-value="互联网/移动互联网" value="互联网"/>互联网/移动互联网</li>
                <li><input type="checkbox" data-fieldtype="2" data-fieldId="2" name="fffs" data-value="网络游戏" value="网络游戏"/>网络游戏</li>
                <li><input type="checkbox" data-fieldtype="2" data-fieldId="3" name="fffs" data-value="计算机软件" value="计算机软件"/>计算机软件</li>
                <li><input type="checkbox" data-fieldtype="2" data-fieldId="4" name="fffs" data-value="IT服务/系统集成" value="IT服务"/>IT服务/系统集成</li>
            </ul>
        </div>

        <ul class="cd-buttonsh">
            <li><a href="#0" class="cd-popup-closeh">取消</a></li>
            <li><a href="#0" id="xz_qwhy_qd">确定</a></li>
        </ul>
        <a href="#0" class="cd-popup-closeh cmd_closeh fa fa-remove"></a>
    </div>
</div>
<input id="workspace" name="companyCity" type="hidden">
<script src="${pageContext.request.contextPath}/dist/foreEnd3/js/maini.js"></script>
<jsp:include page="cityUtil.jsp"></jsp:include>

</form>
<script>
    jQuery(document).ready(function ($) {

        $('.openha').on('click', function (event) {
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
    //行业回填
   /* $('#xz_qwhy_qd').on('click', function () {
        var aa = $('#hy_tab input[type=checkbox]:checked');
        var str = ''
        aa.each(function (i, e) {
            str += '<span class="hangs">' + $(e).attr('data-value') + '</span>'+'，'
        })
        $('#_hy').html(str)
        $('.cd-popuph').removeClass('is-visible');

    })*/
    function pToSub(page) {
        var infpage = parseInt(document.getElementById("infPage").value);
        if (page != infpage && page - infpage > 0 || page != infpage && page - infpage < 0) {
            document.getElementById("infPage").value = page;
            document.getElementById("f1").submit();
        }
    }
    function sel() {
        document.getElementById("infPage").value = 1;
        document.getElementById("f1").submit();
    }

</script>


<%--弹出框--%>
<script src="${pageContext.request.contextPath}/dist/foreEnd3/js/maini.js"></script>
</body>
<script>
    $.ajax({
        type:"post",    //提交方式
        async:true,  //是否异步
        data:{type:1},
        dataType:'json',                   //定义返回data类型
        url:'${pageContext.request.contextPath}/Field/selByType',    //路径
        success:function (data){//data 就是数据 json
            var ccHtml="";
            for(var i = 0;i < data.fieldList.length;i++){
                ccHtml+='<li><input class="gshychechBox" type="checkbox" ';
                /*for(var j = 0;j<theFiels.length;j++){
                    if(theFiels[j]==data.fieldList[i].fieldId){
                        ccHtml+= 'checked';
                    }
                }*/
                ccHtml+=' data-fieldId="'+data.fieldList[i].fieldId+'" data-value="'+data.fieldList[i].fieldName+'"/>'+data.fieldList[i].fieldName+' </li>';
            }
            $('#gshyBox').html(ccHtml);
            //行业回填
            $('#xz_qwhy_qd').on('click', function () {
                var aa = $('#hy_tab input[type=checkbox]:checked');
                var str = ''
                aa.each(function (i, e) {
                    str += '<span class="hangs">' + $(e).attr('data-value') + '</span>'+'，'
                })
                $('#_hy').html(str)
                $('.cd-popuph').removeClass('is-visible');

            })
        },error:function (){ //报错执行的
            alert('行业查找失败');
        }
    })

</script>
</html>