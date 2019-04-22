package app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("samsung")
public class Galaxys10 implements Phone {
	int price;

	@Autowired
	@Qualifier("harman")
//	Autowired 와 Qualifier 가 없으면 null pointer exception error 발생
//	Speaker type이 여러개 이므로 어떤 speaker를 쓸건지 Qualifier로 명시해 줘야함
	Speaker speaker;

	public Speaker getSpeaker() {
		return speaker;
	}

	public void setSpeaker(Speaker speaker) {
		this.speaker = speaker;
	}

	public Galaxys10() {
	}

	public Galaxys10(int price, Speaker speaker) {
		this.price = price;
		this.speaker = speaker;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public void powerOn() {
		System.out.println("Galaxy Power ON");
	}

	public void powerOff() {
		System.out.println("Galaxy Power OFF");
	}

	public void volumeUp() {
		speaker.volumeUp();
	}

	public void volumeDown() {
		speaker.volumeDown();
	}

	public void init() {
		System.out.println("samsung Init");
	}

	public void close() {
		System.out.println("samsung Close");
	}

}
