<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/5/24
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <script type="application/javascript">
        window.onload = function () {
            var id = sessionStorage.getItem("leftMenu");
            if(id == null){
                id = 0;
            }
            run(id);
        }
        function run(id) {
            if (id == 2) {
                a2();
            } else if (id == 3) {
                a3();
            } else if (id == 4) {
                a4();
            } else if (id == 5) {
                a5();
            } else {
                a1();
            }
        }
        function testHaHa(id,action) {
            sessionStorage.setItem("leftMenu",id);
            window.location.href = action;
        }
        function a1() {
            $("#collapseOne").attr("class", "panel-collapse collapse in");
            $("#collapseTwo").attr("class", "panel-collapse collapse");
            $("#collapseThree").attr("class", "panel-collapse collapse");
            $("#collapseFour").attr("class", "panel-collapse collapse");
            $("#collapseFive").attr("class", "panel-collapse collapse");
        }
        function a2() {
            $("#collapseOne").attr("class", "panel-collapse collapse");
            $("#collapseTwo").attr("class", "panel-collapse collapse in");
            $("#collapseThree").attr("class", "panel-collapse collapse");
            $("#collapseFour").attr("class", "panel-collapse collapse");
            $("#collapseFive").attr("class", "panel-collapse collapse");
        }
        function a3() {
            $("#collapseOne").attr("class", "panel-collapse collapse");
            $("#collapseTwo").attr("class", "panel-collapse collapse");
            $("#collapseThree").attr("class", "panel-collapse collapse in");
            $("#collapseFour").attr("class", "panel-collapse collapse");
            $("#collapseFive").attr("class", "panel-collapse collapse");
        }
        function a4() {
            $("#collapseOne").attr("class", "panel-collapse collapse");
            $("#collapseTwo").attr("class", "panel-collapse collapse");
            $("#collapseThree").attr("class", "panel-collapse collapse");
            $("#collapseFour").attr("class", "panel-collapse collapse in");
            $("#collapseFive").attr("class", "panel-collapse collapse");
        }
        function a5() {
            $("#collapseOne").attr("class", "panel-collapse collapse");
            $("#collapseTwo").attr("class", "panel-collapse collapse");
            $("#collapseThree").attr("class", "panel-collapse collapse");
            $("#collapseFour").attr("class", "panel-collapse collapse");
            $("#collapseFive").attr("class", "panel-collapse collapse in");
        }


    </script>
</head>
<body>

<div class="navbar">
    <div class="navbar-inner">
        <ul class="nav pull-right">
        </ul>
        <a class="brand" href="${pageContext.request.contextPath}/Teacher/backEndIndex"><span class="first">XIAN</span> <span class="second">ZHI</span></a>



    </div>
</div>

<div class="panel-group" id="accordion">

    <div class="panel panel-default">
        <a data-toggle="collapse" data-parent="#accordion"
           href="#collapseOne">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <i class="icon-bookmark"></i> &nbsp;展示类
                </h4>
            </div>
        </a>
        <div id="collapseOne" class="panel-collapse collapse in">
            <div class="panel-body" style="padding: 0">
                <ul style="padding: 0">
                    <li><a onclick="testHaHa(1,'${pageContext.request.contextPath}/Teacher/selectTeacherAll.emp')" class="nav_a">师资</a></li>
                    <li><a onclick="testHaHa(1,'${pageContext.request.contextPath}/News/selectNewsAll.emp')" class="nav_a">行业动态</a></li>
                    <li><a onclick="testHaHa(1,'${pageContext.request.contextPath}/Event/selectEventAll.emp')" class="nav_a">活动</a></li>
                    <li><a onclick="testHaHa(1,'${pageContext.request.contextPath}/Blog/selectBlogAll.emp')" class="nav_a">博客</a></li>
                    <li><a onclick="testHaHa(1,'${pageContext.request.contextPath}/Discuss/selectDiscussSelective.emp')" class="nav_a">评论</a></li>
                    <li><a onclick="testHaHa(1,'${pageContext.request.contextPath}/Item/selectItemAll.emp')" class="nav_a">项目</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="panel panel-default">
        <a data-toggle="collapse" data-parent="#accordion"
           href="#collapseTwo">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <i class="icon-bookmark"></i> &nbsp;用户信息
                </h4>
            </div>
        </a>
        <div id="collapseTwo" class="panel-collapse collapse">
            <div class="panel-body" style="padding: 0">
                <ul style="padding: 0">
                    <li><a onclick="testHaHa(2,'${pageContext.request.contextPath}/XzLogin/selAllLogin.emp')" class="nav_a">登录表</a></li>
                    <li><a onclick="testHaHa(2,'${pageContext.request.contextPath}/UserInfo/goUserInfo.emp')" class="nav_a">普通用户</a></li>
                    <li><a onclick="testHaHa(2,'${pageContext.request.contextPath}/CompanyInfo/goCompanyInfo.emp')" class="nav_a">企业用户</a></li>
                    <li><a onclick="testHaHa(2,'${pageContext.request.contextPath}/Education/goEducationEnd.emp')" class="nav_a">学历信息</a></li>
                    <li><a onclick="testHaHa(2,'${pageContext.request.contextPath}/WorkE/goWorkEEnd.emp')" class="nav_a">工作经验</a></li>
                    <li><a onclick="testHaHa(2,'${pageContext.request.contextPath}/ProjectE/goProjectEEnd.emp')" class="nav_a">项目经验</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="panel panel-default">
        <a data-toggle="collapse" data-parent="#accordion"
           href="#collapseThree">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <i class="icon-bookmark"></i> &nbsp;会员中心
                </h4>
            </div>
        </a>
        <div id="collapseThree" class="panel-collapse collapse">
            <div class="panel-body" style="padding: 0">
                <ul style="padding: 0">
                    <li><a onclick="testHaHa(3,'${pageContext.request.contextPath}/Vip/selectVipAllEnd.emp')" class="nav_a">会员信息</a></li>
                    <li><a onclick="testHaHa(3,'${pageContext.request.contextPath}/Cost/selectCostAll.emp')" class="nav_a">交易中心</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="panel panel-default">
        <a data-toggle="collapse" data-parent="#accordion"
           href="#collapseFour">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <i class="icon-bookmark"></i> &nbsp;招聘与应聘
                </h4>
            </div>
        </a>
        <div id="collapseFour" class="panel-collapse collapse">
            <div class="panel-body" style="padding: 0">
                <ul style="padding: 0">
                    <li><a onclick="testHaHa(4,'${pageContext.request.contextPath}/Resume/selectAllPersonalResume.emp')" class="nav_a">个人简历</a></li>
                    <li><a onclick="testHaHa(4,'${pageContext.request.contextPath}/XzRecruit/selectRecruit.emp')" class="nav_a">招聘信息</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="panel panel-default">
        <a data-toggle="collapse" data-parent="#accordion"
           href="#collapseFive">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <i class="icon-bookmark"></i> &nbsp;视频课程
                </h4>
            </div>
        </a>
        <div id="collapseFive" class="panel-collapse collapse">
            <div class="panel-body" style="padding: 0">
                <ul style="padding: 0">
                    <li><a onclick="testHaHa(5,'${pageContext.request.contextPath}/XzVideo/selectVideo.emp')" class="nav_a">视频课程</a></li>
                    <li><a onclick="testHaHa(5,'${pageContext.request.contextPath}/videoClass/selectVideoClass.emp')" class="nav_a">视频类别</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>
