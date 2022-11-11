package com.example.demo.entities;

import java.io.Serializable;

public class TheaterScreenID implements Serializable{
	
	int tid;
	
	int screen_no;

	public TheaterScreenID() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TheaterScreenID(int tid, int screen_no) {
		super();
		this.tid = tid;
		this.screen_no = screen_no;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public int getScreen_no() {
		return screen_no;
	}

	public void setScreen_no(int screen_no) {
		this.screen_no = screen_no;
	}
	
	
	
	
	
}
