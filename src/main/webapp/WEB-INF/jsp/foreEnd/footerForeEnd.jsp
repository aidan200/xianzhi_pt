<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/4/7
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
</head>
<body>
<div class="footer">
    <div class="container">
        <div class="col-md-3 grid_4">
            <h3>关于我们</h3>
            <p>
                伴随IT产业的发展和变革，人才培训实施体系、人才资格评定体系、继续学习支撑体系、人才发展跟踪服务体系、人才交流互动体系、专家库体系及人才培养组织体系的中高端IT人才能力模型，推出中高端IT人才能力发展解决方案。</p>
            <ul class="social-nav icons_2 clearfix">
                <li><a href="#" class="twitter"><i class="fa fa-twitter"></i></a></li>
                <li><a href="#" class="facebook"> <i class="fa fa-facebook"></i></a></li>
                <li><a href="#" class="google-plus"><i class="fa fa-google-plus"></i></a></li>
            </ul>
        </div>

        <div class="col-md-3 grid_4">
            <h3>联系我们</h3>
            <ul class="footer_list">
                <li><a href="#">- 地址:沈阳市和平区 </a></li>
                <li><a href="#">- 邮编:110000</a></li>
                <li><a href="#">- 电话: 024-31091926</a></li>
                <li><a href="#">- 电子邮箱:xianzhi_lc @163.com</a></li>
            </ul>
        </div>
        <div class="col-md-3 grid_4">
            <h3>快速链接 </h3>
            <ul class="footer_list">
                <li><a href="#">- 先知博客 </a></li>
                <li><a href="#">- 先知论坛</a></li>
                <li><a href="${pageContext.request.contextPath}/XzRegister/goRegister.do">- 账号注册</a></li>
                <li><a href="#">- 先知课程</a></li>
            </ul>
        </div>
        <div class="col-md-3 grid_4">
            <h3>工作时间</h3>
            <table class="table_working_hours">
                <tbody>
                <tr class="opened_1">
                    <td class="day_label">星期一</td>
                    <td class="day_value">上午 9:00 - 下午 6.00</td>
                </tr>
                <tr class="opened">
                    <td class="day_label">星期二</td>
                    <td class="day_value">上午 9:00 - 下午 6.00</td>
                </tr>
                <tr class="opened">
                    <td class="day_label">星期三</td>
                    <td class="day_value">上午 9:00 - 下午 6.00</td>
                </tr>
                <tr class="opened">
                    <td class="day_label">星期四</td>
                    <td class="day_value">上午 9:00 - 下午 6.00</td>
                </tr>
                <tr class="opened">
                    <td class="day_label">星期五</td>
                    <td class="day_value">上午 9:00 - 下午 3.00</td>
                </tr>
                <tr class="closed">
                    <td class="day_label">星期六</td>
                    <td class="day_value closed"><span>关闭</span></td>
                </tr>
                <tr class="closed">
                    <td class="day_label">星期日</td>
                    <td class="day_value closed"><span>关闭</span></td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="clearfix"></div>
        <div class="copy">
            <p>Copyright &copy; 2017. <a target="_blank" href="http://xianzhilanchuang.com/">先知蓝创科技有限公司</a> 版权所有</p>
        </div>
    </div>
</div>
</body>
</html>
