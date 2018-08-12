package com.milanuo.springboot2mybatisforum.core.Freemarker;

import com.milanuo.springboot2mybatisforum.core.Shiro.ShiroTag;
import freemarker.template.TemplateModelException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
@Slf4j
public class FreemarkerConfig {

  @Autowired
  private freemarker.template.Configuration configuration;

  @Autowired
  private ShiroTag shiroTag;

  @PostConstruct
  public void setSharedVariable() throws TemplateModelException {
    // 注入全局配置至freemarker
    configuration.setSharedVariable("shi", shiroTag);

    log.info("init freemarker sharedVariables {site} success...");
  }

}