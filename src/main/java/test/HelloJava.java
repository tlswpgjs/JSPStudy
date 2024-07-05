package test;

public class HelloJava {
	
	//static으로 선언했으므로 인스턴스 생성없이 클래스명으로
	//즉시 호출 가능함.
	public static int myFn() {
		int sum = 0;
		for(int i=1 ; i<=10 ; i++) {
			sum += i;
		}
		return sum;
	}
	//일반 멤버메서드 이므로 인스턴스 생성 후 호출해야 함.
	public int myFn(int s, int e) {
		int sum = 0;
		for(int i=s ; i<=e ; i++) {
			sum += i;
		}
		return sum;
	}
	public static void main(String[] args) {
		System.out.println("Hello Java...!!");

	}

}
