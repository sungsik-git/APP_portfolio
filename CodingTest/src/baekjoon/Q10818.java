package baekjoon;

import java.util.Scanner;

public class Q10818 {
	public static void main(String[] args)  {
		//N개의 정수가 주어진다. 이때, 최솟값과 최댓값을 구하는 프로그램을 작성하시오.

		Scanner sc = new Scanner(System.in);

		int size = sc.nextInt();
		
		int[] arr = new int[size];
		
		for(int i=0; i<size; i++) {
			arr[i] = sc.nextInt();
		}
		
		int max = arr[0];
		int min = arr[0];
		
		for(int i=0; i<size; i++) {
			if(arr[i]>max) {
				max = arr[i];
			}
		}
		
		for(int i=0; i<size; i++) {
			if(arr[i]<min) {
				min = arr[i];
			}
		}
		System.out.println(min + " " + max);
	}
}