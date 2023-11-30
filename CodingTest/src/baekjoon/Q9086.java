package baekjoon;

import java.util.Scanner;

public class Q9086 {
	public static void main(String[] args)  {
		//$S$와 정수 $i$가 주어졌을 때, $S$의 $i$번째 글자를 출력하는 프로그램을 작성하시오

		Scanner sc = new Scanner(System.in);
		
		int n = sc.nextInt();
		String[] arr = new String[n];
		
		for(int i=0; i<n ; i++) {
			String s = sc.next();
			String front = s.substring(0,1);
			String back = s.substring(s.length()-1, s.length());
			arr[i] = front + back;
		}
		for (String s : arr) {
			System.out.println(s);
		}
	}
}