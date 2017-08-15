<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/8/4
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <jsp:include page="distforeEnd.jsp"/>
</head>
<body>


<%--带input--%>
<a href="###" class="newtan3"><span>点我</span></a>
<div class="newpop3" role="alert">
    <div class="newpop3_container">
        <div class="allnew3_tan">
            <input type="text" class="tan3_input">
        </div>
        <div>
            <button class="bee_one">确定</button>
            <button class="all_close3 bee_two">取消</button>
        </div>

        <a href="###" class="all_close3 tan_close3 fa fa-remove"></a>
    </div>
</div>



<%--确定和取消--%>
<a href="###" class="newtan"><span>点我</span></a>
<div class="newpop" role="alert">
    <div class="newpop_container">
        <div class="allnew_tan">
            哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈
        </div>
        <div>
            <button class="bee_one">确定</button>
            <button class="all_close bee_two">取消</button>
        </div>
        <a href="###" class="all_close tan_close fa fa-remove"></a>
    </div>
</div>

<%--成功--%>
<a href="###" class="new_success"><span>点我</span></a>
<div class="successpop" role="alert">
    <div class="successpop_container">
        <div class="allsuccess_tan">
            什么什么什么成功了
        </div>
        <div>
            <button class="bee_one">确定</button>
            <button class="success_close bee_two">取消</button>
        </div>
        <a href="###" class="success_close tan_close0 fa fa-remove"></a>
    </div>
</div>

<%--失败--%>
<a href="###" class="new_fail"><span>点我</span></a>
<div class="failpop" role="alert">
    <div class="failpop_container">
        <div class="allfail_tan">
            失败失败太失败了
        </div>
        <div>
            <button class="bee_one">确定</button>
            <button class="fail_close bee_two">取消</button>
        </div>
        <a href="###" class="fail_close tan_close1 fa fa-remove"></a>
    </div>
</div>


<script src="${pageContext.request.contextPath}/dist/foreEnd3/js/tanthree.js"></script>
</body>
</html>
