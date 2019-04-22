package app;

public class BeanFactory {
	public Object getBean(String name) {
		if(name.equals("samsung")) {
			return new Galaxys10();
		}else {
			return new Apple10();
		}
	}
}
