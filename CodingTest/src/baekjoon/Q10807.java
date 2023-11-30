package baekjoon;

import java.util.Scanner;

public class Q10807 {
	public static void main(String[] args)  {
		//총 N개의 정수가 주어졌을 때, 정수 v가 몇 개인지 구하는 프로그램을 작성하시오.
		
		Scanner sc = new Scanner(System.in);

		int cnt = sc.nextInt();
		int[] arr = new int[cnt];
		
		
		for (int i = 0; i < cnt; i++) {
			arr[i] += sc.nextInt();
		}
		
		int target = sc.nextInt();
		int targetCnt = 0;
		
		for (int i = 0; i < arr.length; i++) {
			if(arr[i] == target) {
				targetCnt++;
			}
		}
		System.out.println(targetCnt);
	}
}