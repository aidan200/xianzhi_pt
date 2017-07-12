<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入日期格式--%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--分页--%>
<%@ taglib prefix="page" uri="/xianzhiOA/pageTag" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>招聘</title>
    <jsp:include page="cssJsHeader.jsp"/>
    <link href='https://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700' rel='stylesheet' type='text/css'>
    <script type="application/javascript">
        //分页
        function pToSub(page) {
            if (page != undefined) {
                var pageInp = document.getElementById("sendPage");
                pageInp.value = page;
                var form = document.getElementById("sendForm");
                form.submit();
            }
        }
    </script>
</head>
<body>
<jsp:include page="headerForeEnd.jsp"/>
<!-- banner -->
<div class="courses_banner">
    <div class="container">
        <h3>应聘信息</h3>
        <p class="description">

        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="${pageContext.request.contextPath}/XzLogin/goIndex.do">首页</a></li>
                <li class="current-page">企业招聘</li>
            </ul>
        </div>
    </div>
</div>
<!-- //banner -->
<div class="courses_box1">
    <div class="container">

        <div class="">
            <div class="course_list">
                <form id="sendForm" action="${pageContext.request.contextPath}/Resume/selectResumeAllIndex.do">
                    <div class="userlist_search col-md-12 col-sm-12">
                        <div class="user_1 col-md-3"><span>按求职意向：</span>
                            <select name="resumeJob" style="font-size: 15px" class="user_search">
                                <option value="">按求职意向搜索</option>
                                <option value="JAVA开发" <c:if
                                        test="${resumeSend.resumeJob=='JAVA开发'}"> selected="selected"</c:if>>JAVA开发
                                </option>
                                <option value="软件测试" <c:if
                                        test="${resumeSend.resumeJob=='软件测试'}"> selected="selected"</c:if>>软件测试
                                </option>
                                <option value="PHP开发" <c:if
                                        test="${resumeSend.resumeJob=='PHP开发'}"> selected="selected"</c:if>>PHP开发
                                </option>
                                <option value="Oracle维护" <c:if
                                        test="${resumeSend.resumeJob=='Oracle维护'}"> selected="selected"</c:if>>Oracle维护
                                </option>
                                <option value="ASP.NET开发" <c:if
                                        test="${resumeSend.resumeJob=='ASP.NET开发'}"> selected="selected"</c:if>>
                                    ASP.NET开发
                                </option>
                                <option value="大数据" <c:if
                                        test="${resumeSend.resumeJob=='大数据'}"> selected="selected"</c:if>>大数据
                                </option>
                                <option value="日语翻译" <c:if
                                        test="${resumeSend.resumeJob=='日语翻译'}"> selected="selected"</c:if>>日语翻译
                                </option>
                            </select>
                        </div>
                        <div class="user_1 col-md-3"><span>按性别：</span>
                            <select name="memberSex" style="font-size: 15px" class="user_search">
                                <option value="">按性别</option>
                                <option value="1" <c:if test="${resumeSend.memberSex=='1'}">selected="selected"</c:if>>
                                    男
                                </option>
                                <option value="2" <c:if test="${resumeSend.memberSex=='2'}">selected="selected"</c:if>>
                                    女
                                </option>
                            </select>
                        </div>
                        <div class="user_1 col-md-3"><span>按学历：</span>
                            <select name="education" style="font-size: 15px" class="user_search">
                                <option value="">按学历</option>
                                <option value="本科"
                                        <c:if test="${resumeSend.education=='本科'}">selected="selected"</c:if>>本科
                                </option>
                                <option value="大专"
                                        <c:if test="${resumeSend.education=='大专'}">selected="selected"</c:if>>大专
                                </option>
                                <option value="硕士"
                                        <c:if test="${resumeSend.education=='硕士'}">selected="selected"</c:if>>硕士
                                </option>
                                <option value="博士"
                                        <c:if test="${resumeSend.education=='博士'}">selected="selected"</c:if>>博士
                                </option>
                            </select>
                        </div>
                        <div class="user_1 col-md-3"><span>按查看状态：</span>
                            <select name="state" style="font-size: 15px" class="user_search">
                                <option value="-1">按查看状态</option>
                                <option value="1" <c:if test="${resumeSend.state=='1'}">selected="selected"</c:if>>已查看
                                </option>
                                <option value="2" <c:if test="${resumeSend.state=='2'}">selected="selected"</c:if>>未查看
                                </option>
                            </select>
                        </div>
                        <div class="user_1 col-md-3"><span>按工作年限：</span>
                            <select name="resumeYear" style="font-size: 15px" class="user_search">
                                <option value="">工作年限</option>
                                <option value="无工作经验"
                                        <c:if test="${resumeSend.resumeYear=='无工作经验'}">selected="selected"</c:if>>无工作经验
                                </option>
                                <option value="小于1年"
                                        <c:if test="${resumeSend.resumeYear=='小于1年'}">selected="selected"</c:if>>小于1年
                                </option>
                                <option value="1-2年"
                                        <c:if test="${resumeSend.resumeYear=='1-2年'}">selected="selected"</c:if>>1-2年
                                </option>
                                <option value="2-3年"
                                        <c:if test="${resumeSend.resumeYear=='2-3年'}">selected="selected"</c:if>>2-3年
                                </option>
                                <option value="3-5年"
                                        <c:if test="${resumeSend.resumeYear=='3-5年'}">selected="selected"</c:if>>3-5年
                                </option>
                                <option value="5-10年"
                                        <c:if test="${resumeSend.resumeYear=='5-10年'}">selected="selected"</c:if>>5-10年
                                </option>
                                <option value="10年以上"
                                        <c:if test="${resumeSend.resumeYear=='10年以上'}">selected="selected"</c:if>>10年以上
                                </option>
                            </select>
                        </div>
                        <div class="user_1 col-md-3"><span>按工作地：</span>
                            <input class="user_search" style="font-size: 15px" type="text" name="resumePlace"
                                   value="${resumeSend.resumePlace}" placeholder=" 按工作地">

                        </div>
                        <div class="user_1 col-md-3"><span>按年龄：</span>
                            <div style="width: 100%">
                                <input class="user_search7" type="number" name="minAge"
                                       value="<c:if test="${minAge!='0'}">${minAge}</c:if>" style="font-size: 15px"
                                       placeholder=" 按年龄">-
                                <input class="user_search7" type="number" name="maxAge"
                                       value="<c:if test="${maxAge!='0'}">${maxAge}</c:if>" style="font-size: 15px"
                                       placeholder=" 按年龄"></div>

                        </div>

                        <div class="user_1 col-md-3"><span>投递情况：</span>
                            <select name="companyId" style="font-size: 15px" class="user_search">
                                <option value="0">
                                    全部查询
                                </option>
                                <option value="${companyId}" <c:if test="${resumeSend.companyId!=0&&resumeSend.companyId!=null}">selected</c:if>>
                                    已投递简历
                                </option>
                            </select><button type="submit" style="border: none;background-color: transparent;outline: none "><span
                                    class="fa fa-search" style="cursor: pointer"></span></button>
                        </div>




                    </div>
                    <div style="clear:both;"></div>
                    <div class="table-responsive">
                        <table class="table-fix table table-striped">
                            <thead>
                            <tr>
                                <th class="w1">姓名</th>
                                <th class="w5">求职意向</th>
                                <th class="w3">性别</th>
                                <th class="w3">年龄</th>
                                <th class="w10">工作年限</th>
                                <th class="w3">学历</th>
                                <th class="w1">工作地</th>
                                <c:if test="${resumeSend.companyId!=0&&resumeSend.companyId!=null}">
                                    <th class="w1">投递日期</th>
                                </c:if>

                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="rs" items="${sendList}">
                                <tr class="user_height">
                                    <td class="ww"><a
                                            href="${pageContext.request.contextPath}/Resume/selectPersonalResume.do?memberId=${rs.memberId}&resumeId=${rs.resumeId}&companyId=${companyId}">${rs.memberName}</a>
                                    </td>
                                    <td class="ww">${rs.resumeJob}</td>
                                    <c:if test="${rs.memberSex == '1'}">
                                        <td class="ww">男</td>
                                    </c:if>
                                    <c:if test="${rs.memberSex == '2'}">
                                        <td class="ww">女</td>
                                    </c:if>

                                    <td class="ww">${rs.memberAge}岁</td>

                                    <td class="ww">${rs.resumeYear}</td>

                                    <td class="ww">${rs.education}</td>
                                    <td>${rs.resumePlace}</td>
                                    <td class="ww"><fmt:formatDate value="${rs.sendDate}" type="both"
                                                                   pattern="yyyy-MM-dd"/></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>


                </form>
                <ul class="pagination">
                    <c:if test="${pages > 1}">
                        <li>
                            <input id="sendPage" type="hidden" name="page" value="${page}">
                            <page:paging length="10" page="${page}" pages="${pages}"/>
                        </li>
                    </c:if>
                </ul>


            </div>
        </div>


        <div class="clearfix"></div>
    </div>
</div>

<jsp:include page="footerForeEnd.jsp"/>


</body>
</html>