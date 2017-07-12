<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Title</title>
    <script>
        window.onload = function () {
            var payForm = document.getElementById("payForm");
            payForm.action = "https://api.mch.weixin.qq.com/pay/unifiedorder?appid=${appid}&mch_id=${mch_id}&device_info=${device_info}&body=${body}&nonce_str=${nonce_str}&sign=${sign}";
        }
    </script>
</head>
<body>
<form id="payForm" action="" method="post">
    appid:<input type="text" readonly="readonly" value="${appid}" name="appid"><br><br>
    mch_id：<input type="text" readonly="readonly" value="${mch_id}" name="mch_id"><br><br>
    device_info：<input type="text" readonly="readonly" value="${device_info}" name="device_info"><br><br>
    body:<input type="text" readonly="readonly" value="${body}" name="body"><br><br>
    nonce_str:<input type="text" readonly="readonly" value="${nonce_str}" name="nonce_str"><br><br>
    sign:<input type="text" readonly="readonly" value="${sign}" name="sign"><br><br>
    <button type="submit">微信支付测试按钮</button>
</form>
</body>
</html>
