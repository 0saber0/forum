package com.milanuo.springboot2mybatisforum.module.tags.dao;

import com.milanuo.springboot2mybatisforum.core.Query4Object.Query4Topics;
import com.milanuo.springboot2mybatisforum.module.tags.pojo.Tags;
import com.milanuo.springboot2mybatisforum.module.tags.pojo.TagsWithNum;

import java.util.List;

public interface TagsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Tags record);

    int insertSelective(Tags record);

    Tags selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Tags record);

    int updateByPrimaryKey(Tags record);

    Integer selectIdByTag(String str);

    List<TagsWithNum> getAllTags(Query4Topics query4Topics);

    Integer getAllTagsCount(Query4Topics query4Topics);

    TagsWithNum getTagByTag(String tag);

    Integer getTagByTagCount(Query4Topics query4Topics);

    String getTags();
}