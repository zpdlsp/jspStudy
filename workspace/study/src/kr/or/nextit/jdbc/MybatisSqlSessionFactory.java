package kr.or.nextit.jdbc;


import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * mybatis session Factory mybatis-config.xml
 * 파일에 등록된 정보에 의거하여 SessionFactory 생성
 * (connection + Pool)
 * @author pc51
 *
 */
public class MybatisSqlSessionFactory {

	private static SqlSessionFactory sqlSessionFactory;

	static {
		try {
			// mybatis 환경설정 파일 위치
			String resource = "/mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			
			
			// mybatis-config.xml을 읽어서 객체 생성
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

}
