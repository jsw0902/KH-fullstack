package kr.or.iei.after.model.vo;

public class SamsungTV extends TV{

	public SamsungTV() {
		
	}

	public SamsungTV(boolean power, int channerl, int volume, int inch) {
		super(power, channerl, volume, inch);
	}
	
	public void showWeather() {
		 System.out.println("showWeather() method");
	}
	@Override
	public void whoAmI() {
		System.out.println("I am SamsungTV");
	}

	
}
