package controller;

public class Profile {
private String email,firstname,lastname,address,status;
public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}



private int id;
private long mobile;



public long getMobile() {
	return mobile;
}

public void setMobile(long mobile) {
	this.mobile = mobile;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getFirstname() {
	return firstname;
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public void setFirstname(String firstname) {
	this.firstname = firstname;
}

public String getLastname() {
	return lastname;
}

public void setLastname(String lastname) {
	this.lastname = lastname;
}

public String getAddress() {
	return address;
}



public void setAddress(String address) {
	this.address = address;
}


}
