package app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("apple")
public class Apple10 implements Phone {
	int price;

	@Autowired
	@Qualifier("sony")
	Speaker speaker;

	public Apple10() {
		super();
	}

	public Apple10(int price, Speaker speaker) {
		super();
		this.price = price;
		this.speaker = speaker;
	}

	public void powerOn() {
		System.out.println("Apple Power ON");
	}

	public void powerOff() {
		System.out.println("Apple Power OFF");
	}

	// 의존성 주입
	public void volumeUp() {
		speaker.volumeUp();
	}

	public void volumeDown() {
		speaker.volumeDown();
	}
}
