package com.xzlcPT.service;

import com.xzlcPT.bean.XzField;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/7/10.
 */

public interface XzFieldService {

    List<XzField> selectByType(int fieldType);
}
