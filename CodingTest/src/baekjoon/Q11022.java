package baekjoon;

import java.util.Scanner;

public class Q11022 {
	public static void main(String[] args)  {
		//A+B를 조금 더 아름답게 출력하는 문제

		Scanner sc = new Scanner(System.in);
		
		int cnt = sc.nextInt();
		
		int i=0;
		while(i<cnt) {
			int num1 = sc.nextInt();
			int num2 = sc.nextInt();
			
			System.out.println("Case #" + (i+1) + ": " + num1 + " + " + num2 + " = " + (num1 + num2) );
			i++;
		}
		sc.close();
	}
}
