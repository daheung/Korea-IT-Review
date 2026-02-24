package casting01;

public class TvMain {
	public static void main(String[] args) {
		Tv tv = new Tv();
		System.out.println(tv);
		
		tv.chUp();
		
		SmartTv sTv = new SmartTv();
		System.out.println(sTv);
		
		sTv.netflix();
		sTv.chUp();
		
		Tv tv2 = sTv;
		
		Tv tv3 = new SmartTv();
		Tv tv4 = sTv;
		
		SmartTv sTv3 = (SmartTv)tv3;
		sTv3.netflix();
		
//		SmartTv sTv4 = (SmartTv) new Tv();
//		System.out.println(sTv4);
	}
}
