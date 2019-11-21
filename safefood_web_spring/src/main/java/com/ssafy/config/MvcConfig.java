 package com.ssafy.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

/*bean configuration을 설정하기 위한 Annotation => mvc-config.xml을 대체 */
@Configuration
/*
 * @ComponentScan	Annotation이 있는 패키지를 scan할 경로 설정
 * <context:component-scan base-package="com.ssafy.pms"/>
 */
@ComponentScan({"com.ssafy.controller","com.ssafy.config"})
/*
 * @EnableWebMvc	Web에서 사용하는 다양한 Annotation을 쓰도록 등록
 * <mvc:annotation-driven/>
 */
@EnableWebMvc
public class MvcConfig extends WebMvcConfigurerAdapter {
	/**
	 * ViewResolver 설정
	 */
	@Bean //bean으로 등록해 주는 Annotation
	public ViewResolver viewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver("/", ".jsp");
		return resolver;
	}
	
	/** servlet경로와 jsp 외의 다른 자원 요청에 대한 처리 */
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/**").addResourceLocations("/resources/");
		
		//스웨거 설정
		registry.addResourceHandler("swagger-ui.html")
				.addResourceLocations("classpath:/META-INF/resources/");
		registry.addResourceHandler("/webjars/**")
				.addResourceLocations("classpath:/META-INF/resources/webjars/");
	}

}
