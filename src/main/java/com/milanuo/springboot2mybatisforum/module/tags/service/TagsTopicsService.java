package com.milanuo.springboot2mybatisforum.module.tags.service;

import com.milanuo.springboot2mybatisforum.module.tags.dao.TagsTopicsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class TagsTopicsService {

    @Autowired
    private TagsTopicsMapper tagsTopicsMapper;

    public void deleteByTopicId(Integer id) {

        tagsTopicsMapper.deleteByTopicId(id);

    }
}
