package baekjoon;

import java.io.IOException;
import java.util.Scanner;

public class Q11654 {
	public static void main(String[] args) throws IOException  {
		//알파벳 소문자, 대문자, 숫자 0-9중 하나가 주어졌을 때, 주어진 글자의 아스키 코드값을 출력하는 프로그램을 작성하시오.

		Scanner sc = new Scanner(System.in);
		
//		int ch = sc.next().charAt(0);
//		System.out.println(ch);
		
		
		//byte 값으로 문자 한 개만 읽으면서 아스키코드 값을 가져온다.
		int ch2 = System.in.read();
		System.out.println(ch2);
	}
}