package app;

import static org.junit.Assert.assertNotNull;

import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ssafy.model.repository.UserRepository;

public class Test1 {
	protected BeanFactory ctx = new ClassPathXmlApplicationContext("/spring/ApplicationConfig.xml");

//	@Test
//	public void testRepositoryJDBC() {
//		
//	}
//
//	@Test
//	public void testRepositoryMySQL() {
//
//	}
//
//	@Test
//	public void testService() {
//
//	}
//
//	@Test
//	public void testTimeoutMethod() {
//
//	}
//	
	@Before
	public void setUp() throws Exception {
		System.out.println("setUp");
	}

	@Test
	public void test() {
		UserRepository repoMySQL = (UserRepository) ctx.getBean("userMysqlRepo");
		assertNotNull(repoMySQL);
	}

}
