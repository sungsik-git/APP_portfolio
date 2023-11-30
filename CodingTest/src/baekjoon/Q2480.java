package baekjoon;

import java.util.Scanner;

public class Q2480 {
	public static void main(String[] args)  {
		//1에서부터 6까지의 눈을 가진 3개의 주사위를 던져서 다음과 같은 규칙에 따라 상금을 받는 게임이 있다. 

		//같은 눈이 3개가 나오면 10,000원+(같은 눈)×1,000원의 상금을 받게 된다. 
		//같은 눈이 2개만 나오는 경우에는 1,000원+(같은 눈)×100원의 상금을 받게 된다. 
		//모두 다른 눈이 나오는 경우에는 (그 중 가장 큰 눈)×100원의 상금을 받게 된다.  

		//3개 주사위의 나온 눈이 주어질 때, 상금을 계산하는 프로그램을 작성 하시오. 
		
		Scanner sc = new Scanner(System.in);

		int a = sc.nextInt();
		int b = sc.nextInt();
		int c = sc.nextInt();	
		int max = 0;
		
		if(a != b && a != c && b != c) {
			if(a>b) {
				if(b>c) {
					max=a;
				}else if(b<c) {
					if(a>c) {
						max=a;
					}else if(a<c) {
						max=c;
					}
				}
			}else if(a<b) {
				if(b>c) {
					max=b;
				}else if(b<c){
					max=c;
				}
			}
			System.out.println(max * 100);
		}else {
			if (a == b && a == c) {
				System.out.println(10000 + a * 1000);
			}
			else {
				if(a == b || a == c) {
					System.out.println(1000 + a * 100);
				}
				else {
					System.out.println(1000 + b * 100);
				}
			}
		}
	}
}