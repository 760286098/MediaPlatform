package com.AnalyzeSystem.model;

import java.util.Date;

public class UserInfo {
    private int userId;
    private String name;
    private String password;
    private String departmentName;
    private String studentNumber;
    private String phoneNumber;
    private String startYear;
    private String description;
    private Date registerTime;

    public int getUserId() {
        return userId;
    }

    public String getName() {
        return name;
    }

    public String getPassword() {
        return password;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public String getStudentNumber() {
        return studentNumber;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }



    public String getStartYear() {
        return startYear;
    }

    public String getDescription() {
        return description;
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public void setStudentNumber(String studentNumber) {
        this.studentNumber = studentNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setStartYear(String startYear) {
        this.startYear = startYear;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }
}
