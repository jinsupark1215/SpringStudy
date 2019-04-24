package app;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SpringClient {

	@SuppressWarnings("resource")
	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		Member m = new Member("홍길동",21,"역삼동");
//		System.out.println(m.toString());
		BeanFactory cxt = new ClassPathXmlApplicationContext("/applicationContext.xml");
//		Member m = (Member) cxt.getBean("mem");
//		//System.out.println(m.toString());
//		m.setName("둘리");
//		Member m2 = cxt.getBean(Member.class);
		//System.out.println(m2);
		
		Phone p = (Phone) cxt.getBean("samsung");
		p.powerOn();
		System.out.println("-----------------");
		p.volumeUp();
		System.out.println("-----------------");
		p.volumeDown();
		System.out.println("-----------------");
		
		Phone p2 = (Phone) cxt.getBean("apple");
		p2.powerOn();
		System.out.println("-----------------");
		p2.volumeUp();
		System.out.println("-----------------");
		p2.volumeDown();
	}

}
