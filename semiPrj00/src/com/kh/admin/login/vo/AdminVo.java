package com.kh.admin.login.vo;



public class AdminVo {
	
	public AdminVo() {
		
	}
	
	public AdminVo(String no, String id, String pwd, String name) {
		super();
		this.no = no;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
	}
	
	private String no;
	private String id;
	private String pwd;
	private String name;
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "adminVo [no=" + no + ", id=" + id + ", pwd=" + pwd + ", name=" + name + "]";
	}
	
	
	

}
