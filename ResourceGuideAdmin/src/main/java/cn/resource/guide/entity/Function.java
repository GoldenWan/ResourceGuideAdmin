package cn.resource.guide.entity;

public class Function {
	int id;
	String name;
	String remark;
	int state;
	String submittime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getSubmittime() {
		return submittime;
	}
	public void setSubmittime(String submittime) {
		this.submittime = submittime;
	}
	@Override
	public String toString() {
		return "Function [id=" + id + ", name=" + name + ", remark=" + remark + ", state=" + state + ", submittime="
				+ submittime + "]";
	}

}
