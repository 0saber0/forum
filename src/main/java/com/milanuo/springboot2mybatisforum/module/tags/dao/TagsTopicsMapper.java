package com.milanuo.springboot2mybatisforum.module.tags.dao;

import com.milanuo.springboot2mybatisforum.module.tags.pojo.TagsTopics;
import org.springframework.stereotype.Repository;

@Repository
public interface TagsTopicsMapper {

    int insert(TagsTopics record);

    int insertSelective(TagsTopics record);

    int deleteByTopicId(Integer id);
}