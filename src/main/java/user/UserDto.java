package user;

public class UserDto {

	private String name,email,phone,password,gender;
	int reqrat,riderat;

	public int getReqRat() {
		return reqrat;
	}

	public void setReqRat(int reqrat) {
		this.reqrat = reqrat;
	}

	public int getRideRat() {
		return riderat;
	}

	public void setRideRat(int riderat) {
		this.riderat = riderat;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}
