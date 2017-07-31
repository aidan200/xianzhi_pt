
import org.apache.poi.xwpf.usermodel.*;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTblPr;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTblWidth;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTcPr;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STMerge;

import java.io.File;
import java.io.FileOutputStream;
import java.math.BigInteger;

/**
 * Created by Administrator on 2017/7/6.
 */
public class TestC {
    public static void main(String[] args) {

        /*Pattern p = Pattern.compile("^[\\w,\\.,-]*@[0-9A-Za-z]{1,20}((\\.com)|(\\.net)|(\\.com.cn)){1}$");
        Matcher m = p.matcher("aidan200@sina.student.com");
        boolean bl = m.matches();
        System.out.println(bl);*/

        //Blank Document
        XWPFDocument document= new XWPFDocument();

        //Write the Document in file system
        try {
            FileOutputStream out = new FileOutputStream(new File("e:/tttest.docx"));
            //添加标题
            XWPFParagraph titleParagraph = document.createParagraph();
            //设置段落居中
            titleParagraph.setAlignment(ParagraphAlignment.CENTER);

            XWPFRun titleParagraphRun = titleParagraph.createRun();
            titleParagraphRun.setText("Java PoI");
            titleParagraphRun.setColor("000000");
            titleParagraphRun.setFontSize(20);


            //工作经历表
            XWPFTable infoTable = document.createTable(5,4);
            CTTblPr tablePr = infoTable.getCTTbl().getTblPr();
            //去表格边框
            //tablePr.unsetTblBorders();
            //设置宽度
            CTTblWidth width = tablePr.addNewTblW();
            width.setW(BigInteger.valueOf(8000));
            //表格第一行
            XWPFTableRow infoTableRowOne = infoTable.getRow(0);
            XWPFTableCell cell  = infoTableRowOne.getCell(0);
            cell.setText("工作经历");
            CTTcPr ctTcPr = cell.getCTTc().addNewTcPr();
            //ctTcPr.addNewTcW().setW(BigInteger.valueOf(8000));
            ctTcPr.addNewShd().setFill("EDEDED");
            mergeCellsHorizontal(infoTable,0,0,3);
            //cell.

            /*CTTcPr ctTcPr = cell.getCTTc().addNewTcPr();
            ctTcPr.addNewTcW().setW(BigInteger.valueOf(2000));*/
            /*infoTableRowOne.addNewTableCell().setText(": Java 开发工程师");
            infoTableRowOne.addNewTableCell().setText(": Java 开发工程师开发工程");
            infoTableRowOne.addNewTableCell().setText(": Java 开发工程师");
            List<XWPFTableCell> cells = infoTableRowOne.getTableCells();
            for (XWPFTableCell tableCell : cells) {
                CTTcPr ctTcPr = tableCell.getCTTc().addNewTcPr();
                ctTcPr.addNewTcW().setW(BigInteger.valueOf(2000));
            }*/

            //表格第二行
            XWPFTableRow infoTableRowTwo = infoTable.createRow();
            infoTableRowTwo.getCell(0).setText("姓名");
            infoTableRowTwo.getCell(1).setText(": seawater");

            document.write(out);
            out.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void mergeCellsHorizontal(XWPFTable table, int row, int fromCell, int toCell) {
        for (int cellIndex = fromCell; cellIndex <= toCell; cellIndex++) {
            XWPFTableCell cell = table.getRow(row).getCell(cellIndex);
            if ( cellIndex == fromCell ) {
                // The first merged cell is set with RESTART merge value
                cell.getCTTc().addNewTcPr().addNewHMerge().setVal(STMerge.RESTART);
            } else {
                // Cells which join (merge) the first one, are set with CONTINUE
                cell.getCTTc().addNewTcPr().addNewHMerge().setVal(STMerge.CONTINUE);
            }
        }
    }
}
