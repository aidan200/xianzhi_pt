<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/25
  Time: 18:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--引入jstl日期类型--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--引入分页--%>
<%@ taglib prefix="page" uri="/xianzhiOA/pageTag" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>视频课程</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <jsp:include page="backEndCss.jsp"/>
    <script type="application/javascript">
        function turning(type) {
            var page = parseInt(document.getElementById("testPage").value);
            if (type == "up") {
                page--;
            } else if (type == "down") {
                page++;
            }
            document.getElementById("testPage").value = page;
            document.getElementById("CompanyForm").submit();
        }

        function pToSub(page) {
            if (page != undefined) {
                var pageInp = document.getElementById("thePage");
                pageInp.value = page;
                var form = document.getElementById("videoForm");
                form.submit();
            }
        }
        //        删除弹窗
        var tis = new tis(300);
        function go(id) {
            tis.confirm("你确定要删除这条信息么？", function (choose) {
                if (choose) {
                    window.location.href = "${pageContext.request.contextPath}/XzVideo/deleteVideo.emp?videoID=" + id;
                }
            });
        }
    </script>


</head>


<body class="">

<jsp:include page="backEndHeader.jsp"/>


<div class="content">

    <div class="header">
        <h1 class="page-title">视频课程表</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="home.html">1</a> <span class="divider">/</span></li>
        <li class="active">视频课程表</li>
    </ul>
    <div class="container-fluid">
        <sf:form id="videoForm" action="${pageContext.request.contextPath}/XzVideo/selectVideo.emp" method="post"
                 modelAttribute="xzVideo">
            <div class="row-fluid">
                <div>
                    条件查询 ：
                    <br/>
                    <input id="thePage" type="hidden"  name="page" value="${page}">
                    用户名: <sf:input path="memberName"
                                   value="${xzVideo.memberName}"/>
                    视频类别:
                    <sf:select path="vclass">
                        <sf:option value="0">请选择</sf:option>
                        <c:forEach var="c1" items="${xzVideoClassList}">
                            <sf:option value="${c1.vclassID}">${c1.className}</sf:option>
                        </c:forEach>
                    </sf:select>
                    审核状态:
                    <sf:select path="videoType">
                        <sf:option value="0">请选择</sf:option>
                        <sf:option value="1">通过</sf:option>
                        <sf:option value="2">未通过</sf:option>
                        <sf:option value="3">待审核</sf:option>
                    </sf:select>
                    <input type="submit" value="查询">
                </div>
            </div>
            <!--表-->
            <div class="well">
                <table class="table">
                    <thead>
                    <tr>
                        <td class="vv">视频表ID</td>
                        <td class="v">登录表ID</td>
                        <td class="v">用户名</td>
                        <td class="v">视频预览图</td>
                        <td class="v">视频名称</td>
                        <td class="v">视频介绍</td>
                        <td class="v">视频地址</td>
                        <td class="v">视频类别</td>
                        <td class="v">审核状态</td>
                        <td class="v">查看视频</td>
                        <td class="v">操作</td>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="v1" items="${videoList}">
                        <tr>
                            <td class="vv">${v1.videoID}</td>
                            <td class="v">${v1.loginID}</td>
                            <td class="v">${v1.memberName}</td>
                            <td class="v">${v1.videoPicture}</td>
                            <td class="v">${v1.videoName}</td>
                            <td class="v">${v1.videoIntroduce}</td>
                            <td class="v">${v1.videoAddress}</td>
                            <td class="v">${v1.className}</td>
                            <c:if test="${v1.videoType ==1}">
                                <td class="v">通过</td>
                            </c:if>
                            <c:if test="${v1.videoType ==2}">
                                <td class="v">未通过</td>
                            </c:if>
                            <c:if test="${v1.videoType ==3}">
                                <td class="v">待审核</td>
                            </c:if>
                            <td class="v"><a
                                    href="${pageContext.request.contextPath}/XzVideo/goVideo.emp?videoID=${v1.videoID}">查看视频</a>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/XzVideo/goUpdateVideo.emp?videoID=${v1.videoID}"><i
                                        class="icon-pencil"></i></a>
                                <a onclick="go(${v1.videoID})"
                                ><i class="icon-remove"></i></a>
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>

            <div class="pagination">
                <ul>
                    <page:paging length="10" page="${page}" pages="${pages}"/>
                </ul>

            </div>


        </sf:form>


        <footer>
            <hr>
            <p>&copy; 2017 <a href="#" target="_blank">先知蓝创</a></p>
        </footer>

    </div>
</div>
</div>
<%--<script src="${pageContext.request.contextPath}/dist/backEnd/js/bootstrap.js"></script>--%>
</body>
</html>
