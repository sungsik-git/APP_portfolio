package baekjoon;

import java.util.Scanner;

public class Q10951 {
	public static void main(String[] args)  {
		//두 정수 A와 B를 입력받은 다음, A+B를 출력하는 프로그램을 작성하시오.
		Scanner sc = new Scanner(System.in);

		while(sc.hasNextInt()){
			int num1 = sc.nextInt();
			int num2 = sc.nextInt();
			int sum = 0;
			sum = num1 + num2;
			System.out.println(sum);
		}
		sc.close();
	}
}