package com.xzlcPT.service.impl;

import com.xzlcPT.bean.XzField;
import com.xzlcPT.dao.XzFieldMapper;
import com.xzlcPT.service.XzFieldService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Administrator on 2017/7/10.
 */
@Service("fieldService")
public class XzFieldServiceImpl implements XzFieldService {

    @Autowired
    private XzFieldMapper fieldMapper;

    @Override
    public List<XzField> selectByType(int fieldType) {
        return fieldMapper.selectByType(fieldType);
    }
}
