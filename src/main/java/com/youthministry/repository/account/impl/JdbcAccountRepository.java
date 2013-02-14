package com.youthministry.repository.account.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.inject.Inject;

import org.springframework.dao.DuplicateKeyException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.youthministry.repository.account.Account;
import com.youthministry.repository.account.AccountRepository;
import com.youthministry.repository.account.UsernameAlreadyInUseException;

@Repository
public class JdbcAccountRepository implements AccountRepository {

	private final JdbcTemplate jdbcTemplate;

	private final PasswordEncoder passwordEncoder;

	@Inject
	public JdbcAccountRepository(JdbcTemplate jdbcTemplate, PasswordEncoder passwordEncoder) {
		this.jdbcTemplate = jdbcTemplate;
		this.passwordEncoder = passwordEncoder;
	}
	
	@Transactional
	public void createAccount(Account user) throws UsernameAlreadyInUseException {
		try {
			jdbcTemplate.update(
					"insert into Account (username, password, firstName, lastName) values (?, ?, ?, ?)"
					, user.getUsername(), passwordEncoder.encode(user.getPassword()), user.getFirstName(), user.getLastName());
		} catch(DuplicateKeyException e) {
			throw new UsernameAlreadyInUseException(user.getUsername());
		}
	}

	@Override
	public Account findAccountByUsername(String username) {
		return jdbcTemplate.queryForObject("select username, firstName, lastName from Account where username = ?",
				new RowMapper<Account>() {
				public Account mapRow(ResultSet rs, int rowNum) throws SQLException {
					return new Account(rs.getString("username"), null, rs.getString("firstName"), rs
							.getString("lastName"));
				}
		}, username);
	}

}
