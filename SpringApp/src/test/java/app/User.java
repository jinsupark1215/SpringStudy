package app;

public class User {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BeanFactory fac = new BeanFactory();
		Phone bean = (Phone) fac.getBean("samsung");
		bean.powerOn();
		bean.powerOff();
		Phone bean2 =  (Phone) fac.getBean("apple");
		bean2.powerOn();
		bean2.powerOff();
	}

}
