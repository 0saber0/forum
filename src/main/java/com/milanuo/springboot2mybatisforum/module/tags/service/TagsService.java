package com.milanuo.springboot2mybatisforum.module.tags.service;

import com.milanuo.springboot2mybatisforum.core.Query4Object.Query4Topics;
import com.milanuo.springboot2mybatisforum.module.tags.dao.TagsMapper;
import com.milanuo.springboot2mybatisforum.module.tags.pojo.TagsWithNum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class TagsService {

    @Autowired
    private TagsMapper tagsMapper;


    public List<TagsWithNum> getAllTags(Query4Topics query4Topics) {
        return tagsMapper.getAllTags(query4Topics);
    }

    public Integer getAllTagsCount(Query4Topics query4Topics) {
        return tagsMapper.getAllTagsCount(query4Topics);
    }

    public TagsWithNum getTagByTag(String tag) {
        return tagsMapper.getTagByTag(tag);
    }

    public Integer getTagByTagCount(Query4Topics query4Topics) {
        return tagsMapper.getTagByTagCount(query4Topics);
    }
}
