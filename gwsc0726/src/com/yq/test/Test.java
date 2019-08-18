package com.yq.test;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages="com.yq")
@MapperScan("com.yq.dao")
public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SpringApplication.run(Test.class, args);
	}

}
