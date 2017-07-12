package com.xzlcPT.controller;

import com.util.AwsClient;
import com.util.Base64;
import com.util.PageBean;
import com.util.SavePicture;
import com.xzlcPT.bean.*;
import com.xzlcPT.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * 建立视频表Controller
 *
 * @author 王天岳
 * @create 2017-04-23 16:35
 **/
@Controller
@RequestMapping("/XzVideo")
@SessionAttributes("userLogin")
public class VideoController extends BaseController {
    @Autowired
    private VideoService videoService;
    @Autowired
    private UserInfoService userInfoService;
    @Autowired
    private VideoClassService videoClassService;
    @Autowired
    private VideoRecordService videoRecordService;
    @Autowired
    private VideoDiscussService videoDiscussService;
    @Autowired
    private VipService vipService;
    @Autowired
    private CostService costService;

    /**
     * 在地址中播放视频的方法
     * @param videoAddress
     * @return
     */
    @RequestMapping("playVideoUrl.do")
    @ResponseBody
    public byte[] playVideo(String videoAddress) {
        String filePath = System.getProperty("xianzhipt.path") + "dist/video";
        File tempFile = new File(filePath + "/" + videoAddress);
        try {
            byte[] buffer = getFileToByte(tempFile);
            return buffer;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static byte[] getFileToByte(File file) {
        byte[] by = new byte[(int) file.length()];
        try {
            InputStream is = new FileInputStream(file);
            ByteArrayOutputStream bytestream = new ByteArrayOutputStream();
            byte[] bb = new byte[20000000];
            int ch;
            ch = is.read(bb);
            while (ch != -1) {
                bytestream.write(bb, 0, ch);
                ch = is.read(bb);
            }
            by = bytestream.toByteArray();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return by;
    }

    /**
     * 条件查询 全部视频
     *
     * @param page
     * @param rows
     * @param xzVideo
     * @return
     */
    @RequestMapping("selectAllVideo.do")
    public ModelAndView selectAllVideo(@RequestParam(defaultValue = "1") Integer page,
                                       @RequestParam(defaultValue = "5") Integer rows, XzVideo xzVideo) {
        ModelAndView mv = new ModelAndView("foreEnd/allVideo");
        PageBean<XzVideo> pageBean = videoService.selectAllVideo(page, rows, xzVideo);
        List<XzVideo> videoList = pageBean.getList();
        mv.addObject("videoList", videoList);
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
        mv.addObject("rows", pageBean.getPageSize());
        mv.addObject("total", pageBean.getTotal());
        mv.addObject("test", xzVideo);
        List<XzVideoClass> xzVideoClassList = videoClassService.selectVideoVideoClass(new XzVideoClass());
        mv.addObject("xzVideoClassList", xzVideoClassList);
        return mv;
    }

    /**
     * 跳转到上传视频页面
     *
     * @return
     */
    @RequestMapping("goUploadVideo.do")
    public ModelAndView goUploadVideo(@ModelAttribute("userLogin") XzLogin userLogin) {
        ModelAndView mv = new ModelAndView("foreEnd/uploadVideo");
        XzVideo xzVideo1 = videoService.selectMaxID(userLogin.getLoginId());//查询最大ID 的数据
        XzMember xzMember = new XzMember();
        xzMember = userInfoService.selByLoginIDEnd(userLogin.getLoginId());//根据登录ID查询 用户信息
        if (xzVideo1 == null) { //未查到最大ID数据
            xzVideo1 = new XzVideo();
            xzVideo1.setLoginID(xzMember.getLoginId());
            xzVideo1.setMemberName(xzMember.getMemberName());
            videoService.insertVideo(xzVideo1);
        }
        System.out.println("goUploadVideo.do - xzVideo1:" + xzVideo1);
        boolean b1 = xzVideo1.getVideoName() != null && !"".equals(xzVideo1.getVideoName());
        boolean b2 = xzVideo1.getVideoIntroduce() != null && !"".equals(xzVideo1.getVideoIntroduce());
        if (b1 && b2) {
            XzVideo xzVideo = new XzVideo();
            xzVideo.setLoginID(xzMember.getLoginId());
            xzVideo.setMemberName(xzMember.getMemberName());
            Long a = videoService.insertVideo(xzVideo);
            System.out.println("goUploadVideo.do 1-2 :" + xzVideo);
            mv.addObject("xzVideo", xzVideo);
        } else {
            mv.addObject("xzVideo", xzVideo1);
        }
        List<XzVideoClass> xzVideoClassList = videoClassService.selectVideoVideoClass(new XzVideoClass());
        mv.addObject("xzVideoClassList", xzVideoClassList);
        return mv;
    }


    /**
     * 上传视频并返回视频名称
     *
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("upload")
    public String uploadVideo(@ModelAttribute("userLogin") XzLogin userLogin, HttpServletRequest request) {
        String videoAddress = request.getParameter("videoAddress");
        XzVideo xzVideo = videoService.selectMaxID(userLogin.getLoginId());
        String fileName = SavePicture.uploadVideo(request);
        if (xzVideo.getVideoAddress() != null && !"".equals(xzVideo.getVideoAddress())) {
            String filePath = System.getProperty("xianzhipt.path") + "dist/video/" + videoAddress;
            File newFile = new File(filePath);
            newFile.delete();
        }
        xzVideo.setVideoAddress(fileName);
        int a = videoService.updateVideoAddress(xzVideo);
        return fileName;
    }

    /**
     * 上传视频方法(视频,视频预览图 保存到项目中)
     *
     * @param xzVideo
     * @param imageDataurl
     * @return
     */
    @RequestMapping("uploadVideo.do")
    public ModelAndView uploadVideo(@ModelAttribute("userLogin") XzLogin userLogin,
                                    @Validated(XzVideo.F1.class) XzVideo xzVideo, BindingResult bindingResult,
                                    String imageDataurl) {
        ModelAndView mv = new ModelAndView("redirect:selectVideoManage.do");
        System.out.println("uploadVideo.do:" + bindingResult.hasErrors());
        System.out.println(xzVideo);
        if (bindingResult.hasErrors()) {
            mv.setViewName("foreEnd/uploadVideo");
            List<XzVideoClass> xzVideoClassList = videoClassService.selectVideoVideoClass(new XzVideoClass());
            mv.addObject("xzVideoClassList", xzVideoClassList);
        } else {
            xzVideo.setVideoType(3);
            String picName = imageDataurl.substring(0, 10) + System.currentTimeMillis();//为视频预览图文件命名 (截取文件前10个字符+当前毫秒时间)
            System.out.println("picName:" + picName);
            if (xzVideo.getVideoAddress() != null) {
                xzVideo.setVideoPicture(picName + ".png");
                try {
                    Base64.decodeBase64(imageDataurl, picName);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                int a = videoService.updateVideo(xzVideo);
                if (a != 0) {
                    XzMember xzMember = new XzMember();
                    xzMember = userInfoService.selByLoginIDEnd(userLogin.getLoginId());
                    XzVideoRecord xzVideoRecord = new XzVideoRecord();
                    xzVideoRecord.setLoginID(xzMember.getLoginId());
                    xzVideoRecord.setVideoID(xzVideo.getVideoID());
                    xzVideoRecord.setRecordType(1);
                    xzVideoRecord.setRecordDate(new Date());
                    int v1 = videoRecordService.insertVideoRecord(xzVideoRecord);
                    if (v1 != 0) {
                        System.out.println("插入记录成功!");
                    } else {
                        System.out.println("插入记录失败!");
                    }
                    System.out.println("视频保存成功");
                } else {
                    System.out.println("视频保存失败");
                }
            }
        }
        return mv;
    }

    /**
     * 跳转到 修改视频信息页面
     *
     * @param videoID
     * @return
     */
    @RequestMapping("goUpdateVideo.do")
    public ModelAndView goUpdateVideo(Long videoID) {
        ModelAndView mv = new ModelAndView("foreEnd/updateVideo");
        XzVideo xzVideo = videoService.selectVideoByID(videoID);
        mv.addObject("xzVideo", xzVideo);
        List<XzVideoClass> xzVideoClassList = videoClassService.selectVideoVideoClass(new XzVideoClass());
        mv.addObject("xzVideoClassList", xzVideoClassList);
        return mv;
    }

    /**
     * 修改视频信息
     *
     * @param xzVideo
     * @param bindingResult
     * @param photoFile
     * @param request
     * @return
     */
    @RequestMapping("updateVideo.do")
    public ModelAndView updateVideo(@Validated(XzVideo.F1.class) XzVideo xzVideo, BindingResult bindingResult,
                                    @RequestParam("photoFile") MultipartFile photoFile, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("redirect:selectVideoManage.do");
        if (bindingResult.hasErrors()) {
            mv.setViewName("foreEnd/updateVideo");
        } else {
            System.out.println("updateVideo.do:" + xzVideo);
            if (photoFile.getOriginalFilename() != null && photoFile.getOriginalFilename() != "") {
                xzVideo.setVideoPicture(photoFile.getOriginalFilename());
                SavePicture.saveVPicture(photoFile, request);
            }
            int a = 0;
            a = videoService.updateVideo(xzVideo);
            if (a != 0) {
                System.out.println("修改成功");
            } else {
                System.out.println("修改失败");
            }
        }
        return mv;
    }

    /**
     * 跳转到已上传视频查询页面
     *
     * @param userLogin
     * @param page
     * @param rows
     * @param xzVideo
     * @return
     */
    @RequestMapping("selectVideoManage.do")
    public ModelAndView videoManage(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows,
                                    XzVideo xzVideo, @ModelAttribute("userLogin") XzLogin userLogin) {
        ModelAndView mv = new ModelAndView("foreEnd/videoManage");
        if (userLogin.getLoginType() != 1) {
            mv.setViewName("redirect:recordHistory.do");
        }
        xzVideo.setLoginID(userLogin.getLoginId());
        PageBean<XzVideo> pageBean = videoService.selectVideoManage(page, rows, xzVideo);
        List<XzVideo> videoList = pageBean.getList();
        mv.addObject("videoList1", videoList);
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
        mv.addObject("rows", pageBean.getPageSize());
        mv.addObject("total", pageBean.getTotal());
        mv.addObject("test", xzVideo);
        List<XzVideoClass> xzVideoClassList = videoClassService.selectVideoVideoClass(new XzVideoClass());
        mv.addObject("xzVideoClassList", xzVideoClassList);
        return mv;
    }

    /**
     * 用户删除已上传视频
     *
     * @param videoID
     * @return
     */
    @RequestMapping("deleteVideoManage.do")
    public ModelAndView deleteVideoManage(Long videoID) {
        ModelAndView mv = new ModelAndView("redirect:selectVideoManage.do");
        XzVideo xzVideo = new XzVideo();
        xzVideo = videoService.selectVideoByID(videoID);
        int a = 0;
        if (xzVideo != null) {
            xzVideo.setDeleteVideoDate(new Date());
            xzVideo.setDeleteFalt(1);
            a = videoService.updateVideo(xzVideo);
        }
        if (a != 0) {
            System.out.println("删除成功");
        } else {
            System.out.println("删除失败");
        }
        return mv;
    }

    /**
     * 根据课程类别查询课程 并返回对应页面
     *
     * @param vclass
     * @return
     */
    @RequestMapping("goCourses.do")
    public ModelAndView goCourses(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows,
                                  XzVideo xzVideo, int vclass) {
        ModelAndView mv = new ModelAndView();
        xzVideo.setVclass(vclass);
        PageBean<XzVideo> pageBean = videoService.selectVideo(page, rows, xzVideo);
        List<XzVideo> videoList = pageBean.getList();
        mv.addObject("videoList", videoList);
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
        mv.addObject("rows", pageBean.getPageSize());
        mv.addObject("total", pageBean.getTotal());
        mv.addObject("test", xzVideo);
        if (vclass == 1) {
            mv.setViewName("foreEnd/courseJava");
        } else if (vclass == 2) {
            mv.setViewName("foreEnd/courseFront");
        } else if (vclass == 3) {
            mv.setViewName("foreEnd/courseDBA");
        } else if (vclass == 4) {
            mv.setViewName("foreEnd/courseMove");
        }
        return mv;
    }


    /**
     * 播放视频
     *
     * @param videoID
     * @return
     */
    @RequestMapping("playVideo.do")
    public ModelAndView playVideo(long videoID, String jumpAddress, @ModelAttribute("userLogin") XzLogin userLogin,
                                  @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "8") Integer rows) {
        ModelAndView mv = new ModelAndView("foreEnd/enventJava");
        XzVideo xzVideo = videoService.selectVideoByID(videoID);
        //查询最新视频
        PageBean<RecentVideo> pageBean = videoService.selectRecentVideo(1, 3, new RecentVideo());
        List<RecentVideo> recentVideoList = pageBean.getList();
        mv.addObject("recentVideoList", recentVideoList);
        //查询该视频的评论
        PageBean<VideoDiscuss> vdPageBean = videoDiscussService.selectVideoDiscuss(page, rows, videoID);
        List<VideoDiscuss> vdList = vdPageBean.getList();
        mv.addObject("page", vdPageBean.getPageNum());//当前页数
        mv.addObject("pages", vdPageBean.getPages());//总页数
        mv.addObject("rows", vdPageBean.getPageSize());//每页条数
        mv.addObject("vdList", vdList);
        XzVideoRecord xzVideoRecord = new XzVideoRecord();//查询购买记录(是否购买过该视频)
        xzVideoRecord.setLoginID(userLogin.getLoginId());
        xzVideoRecord.setVideoID(videoID);
        //判断观看该视频是否需付费
        if (0 != xzVideo.getVideoPrice()) {//付费视频
//            Vip vip = vipService.selectVipByLoginID(userLogin.getLoginID());
//            if (null == vip.getExpireTime() || null == vipService.selectExpireTime(vip.getVipId())) {//不是会员
//                if (null == videoRecordService.selectBuyRecord(xzVideoRecord)) {//未购买过视频
//                    if (xzVideo.getVideoPrice() > vip.getVipRest()) {//余额不足,跳转到用户充值页面
//                        mv.addObject("msg", "余额不足");
//                        mv.addObject("url", jumpAddress);
//                        mv.setViewName("foreEnd/userInsider");
//                    } else {//余额足够，跳转到付费提示页面
//                        if (null != vipService.selectThreeMonth(vip.getVipId())) {//过期三个月之内的会员
//                            mv.addObject("msg", "会员过期");
//                        }//过期提示
//                        mv.addObject("price", xzVideo.getVideoPrice());
//                        mv.addObject("rest", vip.getVipRest());
//                        mv.addObject("url", jumpAddress);
//                        mv.addObject("videoId", videoID);
//                        mv.setViewName("foreEnd/minusRest");
//                    }
//                    return mv;
//                }
//            }

//            boolean videoRecord1 =
        }
        List<XzVideoRecord> xzVideoRecords = videoRecordService.selectRecord(xzVideoRecord);
        if (xzVideoRecords.size() == 0) {
            xzVideoRecord.setRecordType(2);
            xzVideoRecord.setRecordDate(new Date());
            int recordInt = videoRecordService.insertVideoRecord(xzVideoRecord);
            System.out.println("插入记录 :  " + recordInt);
        }
        mv.addObject("xzVideo", xzVideo);
        return mv;
    }


    /**
     * 播放已上传视频
     *
     * @param videoID
     * @return
     */
    @RequestMapping("playUploadVideo.do")
    public ModelAndView playUploadVideo(Long videoID) {
        ModelAndView mv = new ModelAndView("foreEnd/viewUploadVideo");
        XzVideo xzVideo = videoService.selectVideoByID(videoID);
        mv.addObject("xzVideo", xzVideo);
        return mv;
    }

    /**
     * 跳转到已购视频页面
     *
     * @param page
     * @param rows
     * @param userLogin
     * @return
     */
    @RequestMapping("boughtRecord.do")
    public ModelAndView selectBoughtRecord(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows,
                                           @ModelAttribute("userLogin") XzLogin userLogin) {
        ModelAndView mv = new ModelAndView("foreEnd/ownerVideo");
        XzMember xzMember = userInfoService.selByLoginIDEnd(userLogin.getLoginId());
        System.out.println("boughtRecord.do : " + xzMember);
        XzVideoRecord xzVideoRecord = new XzVideoRecord();
        xzVideoRecord.setLoginID(userLogin.getLoginId());
        System.out.println("boughtRecord.do : " + xzVideoRecord);
        PageBean<XzVideo> pageBean = videoService.selectBoughtVideo(page, rows, xzVideoRecord);
        List<XzVideo> videoList = pageBean.getList();
        System.out.println("boughtRecord.do : " + videoList.size());
        mv.addObject("videoList", videoList);
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
        mv.addObject("rows", pageBean.getPageSize());
        mv.addObject("total", pageBean.getTotal());
        mv.addObject("test", xzVideoRecord);
        return mv;
    }

    /**
     * 跳转到历史记录页面
     *
     * @param page
     * @param rows
     * @param userLogin
     * @return
     */
    @RequestMapping("recordHistory.do")
    public ModelAndView selectRecordHistory(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows,
                                            @ModelAttribute("userLogin") XzLogin userLogin) {
        ModelAndView mv = new ModelAndView("foreEnd/videoHistory");
        XzMember xzMember = userInfoService.selByLoginIDEnd(userLogin.getLoginId());
        XzVideoRecord xzVideoRecord = new XzVideoRecord();
        xzVideoRecord.setLoginID(userLogin.getLoginId());
        PageBean<XzVideo> pageBean = videoService.selectVideoHistory(page, rows, xzVideoRecord);
        List<XzVideo> videoList = pageBean.getList();
        System.out.println("历史记录 :  " + videoList.size());
        mv.addObject("videoList", videoList);
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
        mv.addObject("rows", pageBean.getPageSize());
        mv.addObject("total", pageBean.getTotal());
        mv.addObject("test", xzVideoRecord);
        return mv;
    }

    /**
     * 将List集合 以三个分组存到 新集合
     *
     * @param xzVideoList
     * @return
     */
    public List<List<XzVideo>> saveVideoList(List<XzVideo> xzVideoList) {
        List<List<XzVideo>> videoList = new ArrayList<List<XzVideo>>();
        int a = 1;
        int b = xzVideoList.size();
        List<XzVideo> list = null;
        for (int i = 0; i < xzVideoList.size(); i++) {
            if (a == 1) {
                list = new ArrayList<XzVideo>();
            }
            XzVideo xzVideo = xzVideoList.get(i);
            list.add(xzVideo);
            if (a == 3 || b == 1) {
                videoList.add(list);
                a = 0;
            }
            a++;
            b--;
        }
        return videoList;
    }

    /**
     * 后台
     */
    /**
     * 根据条件查询视频信息
     *
     * @param page
     * @param rows
     * @param xzVideo
     * @return
     */
    @RequestMapping("selectVideo.emp")
    public ModelAndView selectVideoEnd(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows,
                                       XzVideo xzVideo) {
        ModelAndView mv = new ModelAndView("backEnd/courseEnd");
        List<XzVideoClass> xzVideoClassList = videoClassService.selectVideoVideoClass(new XzVideoClass());
        mv.addObject("xzVideoClassList", xzVideoClassList);
        PageBean<XzVideo> pageBean = videoService.selectVideoEnd(page, rows, xzVideo);
        List<XzVideo> videoList = pageBean.getList();
        mv.addObject("videoList", videoList);
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
        mv.addObject("rows", pageBean.getPageSize());
        mv.addObject("total", pageBean.getTotal());
        mv.addObject("test", xzVideo);
        return mv;
    }

    /**
     * 跳转到修改视频信息页面
     *
     * @return
     * @para m memberID
     */
    @RequestMapping("goUpdateVideo.emp")
    public ModelAndView goUpdateVideoEnd(Long videoID) {
        ModelAndView mv = new ModelAndView("backEnd/updateCourseEnd");
        XzVideo xzVideo = videoService.selectVideoByIDEnd(videoID);
        mv.addObject("xzVideo", xzVideo);
        List<XzVideoClass> xzVideoClassList = videoClassService.selectVideoVideoClass(new XzVideoClass());
        mv.addObject("xzVideoClassList", xzVideoClassList);
        return mv;
    }

    /**
     * 修改视频信息方法
     *
     * @param xzVideo
     * @return
     */
    @RequestMapping("updateVideo.emp")
    public ModelAndView updateVideoEnd(@Validated(XzVideo.F1.class) XzVideo xzVideo, BindingResult bindingResult,
                                       @RequestParam("photoFile") MultipartFile photoFile, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("redirect:selectVideo.emp");

        if (bindingResult.hasErrors()) {
            mv.setViewName("backEnd/updateCourseEnd");
        } else {
            System.out.println("updateVideo.emp:" + xzVideo);
            if (photoFile.getOriginalFilename() != null && photoFile.getOriginalFilename() != "") {
                xzVideo.setVideoPicture(photoFile.getOriginalFilename());
                SavePicture.saveVPicture(photoFile, request);
            }
            int a = 0;
            a = videoService.updateVideoEnd(xzVideo);
            if (a != 0) {
                System.out.println("修改成功");
            } else {
                System.out.println("修改失败");
            }
        }

        return mv;
    }

    /**
     * 删除视频方法
     *
     * @param videoID
     * @return
     */
    @RequestMapping("deleteVideo.emp")
    public ModelAndView deleteVideoEnd(Long videoID) {
        ModelAndView mv = new ModelAndView("redirect:selectVideo.emp");
        XzVideo xzVideo = new XzVideo();
        xzVideo = videoService.selectVideoByIDEnd(videoID);
        xzVideo.setDeleteFalt(1);
        xzVideo.setDeleteVideoDate(new Date());
        int a = 0;
        a = videoService.updateVideoEnd(xzVideo);
        if (a != 0) {
            System.out.println("修改成功");
        } else {
            System.out.println("修改失败");
        }
        return mv;
    }

    /**
     * 跳转到查看视频页面
     *
     * @param videoID
     * @return
     */
    @RequestMapping("goVideo.emp")
    public ModelAndView goVideoEnd(Long videoID) {
        ModelAndView mv = new ModelAndView("backEnd/video");
        XzVideo xzVideo = new XzVideo();
        xzVideo = videoService.selectVideoByIDEnd(videoID);
        mv.addObject("xzVideo", xzVideo);
        return mv;
    }


}


