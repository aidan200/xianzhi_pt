<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/3
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <jsp:include page="distforeEnd.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd3/css/zp_gsxq.css">
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/zp_lb.js"></script>
</head>
<body>
<jsp:include page="headerforeEnd.jsp"/>
<div class="zp_gsxq_bg" style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/gsxq_bg.jpg')"></div>
<section class="container zp_spxq_cont">
    <div class="row zp_spxq_cont_top">
        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/zp_gsxq_img1.png">
        <div>
            <h3><span>爱淘苗</span> <a href="">关注</a> <div class="zp_gsxq_gzrs">121人关注</div></h3>
            <ul>
                <li>带薪年假</li>
                <li>带薪年假</li>
                <li>带薪年假</li>
                <li>带薪年假</li>
                <li>带薪年假</li>
                <li>带薪年假</li>
                <li>更多...</li>
            </ul>
        </div>

    </div>
    <div class="row zp_spxq_cont_cont">
        <div class="col-md-8">
            <div class="zp_gsxq_gsjs">
                <h2 class="company-title">公司介绍</h2>
                <p class="profile" data-selector="detail" style="display: block;">
                    &nbsp; &nbsp;  两家上市公司（铁汉生态、岭南园林）领投，大千园林、国艺园林、星河园林一起联手注资6000万元成立横琴花木交易中心股份有限公司，诚邀行业内的有志之士携手并肩，一路前行！ 共同打造开放而独立的苗木交易第三方平台！<br>&nbsp; &nbsp; 深圳爱淘苗电子商务科技有限公司是横琴花木交易中心股份有限公司的全资子公司，注册资本...</p>
                <a class="link-more" href="javascript:;" style="display: block;">点击展开更多详情</a>
            </div>
            <div class="zp_gsxq_cpjs">
                <h2 class="product-title">产品介绍</h2>

                <dl class="clearfix" style="display: block;">
                    <dt><img src="https://image0.lietou-static.com/img/57d2632962f0550b9450e1d706a.jpg" alt=""></dt>
                    <dd>
                        <p data-selector="detail">爱淘苗电商平台</p>
                    </dd>
                </dl>

                <dl class="clearfix" style="display: none;">
                    <dt><img src="https://image0.lietou-static.com/img/57d2636b62f0550b9450e1e306a.jpg" alt=""></dt>
                    <dd>
                        <p data-selector="detail">爱淘苗电商平台</p>
                    </dd>
                </dl>

                <dl class="clearfix" style="display: none;">
                    <dt><img src="https://image0.lietou-static.com/img/57d263c162f0550b9450e20406a.jpg" alt=""></dt>
                    <dd>
                        <p data-selector="detail">爱淘苗电商平台</p>
                    </dd>
                </dl>

                <a class="link-more" href="javascript:;" style="display: block;">点击展开更多详情</a>
            </div>
            <div class="zp_gsxq_zpzw">
                <h2>招聘职位<span>&nbsp;( 共16个 )</span></h2>
                <div>
                    <div class="zp_gsxq_zpzw_left">
                        <select class="form-control">
                            <option>工作地点</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                    </div>
                    <div class="zp_gsxq_zpzw_left" style="width: 140px">
                        <select class="form-control">
                            <option>工作地点</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                    </div>
                    <div class="zp_gsxq_zpzw_left" style="width: 250px">
                        <input type="text" class="form-control"placeholder="职位名称">
                    </div>
                    <div class="zp_gsxq_zpzw_left" style="width:auto; float: right; margin-right: 0">
                        <button type="button" class="btn btn-primary">确定</button>
                    </div>
                </div>
                <hr>
                <ul>
                    <li>
                        <div class="zp_gsxq_zpzw_li_left">
                            <p><a href="">人力资源专员</a></p>
                            <p><span>7-10万</span>&nbsp;&nbsp;深圳-南山区&nbsp;&nbsp;|&nbsp;&nbsp;统招本科&nbsp;&nbsp;|&nbsp;&nbsp;2年工作经验 </p>
                            <p><span style="color: #999999; font-size: 10px;">23小时前 投递后：24小时反馈</span></p>
                        </div>
                        <div class="zp_gsxq_zpzw_li_right">
                            <button  type="button" class="btn btn-primary btn-large">立即应聘</button>
                        </div>
                    </li>
                    <li>
                        <div class="zp_gsxq_zpzw_li_left">
                            <p><a href="">人力资源专员</a></p>
                            <p><span>7-10万</span>&nbsp;&nbsp;深圳-南山区&nbsp;&nbsp;|&nbsp;&nbsp;统招本科&nbsp;&nbsp;|&nbsp;&nbsp;2年工作经验 </p>
                            <p><span style="color: #999999; font-size: 10px;">23小时前 投递后：24小时反馈</span></p>
                        </div>
                        <div class="zp_gsxq_zpzw_li_right">
                            <button  type="button" class="btn btn-primary btn-large">立即应聘</button>
                        </div>
                    </li>
                    <li>
                        <div class="zp_gsxq_zpzw_li_left">
                            <p><a href="">人力资源专员</a></p>
                            <p><span>7-10万</span>&nbsp;&nbsp;深圳-南山区&nbsp;&nbsp;|&nbsp;&nbsp;统招本科&nbsp;&nbsp;|&nbsp;&nbsp;2年工作经验 </p>
                            <p><span style="color: #999999; font-size: 10px;">23小时前 投递后：24小时反馈</span></p>
                        </div>
                        <div class="zp_gsxq_zpzw_li_right">
                            <button  type="button" class="btn btn-primary btn-large">立即应聘</button>
                        </div>
                    </li>
                    <li>
                        <div class="zp_gsxq_zpzw_li_left">
                            <p><a href="">人力资源专员</a></p>
                            <p><span>7-10万</span>&nbsp;&nbsp;深圳-南山区&nbsp;&nbsp;|&nbsp;&nbsp;统招本科&nbsp;&nbsp;|&nbsp;&nbsp;2年工作经验 </p>
                            <p><span style="color: #999999; font-size: 10px;">23小时前 投递后：24小时反馈</span></p>
                        </div>
                        <div class="zp_gsxq_zpzw_li_right">
                            <button  type="button" class="btn btn-primary btn-large">立即应聘</button>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="zp_gsxq_fy" >
                <nav aria-label="Page navigation" >
                    <ul class="pagination" style="margin">
                        <li>
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li>
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="col-md-4 zp_spxq_cont_right" style=" padding-left: 20px;">
            <div class="zp_spxq_cont_right_cont">
                <div class="zp_spxq_cont_right_top">
                    <h2 class="base-title relative">投递查看<hr></h2>
                    <div>
                        <div>
                            <h3>90%</h3>
                            <span>简历查看率</span>
                        </div>
                        <div>
                            <h3>1天</h3>
                            <span>简历查看用时</span>
                        </div>
                    </div>
                </div>
                <div class="zp_spxq_cont_right_middle">
                    <h2>
                        基本信息<hr>
                    </h2>
                    <ul>
                        <li>行业：<span>互联网/移动互联网/电子商务</span></li>
                        <li>领域：<span>电子商务</span></li>
                        <li>融资：<span>天使轮</span></li>
                        <li>规模：<span>50-99人</span></li>
                        <li style="height: auto">地址：<span>科技园科丰路2号特发信息港B栋8楼810-815</span></li>
                    </ul>
                    <div class="zp_spxq_dt" style="background-image: url('img/zp_gsxq_dt.png')">
                    </div>
                </div>
                <div class="zp_spxq_cont_right_bottom">
                    <h2>
                        企业风采<hr>
                    </h2>
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/zp_gsxq_gsfc.png" alt="">
                    <h2>
                        企业风采<hr>
                    </h2>
                    <ul>
                        <li>
                            <a href="">
                                爱淘苗“清风”一路向西，新疆瑞绎昕强势登陆
                            </a>
                        </li>
                        <li>
                            <a href="">
                                爱淘苗“清风”一路向西，新疆瑞绎昕强势登陆
                            </a>
                        </li>
                        <li>
                            <a href="">
                                爱淘苗“清风”一路向西，新疆瑞绎昕强势登陆
                            </a>
                        </li>
                        <li>
                            <a href="">
                                爱淘苗“清风”一路向西，新疆瑞绎昕强势登陆
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>






</body>
</html>