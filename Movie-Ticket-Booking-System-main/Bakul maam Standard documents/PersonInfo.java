package example.demo.entities;

import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="personsinfo")
public class PersonInfo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int pid;
	@Column
	String name;
	//this is LONGBLOB column in database
	@Column
	byte [] picture;
	public PersonInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public byte [] getPicture() {
		return picture;
	}
	public void setPicture(byte [] picture) {
		this.picture = picture;
	}
	
}
