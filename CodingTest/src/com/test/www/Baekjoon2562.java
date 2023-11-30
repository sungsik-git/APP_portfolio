package com.test.www;

import java.util.Scanner;

public class Baekjoon2562 {
	public static void main(String[] args)  {
		//9개의 서로 다른 자연수가 주어질 때, 이들 중 최댓값을 찾고 그 최댓값이 몇 번째 수인지를 구하는 프로그램을 작성하시오.

		Scanner sc = new Scanner(System.in);

		
		int[] arr = new int[9];
		
		for(int i=0; i<9; i++) {
			arr[i] = sc.nextInt();
		}
		
		int max = arr[0];
		int cnt = 1;
		
        for(int i=1; i<9; i++){
            if(max < arr[i]){
                max = arr[i];
                cnt = i+1;
            }
        }

		System.out.println(max);
		System.out.println(cnt);
		
	}
}