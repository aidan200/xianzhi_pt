<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/6/27
  Time: 14:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="distFore.jsp"/>

    <!--小树-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/dist/foreEnd2/js/jquery.lazylinepainter-1.5.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/dist/foreEnd2/js/tree.js"></script>
</head>

<body style="background-color: #eeeeee">
<!--nav-->
<jsp:include page="newHeader.jsp"/>
<!--nav结束-->

<div class="container">
    <form action="">
        <div class="video_imgall">

            <!--小树-->
            <div id='demo' style="position: absolute;top: 130px"></div>
            <!--<img src="img/qi.png" alt="" style="width: 250px;height: 400px;position: absolute;top: 100px;">-->
            <h2 style="text-align: center;margin-top: 50px;z-index: 999">先知课程中心</h2>

            <!--搜索框框-->
            <div class="video_b">
                <div class="col-3" style="margin-top: 40px;width: 100%">
                    <input class="effect-9 video_input" type="text" placeholder="搜索课程">
                    <span class="focus-border"><i></i></span>
                </div>
                <button class="video_button">搜索 <span class="fa fa-search"></span></button>
            </div>
            <!--搜索结束-->
        </div>

        <!--一堆课程-->
        <div class="video_main col-md-12">
            <div class="video_ev col-lg-3 col-md-4 col-sm-6 col-xs-12">
                <div class="video_small">
                    <div class="video_img">
                        <span>NodeJS课程</span>
                    </div>
                    <div class="video_text">
                        <h4>进击nodejs基础</h4>
                        <p>本教程带你揭开nodejs的面纱，带你走进一个全新世界</p>
                        <div class="video_s"><span style="color: #f17c67">200000</span>人在学</div>
                    </div>

                </div>
            </div>
            <div class="video_ev col-lg-3 col-md-4 col-sm-6 col-xs-12">
                <div class="video_small">
                    <div class="video_img">
                        <span>Java</span>
                    </div>
                    <div class="video_text">
                        <h4>进击nodejs基础</h4>
                        <p>本教程带你揭开nodejs的面纱，带你走进一个全新世界</p>
                        <div class="video_s"><span style="color: #f17c67">200000</span>人在学</div>
                    </div>

                </div>
            </div>
            <div class="video_ev col-lg-3 col-md-4 col-sm-6 col-xs-12">
                <div class="video_small">
                    <div class="video_img">
                        <span>NodeJS课程</span>
                    </div>
                    <div class="video_text">
                        <h4>进击nodejs基础</h4>
                        <p>本教程带你揭开nodejs的面纱，带你走进一个全新世界</p>
                        <div class="video_s"><span style="color: #f17c67">200000</span>人在学</div>
                    </div>

                </div>
            </div>
            <div class="video_ev col-lg-3 col-md-4 col-sm-6 col-xs-12">
                <div class="video_small">
                    <div class="video_img">
                        <span>NodeJS课程</span>
                    </div>
                    <div class="video_text">
                        <h4>进击nodejs基础</h4>
                        <p>本教程带你揭开nodejs的面纱，带你走进一个全新世界</p>
                        <div class="video_s"><span style="color: #f17c67">200000</span>人在学</div>
                    </div>

                </div>
            </div>
            <div class="video_ev col-lg-3 col-md-4 col-sm-6 col-xs-12">
                <div class="video_small">
                    <div class="video_img">
                        <span>NodeJS课程</span>
                    </div>
                    <div class="video_text">
                        <h4>进击nodejs基础</h4>
                        <p>本教程带你揭开nodejs的面纱，带你走进一个全新世界</p>
                        <div class="video_s"><span style="color: #f17c67">200000</span>人在学</div>
                    </div>

                </div>
            </div>
            <div class="video_ev col-lg-3 col-md-4 col-sm-6 col-xs-12">
                <div class="video_small">
                    <div class="video_img">
                        <span>NodeJS课程</span>
                    </div>
                    <div class="video_text">
                        <h4>进击nodejs基础</h4>
                        <p>本教程带你揭开nodejs的面纱，带你走进一个全新世界</p>
                        <div class="video_s"><span style="color: #f17c67">200000</span>人在学</div>
                    </div>

                </div>
            </div>
            <div class="video_ev col-lg-3 col-md-4 col-sm-6 col-xs-12">
                <div class="video_small">
                    <div class="video_img">
                        <span>NodeJS课程</span>
                    </div>
                    <div class="video_text">
                        <h4>进击nodejs基础</h4>
                        <p>本教程带你揭开nodejs的面纱，带你走进一个全新世界</p>
                        <div class="video_s"><span style="color: #f17c67">200000</span>人在学</div>
                    </div>

                </div>
            </div>
            <div class="video_ev col-lg-3 col-md-4 col-sm-6 col-xs-12">
                <div class="video_small">
                    <div class="video_img">
                        <span>NodeJS课程</span>
                    </div>
                    <div class="video_text">
                        <h4>进击nodejs基础</h4>
                        <p>本教程带你揭开nodejs的面纱，带你走进一个全新世界</p>
                        <div class="video_s"><span style="color: #f17c67">200000</span>人在学</div>
                    </div>

                </div>
            </div>
            <div class="video_ev col-lg-3 col-md-4 col-sm-6 col-xs-12">
                <div class="video_small">
                    <div class="video_img">
                        <span>NodeJS课程</span>
                    </div>
                    <div class="video_text">
                        <h4>进击nodejs基础</h4>
                        <p>本教程带你揭开nodejs的面纱，带你走进一个全新世界</p>
                        <div class="video_s"><span style="color: #f17c67">200000</span>人在学</div>
                    </div>

                </div>
            </div>
            <div class="video_ev col-lg-3 col-md-4 col-sm-6 col-xs-12">
                <div class="video_small">
                    <div class="video_img">
                        <span>NodeJS课程</span>
                    </div>
                    <div class="video_text">
                        <h4>进击nodejs基础</h4>
                        <p>本教程带你揭开nodejs的面纱，带你走进一个全新世界</p>
                        <div class="video_s"><span style="color: #f17c67">200000</span>人在学</div>
                    </div>

                </div>
            </div>
            <div class="video_ev col-lg-3 col-md-4 col-sm-6 col-xs-12">
                <div class="video_small">
                    <div class="video_img">
                        <span>NodeJS课程</span>
                    </div>
                    <div class="video_text">
                        <h4>进击nodejs基础</h4>
                        <p>本教程带你揭开nodejs的面纱，带你走进一个全新世界</p>
                        <div class="video_s"><span style="color: #f17c67">200000</span>人在学</div>
                    </div>

                </div>
            </div>
            <div class="video_ev col-lg-3 col-md-4 col-sm-6 col-xs-12">
                <div class="video_small">
                    <div class="video_img">
                        <span>NodeJS课程</span>
                    </div>
                    <div class="video_text">
                        <h4>进击nodejs基础</h4>
                        <p>本教程带你揭开nodejs的面纱，带你走进一个全新世界</p>
                        <div class="video_s"><span style="color: #f17c67">200000</span>人在学</div>
                    </div>

                </div>
            </div>

        </div>
        <!--课程结束-->
        <div style="clear: both"></div>

        <!--分页-->
        <div style="text-align: center">
            <ul class="pagination">
                <li><a href="#">&laquo;</a></li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&raquo;</a></li>
            </ul>
        </div>
    </form>
</div>


<footer>
    <section id="index_bottom">
        <div class="container">
            <div class="row">
                <p>
                    <a href="" class="fa fa-skyatlas" style="color: #5A9CDA"></a>
                    <a href="" class="fa fa-weibo" style="color: #F19D25"></a>
                    <a href="" id="index_weixin" class="fa fa-wechat" style="color: #CD6180"></a>
                    <a href="" class="fa fa-qq" style="color:#079F51;"></a>
                </p>
                <div>
                    <ul>
                        <li> <a href="">企业合作</a></li>
                        <li> <a href="">人才招聘</a></li>
                        <li> <a href="">联系我们</a></li>
                        <li> <a href="">讲师招募</a></li>
                        <li> <a href="">常见问题</a></li>
                        <li> <a href="">意见反馈</a></li>
                    </ul>
                </div>
                <hr class="index_bottom_hr">
                <h3>© 2017 imooc.com  京ICP备 13046642号-2</h3>
            </div>
        </div>
    </section>
</footer>

</body>
</html>
