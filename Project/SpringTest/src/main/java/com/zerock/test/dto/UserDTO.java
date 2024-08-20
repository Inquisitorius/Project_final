package com.zerock.test.dto;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class UserDTO {
    private String id;
    private String pwd;
    private String name;
    private String email;
    private String phone;
    private String gender;
    private LocalDate birthDate; 
    private String Street_address;
    private String detail_address;
    private String expJibunAddr;
    private int password_reset;
    private boolean is_admin;
    
    private String brithString;

	public UserDTO() {
    }

    public UserDTO(String id, String pwd, String name, String email, String phone, String gender, LocalDate birthDate, String Street_address, String detail_address, int password_reset, int expJibunAddr, boolean is_admin) {
        this.id = id;
        this.pwd = pwd;
        this.name = name;
        this.setEmail(email);
        this.setPhone(phone);
        this.gender = gender;
        this.birthDate = birthDate;
        this.setStreet_address(Street_address);
        this.setDetail_address(detail_address);
        this.setPassword_reset(password_reset);
        this.is_admin = is_admin;
    }
    
    public String getBrithString() {
		return brithString;
	}

	public void setBrithString(String brithString) {
		this.brithString = brithString;
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





    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String year, String month, String day) {
        this.birthDate = LocalDate.parse(year + "-" + month + "-" + day, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    }

	public String getStreet_address() {
		return Street_address;
	}

	public void setStreet_address(String street_address) {
		Street_address = street_address;
	}

	public String getDetail_address() {
		return detail_address;
	}

	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}

	public int getPassword_reset() {
		return password_reset;
	}

	public void setPassword_reset(int password_reset) {
		this.password_reset = password_reset;
	}

	public String getExpJibunAddr() {
		return expJibunAddr;
	}

	public void setExpJibunAddr(String expJibunAddr) {
		this.expJibunAddr = expJibunAddr;
	}

	public boolean isIs_admin() {
		return is_admin;
	}

	public void setIs_admin(boolean is_admin) {
		this.is_admin = is_admin;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
