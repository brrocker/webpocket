package com.webpocket.dwr;

import javax.annotation.Resource;

import org.directwebremoting.annotations.Param;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.directwebremoting.spring.SpringCreator;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.webpocket.data.pojo.Text;
import com.webpocket.data.service.TextService;

@Scope("prototype")
@Component("text_dwr")
@RemoteProxy(creator = SpringCreator.class, creatorParams = @Param(name = "beanName", value = "text_dwr"), name = "text_dwr")
public class TextDwr {
	@Resource
	private TextService textService;
	
	@RemoteMethod
	public String saveText(Text text) {
		return textService.saveText(text);
	}
	
	@RemoteMethod
	public Boolean updateText(Text text) {
		return textService.updateText(text);
	}
	
	@RemoteMethod
	public Boolean deleteText(String id) {
		return textService.deleteText(id);
	}
	
	@RemoteMethod
	public String getTextsByAccountId(String id) {
		return textService.getTextsByAccountId(id);
	}
	
	@RemoteMethod
	public String getTextOneditByAccountId(String id) {
		return textService.getTextOneditByAccountId(id);
	}
	
}
