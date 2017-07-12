<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/7/3
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="distforeEnd.jsp"/>
    <link href="${pageContext.request.contextPath}/umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/umeditor/third-party/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/umeditor/third-party/template.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/umeditor/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/umeditor/umeditor.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/umeditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body>

<jsp:include page="headerforeEnd.jsp"/>

<div class="container">
    <div class="bw_all">
            <div class="bw_top">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.jpg" alt="" class="bw_head">
                <div style="display: inline-block">
                    <h4>${userLogin.loginCount}</h4>
                    <div style="margin-left: 20px">
                        <span><a href="">个人主页</a></span> | <span><a href="">我的博客</a></span>
                    </div>
                </div>
            </div>
        <form id="blogForm" action="${pageContext.request.contextPath}/Blog/insertBlog.do" method="post">

            <div class="bw_t2" style="">
                <h4>发表文章</h4>
                <h5>文章标题</h5>
                <hr style="margin-top: 5px">
                <select name="blogStyle" id="" class="bw_s1">
                    <option value="未定义">请选择</option>
                    <option value="原创">原创</option>
                    <option value="转载">转载</option>
                </select>
                <input type="text" name="blogTitle" class="bw_in1"/>
                <h5>文章内容</h5>
                <textarea id="xianzhiEditor" name="blogArticle" style="width: 100%;height: 400px"></textarea>
                <%--<textarea class="bw_text"></textarea>--%>
                <h1 id="txtCount"></h1>
                <h5>文章标签 （添加Tag，你的内容能被更多人看到）</h5>
                <hr style="margin-top: 5px">
                <input type="text" name="blogTag" class="bw_in1">
                <span>（最多添加5个标签，多个标签之间用“,”分隔）</span>

                <h5>个人分类</h5>
                <hr style="margin-top: 5px">
                <input type="text" name="blogTypeSelf" class="bw_in1">
                <span>（多个分类之间用“,”分隔）</span>

                <h5>文章分类</h5>
                <hr style="margin-top: 5px">
                <div class="bw_classify"><input type="radio" name="blogType" value="移动开发"/> <span>移动开发</span></div>
                <div class="bw_classify"><input type="radio" name="blogType" value="Web前端"/> <span>Web前端</span></div>
                <div class="bw_classify"><input type="radio" name="blogType" value="架构设计"/> <span>架构设计</span></div>
                <div class="bw_classify"><input type="radio" name="blogType" value="编程语言"/> <span>编程语言</span></div>
                <div class="bw_classify"><input type="radio" name="blogType" value="互联网"/> <span>互联网</span></div>
                <div class="bw_classify"><input type="radio" name="blogType" value="数据库"/> <span>数据库</span></div>
                <div class="bw_classify"><input type="radio" name="blogType" value="系统运维"/> <span>系统运维</span></div>
                <div class="bw_classify"><input type="radio" name="blogType" value="云计算"/> <span>云计算</span></div>
                <div class="bw_classify"><input type="radio" name="blogType" value="研发管理"/> <span>研发管理</span></div>
                <div class="bw_classify"><input type="radio" name="blogType" checked="true" value="综合"/> <span>综合</span></div>

                <h5>摘要：（默认自动提取您文章的前200字显示在博客首页作为文章摘要，您也可以在这里自行编辑 ）</h5>
                <hr style="margin-top: 5px">
                <textarea id="blogAbstract" class="bw_text2" name="blogAbstract" ></textarea>
                <div>提示：请不要发布任何推广、广告（包括招聘）、政治、低俗等方面的内容，不要把博客当作SEO工具，否则可能会影响到您的使用。</div>
                <input id="blogState" type="hidden" name="blogState">
                <div class="bw_bottom">
                    <button class="bw_sb2" type="button" onclick="go(1)">发表文章</button>
                    <button class="bw_sb2" type="button" onclick="go(2)">保存</button>
                    <button class="bw_sb2" type="button" onclick="go(3)">舍弃</button></div>

            </div>


        </form>
    </div>
</div>


<footer>
</footer>
<script type="text/javascript">
    var um = UM.getEditor('xianzhiEditor',{imagePath:'${pageContext.request.contextPath}/'});
    console.log(um.options.imagePath);
    um.addListener("keydown",function(type,event){
        var content = um.getPlainTxt();
        var txtCount = document.getElementById("txtCount");
        txtCount.innerHTML = content.length;
    })
    function go(t) {
        if(t=='3'){
            console.log("重置");
        }else{
            var blogState = document.getElementById("blogState");
            var ab = document.getElementById("blogAbstract");
            if(ab.value.trim()==''){
                var content = um.getPlainTxt();
                var ss = /<(.*)>(.*)<\/(.*)>|<(.*)\/>|<(.*)>/;
                var gg  = content.replace(ss,'');
                ab.value = gg.substring(0,200).replace(ss,'');
            }
            blogState.value = t;
            var form = document.getElementById("blogForm");
            form.submit();
        }
    }
</script>
</body>
</html>
