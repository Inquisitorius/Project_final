package com.zerock.test.dto;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class UserDTO {
    private String id;
    private String pwd;
    private String name;
    private String mail;
    private String number;
    private String gender;
    private LocalDate birthDate; 
    private String Street_address;
    private String detail_address;
    private int password_reset;


    public UserDTO() {
    }

    public UserDTO(String id, String pwd, String name, String mail, String number, String gender, LocalDate birthDate, String Street_address, String detail_address, int password_reset) {
        this.id = id;
        this.pwd = pwd;
        this.name = name;
        this.mail = mail;
        this.number = number;
        this.gender = gender;
        this.birthDate = birthDate;
        this.setStreet_address(Street_address);
        this.setDetail_address(detail_address);
        this.setPassword_reset(password_reset);
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

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
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
}
