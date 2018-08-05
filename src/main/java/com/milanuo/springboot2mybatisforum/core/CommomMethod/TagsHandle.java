package com.milanuo.springboot2mybatisforum.core.CommomMethod;

import com.milanuo.springboot2mybatisforum.module.reply.dao.ReplyMapper;
import com.milanuo.springboot2mybatisforum.module.tags.dao.TagsMapper;
import com.milanuo.springboot2mybatisforum.module.tags.dao.TagsTopicsMapper;
import com.milanuo.springboot2mybatisforum.module.tags.pojo.Tags;
import com.milanuo.springboot2mybatisforum.module.tags.pojo.TagsTopics;
import com.milanuo.springboot2mybatisforum.module.topic.dao.TopicMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TagsHandle {

    @Autowired
    TopicMapper topicMapper;

    @Autowired
    TagsMapper tagsMapper;


    @Autowired
    TagsTopicsMapper tagsTopicsMapper;


    public Boolean tagsHandle(Integer topicId,String tags){

        tagsTopicsMapper.deleteByTopicId(topicId);
        String[] strs = tags.split(",");

        try{
            for(String str:strs){
                Integer id = tagsMapper.selectIdByTag(str);
                TagsTopics tagsTopics = new TagsTopics();
                tagsTopics.setTopicId(topicId);
                if(id==null){
                    Tags tag = new Tags();
                    tag.setTag(str);
                    tagsMapper.insertSelective(tag);
                    tagsTopics.setTagsId(tag.getId());
                    tagsTopicsMapper.insert(tagsTopics);
                }else{
                    tagsTopics.setTagsId(id);
                    tagsTopicsMapper.insert(tagsTopics);
                }
            }
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }
}
