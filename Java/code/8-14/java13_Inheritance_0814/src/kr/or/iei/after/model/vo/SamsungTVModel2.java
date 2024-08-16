package kr.or.iei.after.model.vo;

public class SamsungTVModel2 extends SamsungTV{

	public SamsungTVModel2() {
		
	}

	public SamsungTVModel2(boolean power, int channerl, int volume, int inch) {
		super(power, channerl, volume, inch);
	}
	@Override
	public void whoAmI() {
		System.out.println("I am SamsungTVModel2");
	}
}
