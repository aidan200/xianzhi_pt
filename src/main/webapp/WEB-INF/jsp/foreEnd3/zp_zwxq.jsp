<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/3
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <jsp:include page="distforeEnd.jsp"/>
    <title>职位详情</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd3/css/zp_zwxq.css">
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/zp_lb.js"></script>
</head>
<body>
<jsp:include page="headerforeEnd.jsp"/>

<section class="container zp_zwxq_cont">
    <div class="row">
        <div class="col-md-8 zp_zwxq_cont_left">
            <div class="zp_zwxq_cont_left_top">
                <div>
                    <h1>${xzPostion.postionName}</h1>
                    <h3>${xzPostion.company.companyName}</h3>
                    <span class="triangle"></span>
                </div>
            </div>
            <div class="zp_zwxq_cont_left_middle">
                <h3>${fn:replace((xzPostion.postionMm*12/10000),".0","")}-${fn:replace((xzPostion.postionYm*12/10000),".0","")}万 <span>72小时反馈</span> <a href="">我感兴趣 请联系我</a></h3>
                <p><span>${xzPostion.postionSpace}</span>&nbsp;&nbsp;&nbsp;&nbsp;<span><fmt:formatDate value="${xzPostion.postionTime}" pattern="yyyy-MM-dd"/> </span><a href="" s>收藏</a></p>
                <div><span style="border-left: none">${xzPostion.postionEducation}</span><span>${xzPostion.postionExp}以上经验</span><span>普通话</span><span>${xzPostion.postionAge}</span></div>
            </div>
            <div class="zp_zwxq_cont_left_bottom">
                <span class="tag" title="带薪年假">带薪年假</span>

                <span class="tag" title="交通补助">交通补助</span>

                <span class="tag" title="定期体检">定期体检</span>

                <span class="tag" title="年度旅游">年度旅游</span>

                <span class="tag" title="领导好">领导好</span>

                <span class="tag" title="五险一金">五险一金</span>

                <span class="tag" title="团队聚餐">团队聚餐</span>

                <span class="tag" title="上市公司">上市公司</span>
            </div>
            <div class="zp_zwxq_cont_left_zwms">
                <h3>职位描述：</h3>
                <div>
                    10、职位名称：前端开发工程师<br>
                    工作地点：沈阳<br>    工作职责：<br>
                    1、负责移动和平台前端部分的设计和开发，确保产品具有一流的用户体验；<br>
                    2、了解产品后端技术实现，提供对应的前端解决方案，并配合后端工程师完成数据接口的开发和调试；<br>
                    3、负责前端架构在业务线的落地实施，并结合各产品线实际情况，参与部分前端架构开发工作；<br>
                    4、负责解决前端产品在不同设备及不同版本下的兼容问题；<br>
                    5、负责前端产品性能和代码优化的实施；<br>
                    6、负责前端领域通用技术的建设。
                    <br><br>
                    任职资格：<br>
                    1、2年以上前端开发经验；<br>
                    2、精通HTML5、CSS、javascript跨平台开发经验，有es2015、CSS3、Node JS方面经验者优先，有前端自动化测试、单元测试方面经验者优先；<br>
                    3、熟悉各移动场景下的前端技术实现（如微信平台内嵌，移动站点，hybrid开发等），并有实际项目经验；<br>
                    4、深刻理解 Web 标准、HTML 语义化标签，对符合 Web 标准的网站重构有丰富经验；<br>
                    5、理解并掌握 Javascript 语言核心技术，熟悉至少一种主流 Javascript 框架( 如Zepto/JQuery/Vue等 ；<br>
                    6、熟悉OO、MVC、MVVM等编程思想，熟练使用至少一种前端架构（如ReactJS/AngularJS/Vue等）；<br>
                    7、至少了解一门服务器端相关技术；<br>    8、能够熟练使用linux；<br>
                    9、对软件工程相关概念及流程、敏捷开发概念及流程有所了解；<br>
                    10、学习能力强，积极主动，且具备良好的沟通协调能力和强烈的责任心。
                </div>
            </div>
            <div class="zp_zwxq_cont_left_qtxx">
                <h3>其他信息：</h3>
                <ul>
                    <li><span>所属部门：</span><label>先行产品研发事业部</label></li>
                    <li><span>专业要求：</span><label>不限</label></li>
                    <li><span>汇报对象：</span><label>无</label></li>
                    <li><span>下属人数：</span><label>0人</label></li>
                </ul>
            </div>
            <div class="zp_zwxq_cont_left_qyjs">
                <h3>企业介绍：</h3>
                <div>
                    东软是中国最大的IT解决方案与服务供应商。目前，拥有员工20000余名，在中国建立了6个软件研发基地，8个区域总部，
                    在40多个城市建立营销与服务网络；在美国、日本、欧洲、中东设有子公司。 东软以软件技术为核心，提供行业解决方案、
                    产品工程解决方案以及相关产品、平台及服务。行业解决方案涵盖领域包括：电信、能源、金融、政府（社会保障、财政、税务、公共安全、国土资源
                    <a href="javascript:;">[展开]</a>
                </div>
            </div>
            <div class="zp_zwxq_cont_left_xq">
                <h3>可能感兴趣的职位：</h3>
                <div>
                    <div>
                        <ul>
                            <li>
                                <p>
                                    <a href="" class="zp_zwxq_a1">总经理秘书</a>
                                    <span class="zp_zwxq_span1">6-10万</span>
                                    <a href="" class="zp_zwxq_a2">美加置业</a>
                                </p>
                                <p>
                                    <span class="edu">统招本科 |3年工作经验</span>
                                    <span class="place" title="武汉">武汉</span>
                                    <span class="industry" title="房地产开发/建筑/建材/工程">房地产开发/建筑/建材/工程</span>
                                </p>
                            </li>
                            <li>
                                <p>
                                    <a href="" class="zp_zwxq_a1">总经理秘书</a>
                                    <span class="zp_zwxq_span1">6-10万</span>
                                    <a href="" class="zp_zwxq_a2">美加置业</a>
                                </p>
                                <p>
                                    <span class="edu">统招本科 |3年工作经验</span>
                                    <span class="place" title="武汉">武汉</span>
                                    <span class="industry" title="房地产开发/建筑/建材/工程">房地产开发/建筑/建材/工程</span>
                                </p>
                            </li>
                            <li>
                                <p>
                                    <a href="" class="zp_zwxq_a1">总经理秘书</a>
                                    <span class="zp_zwxq_span1">6-10万</span>
                                    <a href="" class="zp_zwxq_a2">美加置业</a>
                                </p>
                                <p>
                                    <span class="edu">统招本科 |3年工作经验</span>
                                    <span class="place" title="武汉">武汉</span>
                                    <span class="industry" title="房地产开发/建筑/建材/工程">房地产开发/建筑/建材/工程</span>
                                </p>
                            </li>
                            <li>
                                <p>
                                    <a href="" class="zp_zwxq_a1">总经理秘书</a>
                                    <span class="zp_zwxq_span1">6-10万</span>
                                    <a href="" class="zp_zwxq_a2">美加置业</a>
                                </p>
                                <p>
                                    <span class="edu">统招本科 |3年工作经验</span>
                                    <span class="place" title="武汉">武汉</span>
                                    <span class="industry" title="房地产开发/建筑/建材/工程">房地产开发/建筑/建材/工程</span>
                                </p>
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <p>
                                    <a href="" class="zp_zwxq_a1">总经理秘书</a>
                                    <span class="zp_zwxq_span1">6-10万</span>
                                    <a href="" class="zp_zwxq_a2">美加置业</a>
                                </p>
                                <p>
                                    <span class="edu">统招本科 |3年工作经验</span>
                                    <span class="place" title="武汉">武汉</span>
                                    <span class="industry" title="房地产开发/建筑/建材/工程">房地产开发/建筑/建材/工程</span>
                                </p>
                            </li>
                            <li>
                                <p>
                                    <a href="" class="zp_zwxq_a1">总经理秘书</a>
                                    <span class="zp_zwxq_span1">6-10万</span>
                                    <a href="" class="zp_zwxq_a2">美加置业</a>
                                </p>
                                <p>
                                    <span class="edu">统招本科 |3年工作经验</span>
                                    <span class="place" title="武汉">武汉</span>
                                    <span class="industry" title="房地产开发/建筑/建材/工程">房地产开发/建筑/建材/工程</span>
                                </p>
                            </li>
                            <li>
                                <p>
                                    <a href="" class="zp_zwxq_a1">总经理秘书</a>
                                    <span class="zp_zwxq_span1">6-10万</span>
                                    <a href="" class="zp_zwxq_a2">美加置业</a>
                                </p>
                                <p>
                                    <span class="edu">统招本科 |3年工作经验</span>
                                    <span class="place" title="武汉">武汉</span>
                                    <span class="industry" title="房地产开发/建筑/建材/工程">房地产开发/建筑/建材/工程</span>
                                </p>
                            </li>
                            <li>
                                <p>
                                    <a href="" class="zp_zwxq_a1">总经理秘书</a>
                                    <span class="zp_zwxq_span1">6-10万</span>
                                    <a href="" class="zp_zwxq_a2">美加置业</a>
                                </p>
                                <p>
                                    <span class="edu">统招本科 |3年工作经验</span>
                                    <span class="place" title="武汉">武汉</span>
                                    <span class="industry" title="房地产开发/建筑/建材/工程">房地产开发/建筑/建材/工程</span>
                                </p>
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <p>
                                    <a href="" class="zp_zwxq_a1">总经理秘书</a>
                                    <span class="zp_zwxq_span1">6-10万</span>
                                    <a href="" class="zp_zwxq_a2">美加置业</a>
                                </p>
                                <p>
                                    <span class="edu">统招本科 |3年工作经验</span>
                                    <span class="place" title="武汉">武汉</span>
                                    <span class="industry" title="房地产开发/建筑/建材/工程">房地产开发/建筑/建材/工程</span>
                                </p>
                            </li>
                            <li>
                                <p>
                                    <a href="" class="zp_zwxq_a1">总经理秘书</a>
                                    <span class="zp_zwxq_span1">6-10万</span>
                                    <a href="" class="zp_zwxq_a2">美加置业</a>
                                </p>
                                <p>
                                    <span class="edu">统招本科 |3年工作经验</span>
                                    <span class="place" title="武汉">武汉</span>
                                    <span class="industry" title="房地产开发/建筑/建材/工程">房地产开发/建筑/建材/工程</span>
                                </p>
                            </li>
                            <li>
                                <p>
                                    <a href="" class="zp_zwxq_a1">总经理秘书</a>
                                    <span class="zp_zwxq_span1">6-10万</span>
                                    <a href="" class="zp_zwxq_a2">美加置业</a>
                                </p>
                                <p>
                                    <span class="edu">统招本科 |3年工作经验</span>
                                    <span class="place" title="武汉">武汉</span>
                                    <span class="industry" title="房地产开发/建筑/建材/工程">房地产开发/建筑/建材/工程</span>
                                </p>
                            </li>
                            <li>
                                <p>
                                    <a href="" class="zp_zwxq_a1">总经理秘书</a>
                                    <span class="zp_zwxq_span1">6-10万</span>
                                    <a href="" class="zp_zwxq_a2">美加置业</a>
                                </p>
                                <p>
                                    <span class="edu">统招本科 |3年工作经验</span>
                                    <span class="place" title="武汉">武汉</span>
                                    <span class="industry" title="房地产开发/建筑/建材/工程">房地产开发/建筑/建材/工程</span>
                                </p>
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <p>
                                    <a href="" class="zp_zwxq_a1">总经理秘书</a>
                                    <span class="zp_zwxq_span1">6-10万</span>
                                    <a href="" class="zp_zwxq_a2">美加置业</a>
                                </p>
                                <p>
                                    <span class="edu">统招本科 |3年工作经验</span>
                                    <span class="place" title="武汉">武汉</span>
                                    <span class="industry" title="房地产开发/建筑/建材/工程">房地产开发/建筑/建材/工程</span>
                                </p>
                            </li>
                            <li>
                                <p>
                                    <a href="" class="zp_zwxq_a1">总经理秘书</a>
                                    <span class="zp_zwxq_span1">6-10万</span>
                                    <a href="" class="zp_zwxq_a2">美加置业</a>
                                </p>
                                <p>
                                    <span class="edu">统招本科 |3年工作经验</span>
                                    <span class="place" title="武汉">武汉</span>
                                    <span class="industry" title="房地产开发/建筑/建材/工程">房地产开发/建筑/建材/工程</span>
                                </p>
                            </li>
                            <li>
                                <p>
                                    <a href="" class="zp_zwxq_a1">总经理秘书</a>
                                    <span class="zp_zwxq_span1">6-10万</span>
                                    <a href="" class="zp_zwxq_a2">美加置业</a>
                                </p>
                                <p>
                                    <span class="edu">统招本科 |3年工作经验</span>
                                    <span class="place" title="武汉">武汉</span>
                                    <span class="industry" title="房地产开发/建筑/建材/工程">房地产开发/建筑/建材/工程</span>
                                </p>
                            </li>
                            <li>
                                <p>
                                    <a href="" class="zp_zwxq_a1">总经理秘书</a>
                                    <span class="zp_zwxq_span1">6-10万</span>
                                    <a href="" class="zp_zwxq_a2">美加置业</a>
                                </p>
                                <p>
                                    <span class="edu">统招本科 |3年工作经验</span>
                                    <span class="place" title="武汉">武汉</span>
                                    <span class="industry" title="房地产开发/建筑/建材/工程">房地产开发/建筑/建材/工程</span>
                                </p>
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <p>
                                    <a href="" class="zp_zwxq_a1">总经理秘书</a>
                                    <span class="zp_zwxq_span1">6-10万</span>
                                    <a href="" class="zp_zwxq_a2">美加置业</a>
                                </p>
                                <p>
                                    <span class="edu">统招本科 |3年工作经验</span>
                                    <span class="place" title="武汉">武汉</span>
                                    <span class="industry" title="房地产开发/建筑/建材/工程">房地产开发/建筑/建材/工程</span>
                                </p>
                            </li>
                            <li>
                                <p>
                                    <a href="" class="zp_zwxq_a1">总经理秘书</a>
                                    <span class="zp_zwxq_span1">6-10万</span>
                                    <a href="" class="zp_zwxq_a2">美加置业</a>
                                </p>
                                <p>
                                    <span class="edu">统招本科 |3年工作经验</span>
                                    <span class="place" title="武汉">武汉</span>
                                    <span class="industry" title="房地产开发/建筑/建材/工程">房地产开发/建筑/建材/工程</span>
                                </p>
                            </li>
                            <li>
                                <p>
                                    <a href="" class="zp_zwxq_a1">总经理秘书</a>
                                    <span class="zp_zwxq_span1">6-10万</span>
                                    <a href="" class="zp_zwxq_a2">美加置业</a>
                                </p>
                                <p>
                                    <span class="edu">统招本科 |3年工作经验</span>
                                    <span class="place" title="武汉">武汉</span>
                                    <span class="industry" title="房地产开发/建筑/建材/工程">房地产开发/建筑/建材/工程</span>
                                </p>
                            </li>
                            <li>
                                <p>
                                    <a href="" class="zp_zwxq_a1">总经理秘书</a>
                                    <span class="zp_zwxq_span1">6-10万</span>
                                    <a href="" class="zp_zwxq_a2">美加置业</a>
                                </p>
                                <p>
                                    <span class="edu">统招本科 |3年工作经验</span>
                                    <span class="place" title="武汉">武汉</span>
                                    <span class="industry" title="房地产开发/建筑/建材/工程">房地产开发/建筑/建材/工程</span>
                                </p>
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <p>
                                    <a href="" class="zp_zwxq_a1">总经理秘书</a>
                                    <span class="zp_zwxq_span1">6-10万</span>
                                    <a href="" class="zp_zwxq_a2">美加置业</a>
                                </p>
                                <p>
                                    <span class="edu">统招本科 |3年工作经验</span>
                                    <span class="place" title="武汉">武汉</span>
                                    <span class="industry" title="房地产开发/建筑/建材/工程">房地产开发/建筑/建材/工程</span>
                                </p>
                            </li>
                            <li>
                                <p>
                                    <a href="" class="zp_zwxq_a1">总经理秘书</a>
                                    <span class="zp_zwxq_span1">6-10万</span>
                                    <a href="" class="zp_zwxq_a2">美加置业</a>
                                </p>
                                <p>
                                    <span class="edu">统招本科 |3年工作经验</span>
                                    <span class="place" title="武汉">武汉</span>
                                    <span class="industry" title="房地产开发/建筑/建材/工程">房地产开发/建筑/建材/工程</span>
                                </p>
                            </li>
                            <li>
                                <p>
                                    <a href="" class="zp_zwxq_a1">总经理秘书</a>
                                    <span class="zp_zwxq_span1">6-10万</span>
                                    <a href="" class="zp_zwxq_a2">美加置业</a>
                                </p>
                                <p>
                                    <span class="edu">统招本科 |3年工作经验</span>
                                    <span class="place" title="武汉">武汉</span>
                                    <span class="industry" title="房地产开发/建筑/建材/工程">房地产开发/建筑/建材/工程</span>
                                </p>
                            </li>
                            <li>
                                <p>
                                    <a href="" class="zp_zwxq_a1">总经理秘书</a>
                                    <span class="zp_zwxq_span1">6-10万</span>
                                    <a href="" class="zp_zwxq_a2">美加置业</a>
                                </p>
                                <p>
                                    <span class="edu">统招本科 |3年工作经验</span>
                                    <span class="place" title="武汉">武汉</span>
                                    <span class="industry" title="房地产开发/建筑/建材/工程">房地产开发/建筑/建材/工程</span>
                                </p>
                            </li>
                        </ul>


                    </div>
                </div>
                <p>
                    <span style="background: #3D9CCC"></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </p>
                <a href="" class="zp_zwxq_cont_a_left"></a>
                <a href="" class="zp_zwxq_cont_a_right"></a>
            </div>
            <div class="zp_zwxq_cont_left_ss">
                <form action="">
                    <input type="text" placeholder="搜索其他职位，如：总经理秘书">
                    <button class="btn btn-primary" type="submit">
                        <span>搜索</span>
                    </button>
                </form>
                <div>
                    <a href="">岗位职责</a>&nbsp;&nbsp;<a href="">更多职位</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 zp_zwxq_cont_right">
            <div class="zp_zwxq_cont_right_cont">
                <div class="zp_zwxq_cont_1" style="border: 1px solid #E6E6E6">
                    <div class="zp_zwxq_cont_right_cont_top">
                        <h3>职位发布者</h3>
                        <div>
                            <p><img src="${pageContext.request.contextPath}/dist/foreEnd3/img/zp_zwxq_yhtx.gif" alt=""></p>
                            <p>
                                <span>陈主任</span>
                                <em class="muted">/ 人事主管</em>
                            </p>
                            <p>
                                武汉阅景汇投资发展有限公司
                            </p>
                            <p>
                                <a class="btn btn-primary"  href="javascript:;">立即沟通</a>
                            </p>
                            <div>
                                <div style="border-right: 1px dotted #d8d8d8;">
                                    <span>100</span>%
                                    <p>应聘查看率</p>
                                </div>
                                <div>
                                    <span>1</span>天
                                    <p>应聘查看用时</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="zp_zwxq_cont_right_cont_middle">
                        <h3>企业简介</h3>
                        <h4>
                            <a href="" class="zp_zwxq_cont_right_cont_middle_a1"> 武汉阅景汇投资发展有限公司</a>
                            <a href="javascript:;" class="btn-attention btn-info btn-attention-add zp_zwxq_cont_right_cont_middle_a2">关注</a>
                        </h4>
                        <ul>
                            <li><a href="">房地产开发/建筑/建材/工程</a></li>
                            <li>100-499人</li>
                            <li>私营·民营企业</li>
                        </ul>
                        <p>武汉市蔡甸区大集街天星村一号(文岭小学/世茂龙湾正门口对面)</p>
                        <div class="zp_zwxq_dt" style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/zp_zwxq_dt.png')"></div>
                    </div>
                    <div class="zp_zwxq_cont_right_cont_bottom">
                        <p>
                            该企业其他相似职位
                            <a href="" class="pull-right">更多>></a>
                        </p>
                        <ul>
                            <li>
                                <a href="">总经理助理</a>
                                <span class="zp_zwxq_span1">武汉-蔡甸区</span>
                                <span class="zp_zwxq_span2">4-6万</span>
                            </li>
                            <li>
                                <a href="">总经理助理</a>
                                <span class="zp_zwxq_span1">武汉-蔡甸区</span>
                                <span class="zp_zwxq_span2">4-6万</span>
                            </li>
                            <li>
                                <a href="">总经理助理</a>
                                <span class="zp_zwxq_span1">武汉-蔡甸区</span>
                                <span class="zp_zwxq_span2">4-6万</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="zp_zwxq_cont_2">
                    <h3>推荐企业</h3>
                    <ul>
                        <li><a href="">武汉新力力创置业有限公司</a></li>
                        <li><a href="">武汉新力力创置业有限公司</a></li>
                        <li><a href="">武汉新力力创置业有限公司</a></li>
                        <li><a href="">武汉新力力创置业有限公司</a></li>
                        <li><a href="">武汉新力力创置业有限公司</a></li>
                        <li><a href="">武汉新力力创置业有限公司</a></li>
                    </ul>
                </div>

            </div>

        </div>
    </div>
</section>





</body>
</html>
