package com.ssafy.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
public class SwaggerConfig {
	@Bean
	public Docket api() {
		return new Docket(DocumentationType.SWAGGER_2)
				.groupName("product")	//서비스할 project이름이나 Domain이름
				.apiInfo(info())	//스웨거 화면에 표시할 설명 정보
				.select()
				//rest 서비스할 Controller가 있는 package 지정
				.apis(RequestHandlerSelectors.basePackage("com.ssafy.controller"))
				//PathSelectors.any()   		어떤 Path든 swagger를 만든다.
				//PathSelectors.ant(pattern)	지정한 pattern들만 swagger를 만든다.	
				.paths(PathSelectors.ant("/product/**"))
				.build();
	}
	private ApiInfo info() {
		return new ApiInfoBuilder().title("product Management API")
				.description("상품 모델 관리를 위한 <b>CRUD</b>")
				.license("그냥 쓰세요!! 안쓰겠지만...")
				.version("3.0")
				.build();
	}
}
