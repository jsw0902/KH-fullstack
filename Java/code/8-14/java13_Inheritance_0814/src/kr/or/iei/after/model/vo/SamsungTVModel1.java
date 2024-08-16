package kr.or.iei.after.model.vo;

public class SamsungTVModel1 extends SamsungTV{

	public SamsungTVModel1() {
		
	}

	public SamsungTVModel1(boolean power, int channerl, int volume, int inch) {
		super(power, channerl, volume, inch);
	}
	@Override
	public void whoAmI() {
		System.out.println("I am SamsungTVModel1");
	}
}
