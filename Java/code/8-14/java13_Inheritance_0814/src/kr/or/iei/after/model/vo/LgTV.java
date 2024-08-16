package kr.or.iei.after.model.vo;

public class LgTV extends TV{

	public LgTV() {
		
	}

	public LgTV(boolean power, int channerl, int volume, int inch) {
		super(power, channerl, volume, inch);
	}
	
	public void showYoutube() {
		System.out.println("showYoutube() method");
	}
	
	@Override
	public void whoAmI() {
		System.out.println("I am LGTV");
	}
}
