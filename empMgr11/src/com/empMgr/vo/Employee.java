package com.empMgr.vo;

import java.sql.*;

import lombok.*;

@Data
public class Employee {
	private int employeeId;
	private String firstName;
	private String lastName;
	private int managerId;
	private String managerFirstName;
	private String managerLastName;
	private String email;
	private String phoneNumber;
	private Date hireDate;
	private String jobTitle;
	private int salary;
	private double commissionPct;
	private String departmentName;
	private String city;
	private String jobId;
	private int departmentId;
}
