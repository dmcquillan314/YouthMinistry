package com.youthministry.repository.account;

public class Account {
	private String username;
	private String password;
	private String firstName;
	private String lastName;
	//TODO: add group entry
	

	public Account(String username, String password, String firstName, String lastName) {
		this.username = username;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}
}
