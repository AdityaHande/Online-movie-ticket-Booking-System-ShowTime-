package com.example.demo.entities;

import javax.persistence.Id;
import javax.persistence.IdClass;

@IdClass(TheaterScreenID.class)
public class TheaterScreen {
    @Id
    int tid;
    
    @Id
    int screen_no;

	public TheaterScreen() {
		super();
		// TODO Auto-generated constructor stub
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
