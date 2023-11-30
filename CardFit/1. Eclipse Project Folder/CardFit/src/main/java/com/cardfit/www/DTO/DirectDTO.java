package com.cardfit.www.DTO;

public class DirectDTO {
	
	//DirectInqiry Table
	private int num;
	private String title;
	private String writer;
	private String category;
	private String contents;
	private String wtime;
	private int answercheck;
	
	//DirectAnswer Table
	private String answer;
	private String answertime;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWtime() {
		return wtime;
	}
	public void setWtime(String wtime) {
		this.wtime = wtime;
	}
	public int getAnswercheck() {
		return answercheck;
	}
	public void setAnswercheck(int answercheck) {
		this.answercheck = answercheck;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getAnswertime() {
		return answertime;
	}
	public void setAnswertime(String answertime) {
		this.answertime = answertime;
	}
	
}
