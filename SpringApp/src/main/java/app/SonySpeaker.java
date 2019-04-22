package app;

import org.springframework.stereotype.Component;

@Component("sony")
public class SonySpeaker implements Speaker {

	public void volumeUp() {
		System.out.println("소니 소리키워");
	}

	public void volumeDown() {
		System.out.println("소니 소리줄여");
	}
}
