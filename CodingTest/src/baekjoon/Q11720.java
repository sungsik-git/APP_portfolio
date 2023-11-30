package baekjoon;

import java.io.IOException;
import java.util.Scanner;

public class Q11720 {
	public static void main(String[] args) throws IOException  {
		//N개의 숫자가 공백 없이 쓰여있다. 이 숫자를 모두 합해서 출력하는 프로그램을 작성하시오.

		Scanner sc = new Scanner(System.in);
		
		int N = sc.nextInt();
		String str = sc.next();
		int sum = 0;
		sc.close();
		
		for (int i = 0; i < N; i++) {
			sum += str.charAt(i)-'0';
		}
		
		
		System.out.println(sum);
		
	}
}