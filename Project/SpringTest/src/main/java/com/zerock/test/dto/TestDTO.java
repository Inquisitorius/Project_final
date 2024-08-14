package com.zerock.test.dto;

public class TestDTO {
    private Long userCode; 
    private String userName; 
    
    public TestDTO() {
    }

    public TestDTO(Long userCode, String userName) {
        this.userCode = userCode;
        this.userName = userName;
    }

    public Long getUserCode() {
        return userCode;
    }

    public void setUserCode(Long userCode) {
        this.userCode = userCode;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Override
    public String toString() {
        return "TestDTO{" +
                "userCode=" + userCode +
                ", userName='" + userName + '\'' +
                '}';
    }
}
