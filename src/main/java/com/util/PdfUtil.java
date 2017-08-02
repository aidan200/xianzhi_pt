package com.util;

import com.itextpdf.text.*;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.*;
import com.xzlcPT.bean.*;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Created by Administrator on 2017/8/1.
 */
public class PdfUtil {

    public static File makePdf(String fileName, HttpServletRequest request){
        PdfPCell cell1;
        File file = null;
        //String fileName = "tttest.pdf";
        File outFile = new File(request.getServletContext().getRealPath("/pdf/"+fileName));
        try {
            // 第一个参数是页面大小。接下来的参数分别是左、右、上和下页边距。
            Document document = new Document(PageSize.A4, 0, 0, 0, 0);
            // 2.建立一个书写器(Writer)与document对象关联，通过书写器(Writer)可以将文档写入到磁盘中。
            PdfWriter writer = PdfWriter.getInstance(document,new FileOutputStream(outFile));
            // 3.打开文档
            document.open();
            BaseFont baseFontChinese = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
            Font content =  new  Font(baseFontChinese , 12 , Font.NORMAL);
            Font title = new Font(baseFontChinese,14,Font.BOLD);
            Font RName = new Font(baseFontChinese, 14, Font.BOLD);
            // 4.向文档中添加内容
            /*Paragraph paragraph = new Paragraph("个人简历",new Font(baseFontChinese,18,Font.BOLD));
            paragraph.setAlignment(1); //  设置段落居中
            paragraph.setLeading(7.0f);;  //设置段落与其上方的距离
            document.add(paragraph);
            document.add(new Paragraph("\n"));
            document.add(new Paragraph("基本信息",font));*/
            //水印
            /*PdfReader reader = new PdfReader("e:/tttest.pdf");
            PdfStamper stamp = new PdfStamper(reader, new FileOutputStream("e:/tttest.pdf"));
            Image img = Image.getInstance("e:/LOGO1.png");
            img.setAbsolutePosition(200, 400);
            PdfContentByte under = stamp.getUnderContent(1);
            under.addImage(img);*/


            Image TopImage = Image.getInstance("e:/topImage.png");
            document.add(TopImage);

            float[] widths = {0.2f, 0.15f, 0.25f, 0.15f,0.25f};

            PdfPTable table = new PdfPTable(widths);
            table.setSpacingBefore(50f);//表格之前间隔
            table.setHorizontalAlignment(Element.ALIGN_CENTER);//表格水平居中
            table.setWidthPercentage(90);//表格宽度90%

            //基本信息
            //第一行
            cell1 = new PdfPCell();
            cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
            table.setHorizontalAlignment(Element.ALIGN_CENTER);
            Image image = Image.getInstance("e:/boy.png");
            //照片
            cell1.setImage(image);
            cell1.setBorder(Rectangle.NO_BORDER);
            cell1.setRowspan(3);
            cell1.setFixedHeight(100f);
            table.addCell(cell1);
            //姓名
            cell1 = makeCell("你妹",RName);
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell1.setFixedHeight(40f);
            cell1.setColspan(4);
            table.addCell(cell1);
            //第二行
            cell1 = makeCell("目前公司",content);
            table.addCell(cell1);
            cell1 = makeCell("你妹公司",content);
            table.addCell(cell1);
            cell1 = makeCell("所在地点",content);
            table.addCell(cell1);
            cell1 = makeCell("你妹地点",content);
            table.addCell(cell1);
            //第三行
            cell1 = makeCell("目前职位",content);
            table.addCell(cell1);
            cell1 = makeCell("你妹职位",content);
            table.addCell(cell1);
            cell1 = makeCell("工作年限",content);
            table.addCell(cell1);
            cell1 = makeCell("你妹年限",content);
            table.addCell(cell1);
            document.add(table);

            //基本资料
            float[] widthsBase = {0.2f, 0.3f, 0.2f, 0.3f};
            table = new PdfPTable(widthsBase);
            table.setSpacingBefore(25f);//表格之前间隔
            table.setHorizontalAlignment(Element.ALIGN_CENTER);//表格水平居中
            table.setWidthPercentage(90);//表格宽度90%

            cell1 = makeCellTitle("基本资料",title);
            table.addCell(cell1);
            cell1 = makeCell("性别",content);
            table.addCell(cell1);
            cell1 = makeCell("男",content);
            table.addCell(cell1);
            cell1 = makeCell("手机",content);
            table.addCell(cell1);
            cell1 = makeCell("13812341234",content);
            table.addCell(cell1);
            cell1 = makeCell("年龄",content);
            table.addCell(cell1);
            cell1 = makeCell("28",content);
            table.addCell(cell1);
            cell1 = makeCell("出生日期",content);
            table.addCell(cell1);
            cell1 = makeCell("1999-10-12",content);
            table.addCell(cell1);
            cell1 = makeCell("婚姻状态",content);
            table.addCell(cell1);
            cell1 = makeCell("已婚",content);
            table.addCell(cell1);
            cell1 = makeCell("目前状态",content);
            table.addCell(cell1);
            cell1 = makeCell("在职，暂不考虑换工作",content);
            table.addCell(cell1);
            document.add(table);

            //职业意向
            table = new PdfPTable(widthsBase);
            table.setSpacingBefore(25f);//表格之前间隔
            table.setHorizontalAlignment(Element.ALIGN_CENTER);//表格水平居中
            table.setWidthPercentage(90);//表格宽度90%

            cell1 = makeCellTitle("职业意向",title);
            table.addCell(cell1);
            cell1 = makeCell("目前行业",content);
            table.addCell(cell1);
            cell1 = makeCell("你妹行业",content);
            cell1.setColspan(3);
            table.addCell(cell1);
            cell1 = makeCell("期望行业",content);
            table.addCell(cell1);
            cell1 = makeCell("你妹行业",content);
            cell1.setColspan(3);
            table.addCell(cell1);
            cell1 = makeCell("期望地点",content);
            table.addCell(cell1);
            cell1 = makeCell("你妹地点",content);
            table.addCell(cell1);
            cell1 = makeCell("期望职位",content);
            table.addCell(cell1);
            cell1 = makeCell("你妹职位",content);
            table.addCell(cell1);
            cell1 = makeCell("目前薪资",content);
            table.addCell(cell1);
            cell1 = makeCell("1000块",content);
            table.addCell(cell1);
            cell1 = makeCell("期望薪资",content);
            table.addCell(cell1);
            cell1 = makeCell("2000块",content);
            table.addCell(cell1);
            document.add(table);

            //工作经历
            table = new PdfPTable(widthsBase);
            table.setSpacingBefore(25f);//表格之前间隔
            table.setHorizontalAlignment(Element.ALIGN_CENTER);//表格水平居中
            table.setWidthPercentage(90);//表格宽度90%
            cell1 = makeCellTitle("工作经历",title);
            table.addCell(cell1);
            String jobBegin = "1999-10-10";
            String jobEnd = "1999-10-10";
            cell1 = makeCell(jobBegin+" 至 "+jobEnd,content);
            cell1.setColspan(2);
            table.addCell(cell1);
            cell1 = makeCell("沈阳",content);
            table.addCell(cell1);
            cell1 = makeCell("你妹公司",content);
            table.addCell(cell1);
            cell1 = makeCell("公司领域",content);
            table.addCell(cell1);
            cell1 = makeCell("xxx/xxx/xxx",content);
            cell1.setColspan(3);
            table.addCell(cell1);
            cell1 = makeCell("职位名称",content);
            table.addCell(cell1);
            cell1 = makeCell("你妹职位",content);
            table.addCell(cell1);
            cell1 = makeCell("下属人数",content);
            table.addCell(cell1);
            cell1 = makeCell("100人",content);
            table.addCell(cell1);
            cell1 = makeCellNoLine("职位业绩",content);
            table.addCell(cell1);
            cell1 = makeCellNoLine("啊圣诞节好热哦I人阿四大家奥is多久啊看似简单奥is多久啊哦is多久奥i" +
                    "s多久哦爱睡觉的奥介绍的奥id就是啊路上看到阿里圣诞节" +
                    "s多久哦爱睡觉的奥介绍的奥id就是啊路上看到阿里圣诞节" +
                    "s多久哦爱睡觉的奥介绍的奥id就是啊路上看到阿里圣诞节" +
                    "s多久哦爱睡觉的奥介绍的奥id就是啊路上看到阿里圣诞节",content);
            cell1.setColspan(3);
            cell1.setPaddingTop(10f);
            table.addCell(cell1);
            document.add(table);

            //教育经历
            table = new PdfPTable(widthsBase);
            table.setSpacingBefore(25f);//表格之前间隔
            table.setHorizontalAlignment(Element.ALIGN_CENTER);//表格水平居中
            table.setWidthPercentage(90);//表格宽度90%
            cell1 = makeCellTitle("教育经历",title);
            table.addCell(cell1);
            String eBegin = "1999-10-10";
            String eEnd = "1999-10-10";
            cell1 = makeCell(eBegin+" 至 "+eEnd,content);
            cell1.setColspan(2);
            table.addCell(cell1);
            cell1 = makeCell("你妹学校",content);
            cell1.setColspan(2);
            table.addCell(cell1);
            cell1 = makeCell("专业：xxxxx",content);
            cell1.setColspan(2);
            table.addCell(cell1);
            cell1 = makeCell("学历：大专",content);
            table.addCell(cell1);
            cell1 = makeCell("统招",content);
            table.addCell(cell1);
            document.add(table);

            //项目经验
            table = new PdfPTable(widthsBase);
            table.setSpacingBefore(25f);//表格之前间隔
            table.setHorizontalAlignment(Element.ALIGN_CENTER);//表格水平居中
            table.setWidthPercentage(90);//表格宽度90%
            cell1 = makeCellTitle("项目经验",title);
            table.addCell(cell1);
            String projectBegin = "1999-10-10";
            String projectEnd = "1999-10-10";
            cell1 = makeCell(projectBegin+" 至 "+projectEnd,content);
            cell1.setColspan(2);
            table.addCell(cell1);
            cell1 = makeCell("xxxxx项目",content);
            cell1.setColspan(2);
            table.addCell(cell1);
            cell1 = makeCellNoLine("项目描述",content);
            table.addCell(cell1);
            cell1 = makeCellNoLine("啊盛大盛大速度请问大多数 asdasd",content);
            cell1.setPaddingTop(10f);
            cell1.setColspan(3);
            table.addCell(cell1);
            cell1 = makeCellNoLine("项目职责",content);
            table.addCell(cell1);
            cell1 = makeCellNoLine("啊盛大盛大速度请问大多数 asdasd",content);
            cell1.setPaddingTop(10f);
            cell1.setColspan(3);
            table.addCell(cell1);
            document.add(table);
            //自我评价
            table = new PdfPTable(widthsBase);
            table.setSpacingBefore(25f);//表格之前间隔
            table.setHorizontalAlignment(Element.ALIGN_CENTER);//表格水平居中
            table.setWidthPercentage(90);//表格宽度90%
            cell1 = makeCellTitle("自我评价",title);
            table.addCell(cell1);
            cell1 = makeCellNoLine("啊盛大盛大速度请问大多数 asdasd",content);
            cell1.setPaddingTop(10f);
            cell1.setColspan(4);
            table.addCell(cell1);
            document.add(table);
            //附加信息
            table = new PdfPTable(widthsBase);
            table.setSpacingBefore(25f);//表格之前间隔
            table.setHorizontalAlignment(Element.ALIGN_CENTER);//表格水平居中
            table.setWidthPercentage(90);//表格宽度90%
            cell1 = makeCellTitle("附加信息",title);
            table.addCell(cell1);
            cell1 = makeCellNoLine("啊盛大盛大速度请问大多数 asdasd",content);
            cell1.setPaddingTop(10f);
            cell1.setColspan(4);
            table.addCell(cell1);
            document.add(table);
            //擅长技能
            table = new PdfPTable(widthsBase);
            table.setSpacingBefore(25f);//表格之前间隔
            table.setHorizontalAlignment(Element.ALIGN_CENTER);//表格水平居中
            table.setWidthPercentage(90);//表格宽度90%
            cell1 = makeCellTitle("擅长技能",title);
            table.addCell(cell1);
            cell1 = makeCellNoLine("啊盛大盛大速度请问大多数\n asdasd",content);
            cell1.setPaddingTop(10f);
            cell1.setColspan(4);
            table.addCell(cell1);
            document.add(table);


            document.close();

            Image img = Image.getInstance(request.getServletContext().getRealPath("/dist/foreEnd3/img/LOGO2.png"));
            //添加水印
            imageWatermark(request.getServletContext().getRealPath("/pdf/"+fileName),
                    request.getServletContext().getRealPath("/pdf/1"+fileName),img);

            file = new File(request.getServletContext().getRealPath("/pdf/1"+fileName));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return file;
    }





    //默认列样式
    private static PdfPCell makeCell(String content, Font font){
        PdfPCell cell1 = new PdfPCell(new Phrase(content,font));
        cell1.setFixedHeight(30f);//行高
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);//垂直居中
        //cell1.setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
        cell1.setBorder(Rectangle.NO_BORDER);
        return cell1;
    }
    //无行高列样式
    private static PdfPCell makeCellNoLine(String content,Font font){
        PdfPCell cell1 = new PdfPCell(new Phrase(content,font));
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);//垂直居中
        //cell1.setHorizontalAlignment(Element.ALIGN_CENTER);//水平居中
        cell1.setBorder(Rectangle.NO_BORDER);
        return cell1;
    }
    //表头样式
    private static PdfPCell makeCellTitle(String content,Font font){
        PdfPCell cell1 = new PdfPCell(new Phrase(content,font));
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);//垂直居中
        cell1.setColspan(4);
        cell1.setFixedHeight(35f);//行高
        cell1.setBorder(Rectangle.NO_BORDER);
        cell1.setBackgroundColor(new BaseColor(235,235,235));
        return cell1;
    }

    public static void imageWatermark(String inputPath, String outputPath, Image img) throws IOException, DocumentException {

        PdfReader reader = new PdfReader(inputPath);
        PdfStamper stamp = new PdfStamper(reader, new FileOutputStream(outputPath));
        PdfGState gs1 = new PdfGState();
        gs1.setFillOpacity(0.1f);
        Image image = img;
        //Image image = Image.getInstance(IOUtils.toByteArray(new FileInputStream(System.getProperty("user.dir") + "/src/main/webapp/WEB-INF/resources/image/watermark_backgroud.png")));
        int n = reader.getNumberOfPages();
        for(int i = 1; i <= n; i++) {
            PdfContentByte pdfContentByte = stamp.getOverContent(i);
            pdfContentByte.setGState(gs1);
            image.setAbsolutePosition(200, 500);
            //image.setRotationDegrees(-45);//旋转 角度
            image.scalePercent(50);//依照比例缩放
            pdfContentByte.addImage(image);
        }

        stamp.close();
        reader.close();
    }
}
