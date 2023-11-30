package baekjoon;

import java.util.Scanner;

public class Q10871 {
	public static void main(String[] args)  {
		//정수 N개로 이루어진 수열 A와 정수 X가 주어진다. 이때, A에서 X보다 작은 수를 모두 출력하는 프로그램을 작성하시오.
		
		Scanner sc = new Scanner(System.in);

		int size = sc.nextInt();
		int num = sc.nextInt();
		int[] arr = new int[size];
		
		for(int i=0; i<size; i++) {
			arr[i] = sc.nextInt();
		}
		
		for (int e : arr) {
			if(e < num) {
				System.out.print(e + " ");
			}
		}
	}
}