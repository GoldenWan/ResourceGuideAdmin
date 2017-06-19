package cn.resource.guide.entity;

public class User {
	String id;
	String username;
	String password;
	String qq;
	String weixin;
	String telephone;
	String identitynumber;
	String email;
	int state;
	String registertime;
	String registerip;
	String realname;
	String sex;
	String alias;
	int score;
	int islock;
	
	
	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getQq() {
		return qq;
	}


	public void setQq(String qq) {
		this.qq = qq;
	}


	public String getWeixin() {
		return weixin;
	}


	public void setWeixin(String weixin) {
		this.weixin = weixin;
	}


	public String getTelephone() {
		return telephone;
	}


	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}


	public String getIdentitynumber() {
		return identitynumber;
	}


	public void setIdentitynumber(String identitynumber) {
		this.identitynumber = identitynumber;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public int getState() {
		return state;
	}


	public void setState(int state) {
		this.state = state;
	}


	public String getRegistertime() {
		return registertime;
	}


	public void setRegistertime(String registertime) {
		this.registertime = registertime;
	}


	public String getRegisterip() {
		return registerip;
	}


	public void setRegisterip(String registerip) {
		this.registerip = registerip;
	}


	public String getRealname() {
		return realname;
	}


	public void setRealname(String realname) {
		this.realname = realname;
	}


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getAlias() {
		return alias;
	}


	public void setAlias(String alias) {
		this.alias = alias;
	}


	public int getScore() {
		return score;
	}


	public void setScore(int score) {
		this.score = score;
	}


	public int getIslock() {
		return islock;
	}


	public void setIslock(int islock) {
		this.islock = islock;
	}


	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", qq=" + qq + ", weixin="
				+ weixin + ", telephone=" + telephone + ", identitynumber=" + identitynumber + ", email=" + email
				+ ", state=" + state + ", registertime=" + registertime + ", registerip=" + registerip + ", realname="
				+ realname + ", sex=" + sex + ", alias=" + alias + ", score=" + score + ", islock=" + islock + "]";
	}
}
