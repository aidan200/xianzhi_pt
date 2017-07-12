<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入日期格式--%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--分页--%>
<%@ taglib prefix="page" uri="/xianzhiOA/pageTag" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>应聘信息</title>
    <jsp:include page="backEndCss.jsp"/>
    <script type="application/javascript">
        //分页
        function pToSub(page) {
            if(page!=undefined){
                var pageInp = document.getElementById("deliverPage");
                pageInp.value = page;
                var form = document.getElementById("deliverForm");
                form.submit();
            }
        }
    </script>
</head>

<jsp:include page="backEndHeader.jsp"/>
<body>


<div class="content">

    <div class="header">
        <h1 class="page-title">应聘信息</h1>
    </div>
    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/Teacher/backEndIndex">首页</a></li>
        <li class="active">应聘信息</li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">
            <form id="deliverForm" action="${pageContext.request.contextPath}/Resume/selectResumeEndEndEnd.emp" >
                <div class="well">
                    <div>&nbsp;&nbsp;
                        <input type="hidden" name="companyId" value="${companyId}">
                        求职意向：<select name="resumeJob" style="width: 135px">
                            <option value="">请选择</option>
                            <option value="JAVA开发" <c:if test="${deliver.resumeJob=='JAVA开发'}"> selected="selected"</c:if>>JAVA开发</option>
                            <option value="软件测试" <c:if test="${deliver.resumeJob=='软件测试'}"> selected="selected"</c:if>>软件测试</option>
                            <option value="PHP开发" <c:if test="${deliver.resumeJob=='PHP开发'}"> selected="selected"</c:if>>PHP开发</option>
                            <option value="Oracle维护" <c:if test="${deliver.resumeJob=='Oracle维护'}"> selected="selected"</c:if>>Oracle维护</option>
                            <option value="ASP.NET开发" <c:if test="${deliver.resumeJob=='ASP.NET开发'}"> selected="selected"</c:if>>ASP.NET开发</option>
                            <option value="大数据" <c:if test="${deliver.resumeJob=='大数据'}"> selected="selected"</c:if>>大数据</option>
                            <option value="日语翻译" <c:if test="${deliver.resumeJob=='日语翻译'}"> selected="selected"</c:if>>日语翻译</option>
                        </select>&nbsp;&nbsp;&nbsp;
                        用户性别：<select name="memberSex" style="width: 135px">
                            <option value="">请选择</option>
                            <option value="1" <c:if test="${deliver.memberSex=='1'}">selected="selected"</c:if>>男</option>
                            <option value="2" <c:if test="${deliver.memberSex=='2'}">selected="selected"</c:if>>女</option>
                        </select>&nbsp;&nbsp;&nbsp;
                        年龄：<input type="number" name="minAge" value="<c:if test="${minAge!='0'}">${minAge}</c:if>" style="width: 121px">&nbsp;&nbsp;--&nbsp;
                        <input type="number" name="maxAge" value="<c:if test="${maxAge!='0'}">${maxAge}</c:if>" style="width: 121px">&nbsp;&nbsp;&nbsp;
                        工作地点：<input name="resumePlace" type="text" value="${deliver.resumePlace}" style="width:128px;">&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="submit" class="btn btn-warning" value="搜索"><br>&nbsp;&nbsp;
                        最高学历：<select name="education" style="width: 135px">
                            <option value="">请选择</option>
                            <option value="本科" <c:if test="${deliver.education=='本科'}">selected="selected"</c:if>>本科</option>
                            <option value="大专" <c:if test="${deliver.education=='大专'}">selected="selected"</c:if>>大专</option>
                            <option value="硕士" <c:if test="${deliver.education=='硕士'}">selected="selected"</c:if>>硕士</option>
                            <option value="博士" <c:if test="${deliver.education=='博士'}">selected="selected"</c:if>>博士</option>
                        </select>&nbsp;&nbsp;&nbsp;
                        工作年限：<select name="resumeYear" style="width: 135px">
                            <option value="-1">请选择</option>
                            <option value="0" <c:if test="${deliver.resumeYear=='0'}">selected="selected"</c:if>>无经验</option>
                            <option value="1" <c:if test="${deliver.resumeYear=='1'}">selected="selected"</c:if>>1年</option>
                            <option value="2" <c:if test="${deliver.resumeYear=='2'}">selected="selected"</c:if>>2年</option>
                            <option value="3" <c:if test="${deliver.resumeYear=='3'}">selected="selected"</c:if>>3年</option>
                            <option value="4" <c:if test="${deliver.resumeYear>'3'}">selected="selected"</c:if>>3年以上</option>
                        </select>
                    </div>
                    <table class="table">
                        <thead>
                        <tr>
                            <th class="v">#</th>
                            <th class="v">姓名</th>
                            <th class="v">求职意向</th>
                            <th class="v">性别</th>
                            <th class="v">年龄</th>
                            <th class="v">工作年限</th>
                            <th class="v">学历</th>
                            <th class="v">毕业院校</th>
                            <th class="v">工作地</th>
                            <th class="v">投递日期</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="dd" items="${deliverList}">
                            <tr>
                                <td>${dd.resumeId}</td>
                                <td>${dd.memberName}</td>
                                <td>${dd.resumeJob}</td>

                                <c:if test="${dd.memberSex == '1'}"><td>男</td></c:if>
                                <c:if test="${dd.memberSex == '2'}"><td>女</td></c:if>
                                <td>${dd.memberAge}岁</td>

                                <c:if test="${dd.resumeYear==0}"><td>无经验</td></c:if>
                                <c:if test="${dd.resumeYear>0}"><td>${dd.resumeYear}年</td></c:if>
                                <td>${dd.education}</td>
                                <td>${dd.school}</td>
                                <td>${dd.resumePlace}</td>
                                <td><fmt:formatDate value="${dd.sendDate}" type="both" pattern="yyyy-MM-dd"/></td>
                                <td><a href="###">删除</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="pagination">
                    <c:if test="${pages > 1}">
                        <ul>
                            <input id="deliverPage" type="hidden" name="page" value="${page}">
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

