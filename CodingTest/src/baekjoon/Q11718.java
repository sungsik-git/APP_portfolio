package baekjoon;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Q11718 {
	public static void main(String[] args) throws NumberFormatException, IOException  {
		//입력 받은 대로 출력하는 프로그램을 작성하시오.

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		String str;
		
		while((str=br.readLine()) != null) {
			System.out.println(str);
		}
	}
}