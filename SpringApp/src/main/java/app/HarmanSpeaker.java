package app;

import org.springframework.stereotype.Component;

@Component("harman")
public class HarmanSpeaker implements Speaker {

	public void volumeUp() {
		System.out.println("하만 소리키워");
	}

	public void volumeDown() {
		System.out.println("하만 소리줄여");
	}

}
