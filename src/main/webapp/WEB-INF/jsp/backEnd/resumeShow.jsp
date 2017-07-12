<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--分页--%>
<%@ taglib prefix="page" uri="/xianzhiOA/pageTag" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>个人简历</title>
    <jsp:include page="backEndCss.jsp"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/dist/backEnd/css/datedropper.css">
    <script type="application/javascript">
        var tis = new tis(300);
        //分页
        function pToSub(page) {
            if (page != undefined) {
                var pageInp = document.getElementById("resumePage");
                pageInp.value = page;
                var form = document.getElementById("resumeForm");
                form.submit();
            }
        }
        //删除提示框
        function go(id) {
            tis.confirm("你确定要删除这条信息么？", function (choose) {
                if (choose) {
                    window.location.href = "${pageContext.request.contextPath}/Resume/deleteResume.emp?resumeId=" + id;
                }
            });
        }
    </script>
</head>

<jsp:include page="backEndHeader.jsp"/>
<body>


<div class="content">

    <div class="header">
        <h1 class="page-title">个人简历</h1>
    </div>
    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/Teacher/backEndIndex">首页</a></li>
        <li class="active">个人简历</li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">
            <form id="resumeForm" action="${pageContext.request.contextPath}/Resume/selectAllPersonalResume.emp">
                <div class="well">
                    <div>&nbsp;&nbsp;
                        求职意向：<select name="resumeJob" style="width: 135px">
                            <option value="">请选择</option>
                            <option value="JAVA开发" <c:if
                                    test="${resume.resumeJob=='JAVA开发'}"> selected="selected"</c:if>>JAVA开发
                            </option>
                            <option value="软件测试" <c:if test="${resume.resumeJob=='软件测试'}"> selected="selected"</c:if>>
                                软件测试
                            </option>
                            <option value="PHP开发" <c:if test="${resume.resumeJob=='PHP开发'}"> selected="selected"</c:if>>
                                PHP开发
                            </option>
                            <option value="Oracle维护" <c:if
                                    test="${resume.resumeJob=='Oracle维护'}"> selected="selected"</c:if>>Oracle维护
                            </option>
                            <option value="ASP.NET开发" <c:if
                                    test="${resume.resumeJob=='ASP.NET开发'}"> selected="selected"</c:if>>ASP.NET开发
                            </option>
                            <option value="大数据" <c:if test="${resume.resumeJob=='大数据'}"> selected="selected"</c:if>>
                                大数据
                            </option>
                            <option value="日语翻译" <c:if test="${resume.resumeJob=='日语翻译'}"> selected="selected"</c:if>>
                                日语翻译
                            </option>
                        </select>&nbsp;&nbsp;
                        工作年限：<select name="resumeYear" style="width: 135px">
                            <option value="">请选择</option>
                            <option value="0" <c:if test="${resume.resumeYear=='0'}">selected="selected"</c:if>>无经验
                            </option>
                            <option value="1" <c:if test="${resume.resumeYear=='1'}">selected="selected"</c:if>>1年
                            </option>
                            <option value="2" <c:if test="${resume.resumeYear=='2'}">selected="selected"</c:if>>2年
                            </option>
                            <option value="3" <c:if test="${resume.resumeYear=='3'}">selected="selected"</c:if>>3年
                            </option>
                            <option value="4" <c:if test="${resume.resumeYear>'3'}">selected="selected"</c:if>>3年以上
                            </option>
                        </select>&nbsp;&nbsp;
                        工作地点：<input name="resumePlace" type="text" value="${resume.resumePlace}" style="width:125px;">&nbsp;&nbsp;
                        期望薪资：<input type="number" name="minSalary"
                                    value="<c:if test="${minSalary!='0'}">${minSalary}</c:if>" style="width: 121px">&nbsp;&nbsp;-&nbsp;
                        <input type="number" name="maxSalary" value="<c:if test="${maxSalary!='0'}">${maxSalary}</c:if>"
                               style="width: 121px">&nbsp;&nbsp;&nbsp;
                        <input type="submit" class="btn btn-warning" value="搜索"><br>&nbsp;&nbsp;
                        目前状态：<select name="resumeState" style="width: 135px">
                            <option value="">请选择</option>
                            <option value="找工作" <c:if test="${resume.resumeState=='找工作'}">selected="selected"</c:if>>
                                找工作
                            </option>
                            <option value="跳槽" <c:if test="${resume.resumeState=='跳槽'}">selected="selected"</c:if>>
                                准备跳槽
                            </option>
                        </select>&nbsp;&nbsp;
                        职位类型：<select name="resumeType" style="width: 135px">
                            <option value="">请选择</option>
                            <option value="全职" <c:if test="${resume.resumeType=='全职'}">selected="selected"</c:if>>全职
                            </option>
                            <option value="兼职" <c:if test="${resume.resumeType=='兼职'}">selected="selected"</c:if>>兼职
                            </option>
                        </select>
                    </div>
                    <table class="table">
                        <thead>
                        <tr>
                            <th class="vv">#</th>
                            <th class="v">用户编号</th>
                            <th class="v">姓名</th>
                            <th class="v">求职意向</th>
                            <th class="v">期望薪资</th>
                            <th class="v">期望工作地</th>
                            <th class="v">工作年限</th>
                            <th class="v">目前状态</th>
                            <th class="v">职位类型</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="rr" items="${resumeList}">
                            <tr>
                                <td>${rr.resumeId}</td>
                                <td>${rr.resumeMember}</td>
                                <td>${rr.memberName}</td>
                                <td>${rr.resumeJob}</td>
                                <td>${rr.resumeSalary}</td>
                                <td>${rr.resumePlace}</td>
                                <td>${rr.resumeYear}</td>
                                <td>${rr.resumeState}</td>
                                <td>${rr.resumeType}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/Resume/resumeEdit.emp?resumeId=${rr.resumeId}">修改</a>
                                </td>
                                <td><a onclick="go(${rr.resumeId})" style="cursor: pointer"><i
                                        class="fa fa-cloud-upload"></i>删除</a></td>
                                    <%--<td><a href="${pageContext.request.contextPath}/Resume/deleteResume.emp?resumeId=${rr.resumeId}">删除</a></td>--%>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="pagination">
                    <c:if test="${pages > 1}">
                        <ul>
                            <input id="resumePage" type="hidden" name="page" value="${page}">
                            <page:paging length="10" page="${page}" pages="${pages}"/>
                        </ul>
                    </c:if>
                </div>
            </form>
            <div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="myModalLabel">删除信息</h3>
                </div>
                <div class="modal-body">
                    <p class="error-text"><i class="icon-warning-sign modal-icon"></i>你确定要删除这条信息么？</p>
                </div>
                <div class="modal-footer">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
                    <button class="btn btn-danger" data-dismiss="modal">删除</button>
                </div>
            </div>

            <footer>
                <hr>
                <p>&copy; 2017 <a href="###" target="_blank">先知蓝创</a></p>
            </footer>
        </div>
    </div>
</div>

<%--<script src="${pageContext.request.contextPath}/dist/backEnd/js/bootstrap.js"></script>--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/dist/backEnd/js/jquery-1.12.3.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/backEnd/js/datedropper.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/backEnd/js/timedropper.min.js"></script>

</body>
</html>
