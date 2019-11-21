package com.ssafy.config;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;

@Configuration
@ComponentScan("com.ssafy.model")
public class ApplicationConfig {
	
	/**
	 * 
	<bean  id="dataSource" class="org.apache.commons.dbcp.BasicDataSource"  destroy-method="close">
		<property name="driverClassName"  	value="com.mysql.cj.jdbc.Driver" />
		<property name="url"  				value="jdbc:mysql://localhost:3306/ssafydb?serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true" />
		<property name="username"  			value="ssafy" />
		<property name="password"  			value="ssafy" />
		<property name="maxActive"  		value="20" />
	</bean>
	</bean>
	 */
	@Bean
	public DataSource dataSource() {
		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
		ds.setUrl("jdbc:mysql://localhost:3306/ssafydb?serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true");
		ds.setUsername("ssafy");
		ds.setPassword("ssafy");
		ds.setMaxActive(20);
		return ds;
	}
	
	/**
	 * 
	 * 	<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
		<property name="dataSource"  ref="dataSource"/>
		<!-- MyBatis 기본 설정 XML 등록 -->
		<property name="configLocation"  value="classpath:spring/SqlMapConfig.xml"/>
	</bean>
	 */
	
	@Bean
	public SqlSessionFactoryBean sqlSessionFactoryBean(DataSource ds) {
		SqlSessionFactoryBean fac = new SqlSessionFactoryBean();
		fac.setDataSource(ds);
		String configLoc = "classpath:spring/SqlMapConfig.xml";
		fac.setConfigLocation(new PathMatchingResourcePatternResolver().getResource(configLoc));
		return fac;
	}
	
	@Bean
	public SqlSession sqlSession(SqlSessionFactoryBean fac) throws Exception {
		return new SqlSessionTemplate(fac.getObject());
	}
	
	/**트랜잭션 설정*/
	@Bean
	public PlatformTransactionManager transactionManger(DataSource ds) {
		return new DataSourceTransactionManager(ds);
	}
	
}
