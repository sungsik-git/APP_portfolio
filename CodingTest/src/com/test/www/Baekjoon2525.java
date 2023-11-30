package com.test.www;

import java.util.Scanner;

public class Baekjoon2525 {
	public static void main(String[] args)  {
		//인공지능 오븐을 사용하는 방법은 적당한 양의 오리 훈제 재료를 인공지능 오븐에 넣으면 된다. 그러면 인공지능 오븐은 오븐구이가 끝나는 시간을 분 단위로 자동적으로 계산한다. 
		
		Scanner sc = new Scanner(System.in);

		int time = sc.nextInt();
		int min = sc.nextInt();
		int lead = sc.nextInt();			//타이머시간
		
		int leadTime = (min+lead)/60;		//걸리는 시간
		int leadMin = (min+lead)%60;		//걸리는 분
		
		if(leadTime > 0) {
			time += leadTime;
			min = leadMin;
		}else if(leadTime > 0 && leadMin == 0) {
			time += 1;
			min = 0;
		}else if(leadTime == 0 && leadMin > 0) {
			min += lead;
		}
		
		if(time >= 24) {
			time -= 24;
		}
		System.out.println(time + " " + min);
	}
}